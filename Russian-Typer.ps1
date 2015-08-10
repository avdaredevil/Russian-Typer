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
iex ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("ZnVuY3Rpb24gS2V5UHJlc3NlZENvZGUge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bSW50XSRLZXksICRTdG9yZT0iXl5eIikNCg0KICAgIGlmICghJEhvc3QuVUkuUmF3VUkuS2V5QXZhaWxhYmxlIC1hbmQgJFN0b3JlIC1lcSAiXl5eIikge1JldHVybiAkRmFsc2V9DQogICAgaWYgKCRTdG9yZSAtZXEgIl5eXiIpIHskU3RvcmUgPSAkSG9zdC5VSS5SYXdVSS5SZWFkS2V5KCJJbmNsdWRlS2V5VXAsTm9FY2hvIil9DQogICAgcmV0dXJuICgkS2V5IC1pbiAkU3RvcmUuVmlydHVhbEtleUNvZGUpDQp9CgpmdW5jdGlvbiBJbnZva2UtVGVybmFyeSB7cGFyYW0oW2Jvb2xdJGRlY2lkZXIsIFtzY3JpcHRibG9ja10kaWZ0cnVlLCBbc2NyaXB0YmxvY2tdJGlmZmFsc2UpDQoNCiAgICBpZiAoJGRlY2lkZXIpIHsgJiRpZnRydWV9IGVsc2UgeyAmJGlmZmFsc2UgfQ0KfQoKZnVuY3Rpb24gS2V5VHJhbnNsYXRlIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldW1N0cmluZ10kS2V5KQ0KDQogICAgJEhhc2hLZXkgPSBAKA0KICAgICAgICAoIn5+U3BhY2V+fiIsMzIpLA0KICAgICAgICAoIn5+RVNDQVBFfn4iLDI3KSwNCiAgICAgICAgKCJ+fkVudGVyfn4iLDEzKSwNCiAgICAgICAgKCJ+flNoaWZ0fn4iLDE2KSwNCiAgICAgICAgKCJ+fkNvbnRyb2x+fiIsMTcpLA0KICAgICAgICAoIn5+QWx0fn4iLDE4KSwNCiAgICAgICAgKCJ+fkJhY2tTcGFjZX5+Iiw4KSwNCiAgICAgICAgKCJ+fkRlbGV0ZX5+Iiw0NiksDQogICAgICAgICgifn5mMX5+IiwxMTIpLA0KICAgICAgICAoIn5+ZjJ+fiIsMTEzKSwNCiAgICAgICAgKCJ+fmYzfn4iLDExNCksDQogICAgICAgICgifn5mNH5+IiwxMTUpLA0KICAgICAgICAoIn5+ZjV+fiIsMTE2KSwNCiAgICAgICAgKCJ+fmY2fn4iLDExNyksDQogICAgICAgICgifn5mN35+IiwxMTgpLA0KICAgICAgICAoIn5+Zjh+fiIsMTE5KSwNCiAgICAgICAgKCJ+fmY5fn4iLDEyMCksDQogICAgICAgICgifn5mMTB+fiIsMTIxKSwNCiAgICAgICAgKCJ+fmYxMX5+IiwxMjIpLA0KICAgICAgICAoIn5+ZjEyfn4iLDEyMyksDQogICAgICAgICgifn5NdXRlfn4iLDE3MyksDQogICAgICAgICgifn5JbnNlcnR+fiIsNDUpLA0KICAgICAgICAoIn5+UGFnZVVwfn4iLDMzKSwNCiAgICAgICAgKCJ+flBhZ2VEb3dufn4iLDM0KSwNCiAgICAgICAgKCJ+fkVORH5+IiwzNSksDQogICAgICAgICgifn5IT01Ffn4iLDM2KSwNCiAgICAgICAgKCJ+fnRhYn5+Iiw5KSwNCiAgICAgICAgKCJ+fkNhcHNMb2Nrfn4iLDIwKSwNCiAgICAgICAgKCJ+fk51bUxvY2t+fiIsMTQ0KSwNCiAgICAgICAgKCJ+fldpbmRvd3N+fiIsOTEpLA0KICAgICAgICAoIn5+TGVmdH5+IiwzNyksDQogICAgICAgICgifn5VcH5+IiwzOCksDQogICAgICAgICgifn5SaWdodH5+IiwzOSksDQogICAgICAgICgifn5Eb3dufn4iLDQwKSwNCiAgICAgICAgKCJ+fktQMH5+Iiw5NiksDQogICAgICAgICgifn5LUDF+fiIsOTcpLA0KICAgICAgICAoIn5+S1Ayfn4iLDk4KSwNCiAgICAgICAgKCJ+fktQM35+Iiw5OSksDQogICAgICAgICgifn5LUDl+fiIsMTAwKSwNCiAgICAgICAgKCJ+fktQNX5+IiwxMDEpLA0KICAgICAgICAoIn5+S1A2fn4iLDEwMiksDQogICAgICAgICgifn5LUDd+fiIsMTAzKSwNCiAgICAgICAgKCJ+fktQOH5+IiwxMDQpLA0KICAgICAgICAoIn5+S1A5fn4iLDEwNSkNCiAgICApDQogICAgdHJ5IHsNCiAgICAgICAgW2ludF0kQ29udmVydCA9ICgkSGFzaEtleSAtbWF0Y2ggJEtleSlbMF1bMV0NCiAgICB9IGNhdGNoIHt9DQogICAgaWYgKCRDb252ZXJ0IC1lcSAkTnVsbCkge1Rocm93ICJJbnZhbGlkIFNwZWNpYWwgS2V5IENvbnZlcnNpb24ifQ0KICAgIHJldHVybiAkQ29udmVydA0KfQoKZnVuY3Rpb24gS2V5UHJlc3NlZCB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtTdHJpbmdbXV0kS2V5LCAkU3RvcmU9Il5eXiIpDQoNCiAgICBpZiAoJFN0b3JlIC1lcSAiXl5eIiAtYW5kICRIb3N0LlVJLlJhd1VJLktleUF2YWlsYWJsZSkgeyRTdG9yZSA9ICRIb3N0LlVJLlJhd1VJLlJlYWRLZXkoIkluY2x1ZGVLZXlVcCxOb0VjaG8iKX0gZWxzZSB7aWYgKCRTdG9yZSAtZXEgIl5eXiIpIHtyZXR1cm4gJEZhbHNlfX0NCiAgICAkQW5zID0gJEZhbHNlDQogICAgJEtleSB8ICUgew0KICAgICAgICAkU09VUkNFID0gJF8NCiAgICAgICAgdHJ5IHsNCiAgICAgICAgICAgICRBbnMgPSAkQW5zIC1vciAoS2V5UHJlc3NlZENvZGUgJFNPVVJDRSAkU3RvcmUpDQogICAgICAgIH0gY2F0Y2ggew0KICAgICAgICAgICAgRm9yZWFjaCAoJEsgaW4gJFNPVVJDRSkgew0KICAgICAgICAgICAgICAgIFtTdHJpbmddJEsgPSAkSw0KICAgICAgICAgICAgICAgIGlmICgkSy5sZW5ndGggLWd0IDQgLWFuZCAoJEtbMCwxLC0xLC0yXSAtam9pbigiIikpIC1lcSAifn5+fiIpIHsNCiAgICAgICAgICAgICAgICAgICAgJEFucyA9ICRBTlMgLW9yIChLZXlQcmVzc2VkQ29kZSAoS2V5VHJhbnNsYXRlKCRLKSkgJFN0b3JlKQ0KICAgICAgICAgICAgICAgIH0gZWxzZSB7DQogICAgICAgICAgICAgICAgICAgICRBbnMgPSAkQU5TIC1vciAoJEsuY2hhcnMoMCkgLWluICRTdG9yZS5DaGFyYWN0ZXIpDQogICAgICAgICAgICAgICAgfQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgfQ0KICAgIHJldHVybiAkQW5zDQp9CgpmdW5jdGlvbiBBUC1SZXF1aXJlIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldW0FsaWFzKCJGdW5jdGlvbmFsaXR5IiwiTGlicmFyeSIpXVtTdHJpbmddJExpYiwgW1NjcmlwdEJsb2NrXSRPbkZhaWw9e30sIFtTd2l0Y2hdJFBhc3N0aHJ1KQ0KDQogICAgW2Jvb2xdJFN0YXQgPSAkKHN3aXRjaCAtcmVnZXggKCRMaWIudHJpbSgpKSB7DQogICAgICAgICJeSW50ZXJuZXQiICB7dGVzdC1jb25uZWN0aW9uIGdvb2dsZS5jb20gLUNvdW50IDEgLVF1aWV0fQ0KICAgICAgICAiXmRlcDooLiopIiAge2lmICgkTWF0Y2hlc1sxXSAtbmUgIndoZXJlIil7QVAtUmVxdWlyZSAiZGVwOndoZXJlIiB7JE1PREU9Mn19ZWxzZXskTU9ERT0yfTtpZiAoJE1PREUtMil7R2V0LVdoZXJlICRNYXRjaGVzWzFdfWVsc2V7dHJ5eyYgJE1hdGNoZXNbMV0gIi9mamZkamZkcyAtLWRzamFoZGhzIC1kc2phZGoiIDI+JG51bGw7InN1Y2MifWNhdGNoe319fQ0KICAgICAgICAiXmZ1bmN0aW9uOiguKikiICB7Z2NtICRNYXRjaGVzWzFdIC1lYSBTaWxlbnRseUNvbnRpbnVlfQ0KICAgICAgICAiXnN0cmljdF9mdW5jdGlvbjooLiopIiAge1Rlc3QtUGF0aCAiRnVuY3Rpb246XCQoJE1hdGNoZXNbMV0pIn0NCiAgICB9KQ0KICAgIGlmICghJFN0YXQpIHskT25GYWlsLkludm9rZSgpfQ0KICAgIGlmICgkUGFzc3RocnUpIHtyZXR1cm4gJFN0YXR9DQp9CgpTZXQtQWxpYXMgPzogSW52b2tlLVRlcm5hcnk=")))
# ========================================END=OF=COMPILER===========================================================|
$Text = "Enter Phonetic Text : "
function Convert-Text($Text) {
    $Mapper = @(
        @("you","yoo"),
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
