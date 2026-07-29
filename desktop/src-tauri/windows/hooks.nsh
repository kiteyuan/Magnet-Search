; 安装路径 / 可执行文件使用 ASCII（ZhiyuanMagnet）
; 开始菜单、桌面快捷方式、「应用和功能」显示名使用中文「纸鸢磁力」

!macro NSIS_HOOK_POSTINSTALL
  WriteRegStr SHCTX "${UNINSTKEY}" "DisplayName" "纸鸢磁力"

  !if "${STARTMENUFOLDER}" != ""
    Delete "$SMPROGRAMS\$AppStartMenuFolder\${PRODUCTNAME}.lnk"
    CreateShortcut "$SMPROGRAMS\$AppStartMenuFolder\纸鸢磁力.lnk" "$INSTDIR\${MAINBINARYNAME}.exe"
    !insertmacro SetLnkAppUserModelId "$SMPROGRAMS\$AppStartMenuFolder\纸鸢磁力.lnk"
  !else
    Delete "$SMPROGRAMS\${PRODUCTNAME}.lnk"
    CreateShortcut "$SMPROGRAMS\纸鸢磁力.lnk" "$INSTDIR\${MAINBINARYNAME}.exe"
    !insertmacro SetLnkAppUserModelId "$SMPROGRAMS\纸鸢磁力.lnk"
  !endif

  Delete "$DESKTOP\${PRODUCTNAME}.lnk"
  CreateShortcut "$DESKTOP\纸鸢磁力.lnk" "$INSTDIR\${MAINBINARYNAME}.exe"
  !insertmacro SetLnkAppUserModelId "$DESKTOP\纸鸢磁力.lnk"
!macroend

!macro NSIS_HOOK_PREUNINSTALL
  Delete "$DESKTOP\纸鸢磁力.lnk"
  Delete "$DESKTOP\${PRODUCTNAME}.lnk"
  !if "${STARTMENUFOLDER}" != ""
    Delete "$SMPROGRAMS\$AppStartMenuFolder\纸鸢磁力.lnk"
    Delete "$SMPROGRAMS\$AppStartMenuFolder\${PRODUCTNAME}.lnk"
  !else
    Delete "$SMPROGRAMS\纸鸢磁力.lnk"
    Delete "$SMPROGRAMS\${PRODUCTNAME}.lnk"
  !endif
!macroend
