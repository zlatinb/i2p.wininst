# Uncomment on v3
# UniCode true

# uncomment when building production - takes forever
# SetCompressor lzma

!include "version.nsi"

!define MUI_ICON toopie.ico
!define MUI_FINISHPAGE
!include "MUI2.nsh"

### Available languages
  !insertmacro MUI_LANGUAGE "English"
  !insertmacro MUI_LANGUAGE "French"
  !insertmacro MUI_LANGUAGE "German"
  !insertmacro MUI_LANGUAGE "Spanish"
  !insertmacro MUI_LANGUAGE "SpanishInternational"
  !insertmacro MUI_LANGUAGE "SimpChinese"
  !insertmacro MUI_LANGUAGE "TradChinese"
  !insertmacro MUI_LANGUAGE "Japanese"
  !insertmacro MUI_LANGUAGE "Korean"
  !insertmacro MUI_LANGUAGE "Italian"
  !insertmacro MUI_LANGUAGE "Dutch"
  !insertmacro MUI_LANGUAGE "Danish"
  !insertmacro MUI_LANGUAGE "Swedish"
  !insertmacro MUI_LANGUAGE "Norwegian"
  !insertmacro MUI_LANGUAGE "NorwegianNynorsk"
  !insertmacro MUI_LANGUAGE "Finnish"
  !insertmacro MUI_LANGUAGE "Greek"
  !insertmacro MUI_LANGUAGE "Russian"
  !insertmacro MUI_LANGUAGE "Portuguese"
  !insertmacro MUI_LANGUAGE "PortugueseBR"
  !insertmacro MUI_LANGUAGE "Polish"
  !insertmacro MUI_LANGUAGE "Ukrainian"
  !insertmacro MUI_LANGUAGE "Czech"
  !insertmacro MUI_LANGUAGE "Slovak"
  !insertmacro MUI_LANGUAGE "Croatian"
  !insertmacro MUI_LANGUAGE "Bulgarian"
  !insertmacro MUI_LANGUAGE "Hungarian"
  !insertmacro MUI_LANGUAGE "Thai"
  !insertmacro MUI_LANGUAGE "Romanian"
  !insertmacro MUI_LANGUAGE "Latvian"
  !insertmacro MUI_LANGUAGE "Macedonian"
  !insertmacro MUI_LANGUAGE "Estonian"
  !insertmacro MUI_LANGUAGE "Turkish"
  !insertmacro MUI_LANGUAGE "Lithuanian"
  !insertmacro MUI_LANGUAGE "Slovenian"
  !insertmacro MUI_LANGUAGE "Serbian"
  !insertmacro MUI_LANGUAGE "SerbianLatin"
  !insertmacro MUI_LANGUAGE "Arabic"
  !insertmacro MUI_LANGUAGE "Farsi"
  !insertmacro MUI_LANGUAGE "Hebrew"
  !insertmacro MUI_LANGUAGE "Indonesian"
  !insertmacro MUI_LANGUAGE "Mongolian"
  !insertmacro MUI_LANGUAGE "Luxembourgish"
  !insertmacro MUI_LANGUAGE "Albanian"
  !insertmacro MUI_LANGUAGE "Breton"
  !insertmacro MUI_LANGUAGE "Belarusian"
  !insertmacro MUI_LANGUAGE "Icelandic"
  !insertmacro MUI_LANGUAGE "Malay"
  !insertmacro MUI_LANGUAGE "Bosnian"
  !insertmacro MUI_LANGUAGE "Kurdish"
  !insertmacro MUI_LANGUAGE "Irish"
  !insertmacro MUI_LANGUAGE "Uzbek"
  !insertmacro MUI_LANGUAGE "Galician"
  !insertmacro MUI_LANGUAGE "Afrikaans"
  !insertmacro MUI_LANGUAGE "Catalan"
  !insertmacro MUI_LANGUAGE "Esperanto"
  !insertmacro MUI_LANGUAGE "Basque"
  !insertmacro MUI_LANGUAGE "Welsh"
# Commented out languages below do not compile on NSIS v2
#  !insertmacro MUI_LANGUAGE "Asturian"
#  !insertmacro MUI_LANGUAGE "Pashto"
#  !insertmacro MUI_LANGUAGE "ScotsGaelic"
#  !insertmacro MUI_LANGUAGE "Georgian"
#  !insertmacro MUI_LANGUAGE "Vietnamese"
#  !insertmacro MUI_LANGUAGE "Armenian"
#  !insertmacro MUI_LANGUAGE "Corsican"
#  !insertmacro MUI_LANGUAGE "Tatar"
#  !insertmacro MUI_LANGUAGE "Hindi"
### END LANGUAGES

# small speed optimization
!insertmacro MUI_RESERVEFILE_LANGDLL
# show all languages, regardless of codepage
!define MUI_LANGDLL_ALLLANGUAGES


Function .onInit
    !insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd

Name "I2P ${I2P_VERSION}"
OutFile Zero-I2P${I2P_VERSION}-JRE${JRE_VERSION}-INST${INSTALLER_VERSION}.exe
Icon toopie.ico
RequestExecutionLevel admin
InstallDir "$PROGRAMFILES\i2p"

PageEx license
    licensetext "Public Domain"
    licensedata "LICENSE.txt"
PageExEnd
Page directory
Page instfiles

!define MUI_FINISHPAGE_RUN
!define MUI_FINISHPAGE_RUN_TEXT "Start I2P now"
!define MUI_FINISHPAGE_RUN_FUNCTION "LaunchLink"
!insertmacro MUI_PAGE_FINISH

Function LaunchLink
    ExecShell "" "$DESKTOP\Start I2P.lnk"
FunctionEnd

Section Install
    CreateDirectory $INSTDIR
    SetOutPath $INSTDIR

    File LICENSE.txt
    File toopie.ico

    File /r pkg\*.*

    CreateDirectory "$INSTDIR\jre"
    SetOutPath "$INSTDIR\jre"
    File /r jre\*.*

    CreateDirectory "$SMPROGRAMS\I2P"
    CreateShortCut "$SMPROGRAMS\I2P\Start I2P.lnk" "c:\Windows\system32\cmd.exe" "/c $\"$INSTDIR\i2p.bat$\"" "$INSTDIR\toopie.ico"
    CreateShortCut "$DESKTOP\Start I2P.lnk" "c:\Windows\system32\cmd.exe" "/c $\"$INSTDIR\i2p.bat$\"" "$INSTDIR\toopie.ico"

    WriteUninstaller "$INSTDIR\uninstall-i2p.exe"
SectionEnd

Section "uninstall"
    Delete "$INSTDIR\LICENSE.txt"
    Delete "$INSTDIR\toopie.ico"
    Delete "$INSTDIR\uninstall-i2p.exe"

    Delete "$DESKTOP\Start I2P.lnk"
    RmDir /r "$SMPROGRAMS\I2P"

    RmDir /r "$INSTDIR\jre"
    RmDir /r "$INSTDIR"
SectionEnd


