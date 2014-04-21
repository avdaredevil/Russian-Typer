<#
|===============================================================>|
   Russian Typer by APoorv Verma [AP] on 10/18/2013
|===============================================================>|
      $) Live Text Conversion
      $) Allows Clear Line By Ctrl+BckSpace
      $) Capitalization Support
      $) Bulgarian Mods Support
|===============================================================>|
#>
param([Switch]$Bulgarian, $Text2Convert, [switch]$HideSpecKeys)

$Text = "Enter Phonetic Text : "
function Convert-Text($Text) {
    $Mapper = @(
        @("ew","iyoo"),
        @("ph","f"),
        @("qu","cw"),
        @("q","c"),
        @("x","cs"),
        @("w","v"),
        @("j","dzh"),
        @("ia","ya"),
        @("ai","ay"),
        @("the","de"),
        @("th","z"),
        @("ck","c"),
        #-----------
        @("''","ъ"),
        @("'","ь"),
        @(("yu","yoo"),"ю"),
        @("ya","я"),
        @("yo","ё"),
        @("ye","е"),
        @("ch","ч"),
        @("ih","ы"),
        @(("u","oo"),"у"),
        @(("ee","i"),"и"),
        @(("eh","e"),"э"),
        @("sht","щ"),
        @("shч","щ"),
        @("sh","ш"),
        @("ts","ц"),
        @("zh","ж"),
        @("v","в"),
        @("r","р"),
        @("t","т"),
        @("o","о"),
        @("p","п"),
        @("a","а"),
        @("s","с"),
        @("d","д"),
        @("f","ф"),
        @("g","г"),
        @("h","х"),
        @("y","й"),
        @(("c","k"),"к"),
        @("l","л"),
        @("z","з"),
        @("b","б"),
        @("n","н"),
        @("m","м"),
        @("'''","")
    )
    if ($Bulgarian) {$Mapper += ("э","е"),("ы","и")}
    foreach ($Map in $Mapper) {
        $Map[0] | % {$Text = $Text.replace(($_).toUpper(),($Map[1]).toUpper()) -replace($_,$Map[1])}
    }
    return $Text
}
if ($Text2Convert) {return (Convert-Text $Text2Convert);exit}
$ErrorActionPreferenceO = $ErrorActionPreference
$ErrorActionPreference  = "SilentlyContinue"
. (Resolve-path Modules.ps1,.\Modules.ps1)[0] 2>&1>$null
$ErrorActionPreference  = $ErrorActionPreferenceO
if (!$HideSpecKeys) {Write-host "Special Keys : ' -> ь | '' -> ъ | ''' -> prevents sticky letters"}
Write-host -nonewline $Text
$ReRegX = '[^\x01-\x08\x10-\x80]+'#'[^\w\.]' [А-яЁё]
$TrString = ""
$Cvis = [Console]::CursorVisible
[Console]::CursorVisible = $False
if (!$ShowMaskedPsw) {$Validator={3}}
$Count = 1;$Sleep = 0
While ($True) {
    if ($count -gt 100) {$Sleep = 250}
    if ($Host.UI.RawUI.KeyAvailable) {$Store = $Host.UI.RawUI.ReadKey("IncludeKeyUp,NoEcho");$Count=0;$Sleep=0} else {$Count++;Start-Sleep -m $Sleep;continue}
    if (KeyPressed "~~BackSpace~~" $Store) {if ($store.ControlKeyState -match "ctrl") {$TrString=""} else {$TrString = ?: ($TrString.Length -eq 0){""}{$TrString.substring(0,$TrString.Length-1)}}}
    elseif (KeyPressed "~~Space~~" $Store) {$TrString += " "}
    elseif (KeyPressed "~~Escape~~" $Store) {$TrString="";$DString="";break}
    elseif ((KeyPressed "r","l" $Store) -and ($store.ControlKeyState -match "ctrl")) {$ReturnEnglish = !$ReturnEnglish}
    elseif (KeyPressed "~~ENTER~~" $Store) {Write-Host "";break} else 
    {$TrString += $Store.Character -replace ($ReRegX,'')}
    $wt = [Console]::BufferWidth - $text.length - 1
    [Console]::Cursorleft = $text.length
    $DString = Convert-Text $trString
    if ($wt-$DString.Length -lt 0) {
        $tb=""
        $tt="..."+$DString.substring($DString.Length-$wt+3)
    } else {
        $tb=" "*($wt-$DString.Length)
        $tt=$DString
    }
    $fcol = [console]::ForegroundColor
    Write-host -nonewline -f $fCol $tt$Tb
}
$ReturnEnglish = $false
[Console]::CursorVisible = $Cvis
return $DString
#return $TrString