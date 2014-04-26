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
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler Version [1.0] To Make this program independent of AP-Core Engine
# ==================================================================================================================|
iex ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("ZnVuY3Rpb24gSW52b2tlLVRlcm5hcnkgewoKcGFyYW0oW2Jvb2xdJGRlY2lkZXIsIFtzY3JpcHRibG9ja10kaWZ0cnVlLCBbc2NyaXB0YmxvY2tdJGlmZmFsc2UpDQoNCiAgICBpZiAoJGRlY2lkZXIpIHsgJiRpZnRydWV9IGVsc2UgeyAmJGlmZmFsc2UgfQ0KfQoKZnVuY3Rpb24gS2V5UHJlc3NlZCB7CgpwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldW1N0cmluZ1tdXSRLZXksICRTdG9yZT0iXl5eIikNCg0KICAgIGlmICgkU3RvcmUgLWVxICJeXl4iIC1hbmQgJEhvc3QuVUkuUmF3VUkuS2V5QXZhaWxhYmxlKSB7JFN0b3JlID0gJEhvc3QuVUkuUmF3VUkuUmVhZEtleSgiSW5jbHVkZUtleVVwLE5vRWNobyIpfSBlbHNlIHtpZiAoJFN0b3JlIC1lcSAiXl5eIikge3JldHVybiAkRmFsc2V9fQ0KICAgICRBbnMgPSAkRmFsc2UNCiAgICAkS2V5IHwgJSB7DQogICAgICAgICRTT1VSQ0UgPSAkXw0KICAgICAgICB0cnkgew0KICAgICAgICAgICAgJEFucyA9ICRBbnMgLW9yIChLZXlQcmVzc2VkQ29kZSAkU09VUkNFICRTdG9yZSkNCiAgICAgICAgfSBjYXRjaCB7DQogICAgICAgICAgICBGb3JlYWNoICgkSyBpbiAkU09VUkNFKSB7DQogICAgICAgICAgICAgICAgW1N0cmluZ10kSyA9ICRLDQogICAgICAgICAgICAgICAgaWYgKCRLLmxlbmd0aCAtZ3QgNCAtYW5kICgkS1swLDEsLTEsLTJdIC1qb2luKCIiKSkgLWVxICJ+fn5+Iikgew0KICAgICAgICAgICAgICAgICAgICAkQW5zID0gJEFOUyAtb3IgKEtleVByZXNzZWRDb2RlIChLZXlUcmFuc2xhdGUoJEspKSAkU3RvcmUpDQogICAgICAgICAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgICAgICAgICAgJEFucyA9ICRBTlMgLW9yICgkSy5jaGFycygwKSAtaW4gJFN0b3JlLkNoYXJhY3RlcikNCiAgICAgICAgICAgICAgICB9DQogICAgICAgICAgICB9DQogICAgICAgIH0NCiAgICB9DQogICAgcmV0dXJuICRBbnMNCn0KClNldC1BbGlhcyA/OiBJbnZva2UtVGVybmFyeQ==")))
# ========================================END=OF=COMPILER===========================================================|
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
        @("''","?"),
        @("'","?"),
        @(("yu","yoo"),"?"),
        @("ya","?"),
        @("yo","?"),
        @("ye","?"),
        @("ch","?"),
        @("ih","?"),
        @(("u","oo"),"?"),
        @(("ee","i"),"?"),
        @(("eh","e"),"?"),
        @("sht","?"),
        @("sh?","?"),
        @("sh","?"),
        @("ts","?"),
        @("zh","?"),
        @("v","?"),
        @("r","?"),
        @("t","?"),
        @("o","?"),
        @("p","?"),
        @("a","?"),
        @("s","?"),
        @("d","?"),
        @("f","?"),
        @("g","?"),
        @("h","?"),
        @("y","?"),
        @(("c","k"),"?"),
        @("l","?"),
        @("z","?"),
        @("b","?"),
        @("n","?"),
        @("m","?"),
        @("'''","")
    )
    if ($Bulgarian) {$Mapper += ("?","?"),("?","?")}
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
if (!$HideSpecKeys) {Write-host "Special Keys : ' -> ? | '' -> ? | ''' -> prevents sticky letters"}
Write-host -nonewline $Text
$ReRegX = '[^\x01-\x08\x10-\x80]+'#'[^\w\.]' [?-???]
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
