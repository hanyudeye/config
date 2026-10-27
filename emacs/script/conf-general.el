;;; conf-general.el --- 自定义配置入口 -*- lexical-binding: t; -*-

;;; Commentary:
;; 在 dotspacemacs/user-init 中配置 ELPA 镜像：
;; (setq configuration-layer-elpa-archives
;;       '(("melpa-cn" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
;;         ("org-cn"   . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
;;         ("nongnu"   . "https://elpa.nongnu.org/nongnu/")
;;         ("gnu-cn"   . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))
;;
;; 在 dotspacemacs/user-config 中加载本脚本：
;; (add-to-list 'load-path "~/me/config/emacs/script/")
;; (require 'conf-general)

;;; Code:

;; 加载顺序：通用 -> 自定义 -> 功能模块
(require 'conf-common)
(require 'conf-self)
(require 'conf-llm)
(require 'conf-file)
(require 'conf-read)
;; (require 'conf-copy)

(provide 'conf-general)
;;; conf-general.el ends here
