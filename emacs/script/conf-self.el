(setq-default

 ;; 解压缩
 ;; nov-unzip-program (executable-find "d:/Program Files/Git/usr/bin/unzip.exe")

 browse-url-browser-function 'browse-url-generic
 ;; browse-url-generic-program "/mnt/c/Program Files/Google/Chrome/Application/chrome.exe"
 browse-url-generic-program "/mnt/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe"
 ;; browse-url-browser-function 'eww-browse-url
 ;;eww 去掉网页背景
 shr-use-colors nil

 ;; 配置 shell 终端的宽度
 ;; shell-default-shell 'eat
 shell-default-shell 'vterm
 shell-pop-window-size 30
 )


(provide 'conf-self)
