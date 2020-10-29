(setq-default
 evil-escape-key-sequence "kj"
 evil-escape-delay 0.5
 ;; sdcv-popup-function 'popup-tip
 ;; sdcv-popup-function 'tooltip-show
 ;; sdcv-popup-function 'pos-tip-show
 ;;不发音
 sdcv-word-pronounce nil

 ;; google 翻译
 google-translate-default-source-language "en"
 google-translate-default-target-language "zh-CN"
 ;; google-translate-output-destination 'popup
 google-translate-show-phonetic nil
 ;;对于弹出buffer,是否获得焦点 
 google-translate-pop-up-buffer-set-focus t

 ;; 搜索
 eww-search-prefix "http://www.baidu.com/s?wd="

;;设置服务
 dotspacemacs-server-socket-dir "~/.emacs/server"

 ;;ranger
 ranger-width-preview 0.70


 paradox-github-token  "21c2b26b816706e094472ea4bbe1d683a373ff0e"
 )


;;调用朗读软件朗读选区
(defun langdu(start end)
  "朗读开始和 end 区域的内容"
  (interactive "r")
  (let ((content (buffer-substring start end)))
    ;; (call-process "/usr/local/bin/ekho" nil t nil content)

    ;; (start-process NAME BUFFER PROGRAM &rest PROGRAM-ARGS)
    (start-process "ekho" nil "ekho" "-s20" "-a -80" content)
    ))

;;调用朗读软件朗读选区
(defun langdu-espeak(start end)
  (interactive "r")
  (let ((content (buffer-substring start end)))
    ;; (start-process NAME BUFFER PROGRAM &rest PROGRAM-ARGS)
    ;; (start-process "espeak" nil "espeak" "-vcmn" "-s 100"  "-a 20" content)
    (start-process "espeak" nil "espeak" "-ven" "-s 70"  "-a 20" content)
    ))


(server-start)
(require 'conf-custom)
(require 'conf-proxy)
(require 'conf-file)
(require 'conf-org)


;; 默认开代理
(proxy-http-enable)


(provide 'conf-general)
