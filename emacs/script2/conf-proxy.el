;; 设置代理 
;; ----  first method  使用 proxy-mode package
;; (setq proxy-mode-url-proxy '(
;;                              ("http"  . "127.0.0.1:42428")
;;                              ("https" . "127.0.0.1:42428")
;;                              ("ftp"   . "127.0.0.1:42428")
;;                              ;; don't use `localhost', avoid robe server (For Ruby) can't response.
;;                              ("no_proxy" . "127.0.0.1")
;;                              ("no_proxy" . "^.*\\(baidu\\|sina)\\.com")))
 

;; (setq proxy-mode-http-proxy "http://127.0.0.1:42428")
;; (setq proxy-mode-socks-proxy '("Default server" "127.0.0.1" 1086 5))

;; (setq proxy-mode-url-proxy '(("http"  . "127.0.0.1:1087")
;;                              ("https" . "127.0.0.1:1087")
;;                              ("ftp"   . "127.0.0.1:1087")
;;                              ;; don't use `localhost', avoid robe server (For Ruby) can't response.
;;                              ("no_proxy" . "127.0.0.1")
;;                              ("no_proxy" . "^.*\\(baidu\\|sina)\\.com")))

;; (setq url-gateway-local-host-regexp
;;       (concat "\\`" (regexp-opt '("localhost" "127.0.0.1")) "\\'")))


;; ----  first method  使用 proxy-mode package    end       ----------------------------------

;; Network Proxy
(setq centaur-proxy "127.0.0.1:42428")

(defun proxy-http-show ()
  "Show HTTP/HTTPS proxy."
  (interactive)
  (if url-proxy-services
      (message "Current HTTP proxy is `%s'" centaur-proxy)
    (message "No HTTP proxy")))

(defun proxy-http-enable ()
  "Enable HTTP/HTTPS proxy."
  (interactive)
  (setq url-proxy-services
        `(("http" . ,centaur-proxy)
          ("https" . ,centaur-proxy)
          ("no_proxy" . "^\\(localhost\\|192.168.*\\|10.*\\)")))
  (proxy-http-show))

(defun proxy-http-disable ()
  "Disable HTTP/HTTPS proxy."
  (interactive)
  (setq url-proxy-services nil)
  (proxy-http-show))

(defun proxy-http-toggle ()
  "Toggle HTTP/HTTPS proxy."
  (interactive)
  (if (bound-and-true-p url-proxy-services)
      (proxy-http-disable)
    (proxy-http-enable)))

;; (defun proxy-socks-show ()
;;   "Show SOCKS proxy."
;;   (interactive)
;;   (when (fboundp 'cadddr)                ; defined 25.2+
;;     (if (bound-and-true-p socks-noproxy)
;;         (message "Current SOCKS%d proxy is %s:%d"
;;                  (cadddr socks-server) (cadr socks-server) (caddr socks-server))
;;       (message "No SOCKS proxy"))))

;; (defun proxy-socks-enable ()
;;   "Enable SOCKS proxy."
;;   (interactive)
;;   (require 'socks)
;;   (setq url-gateway-method 'socks
;;         socks-noproxy '("localhost")
;;         socks-server '("Default server" "127.0.0.1" 1086 5))
;;   (proxy-socks-show))

;; (defun proxy-socks-disable ()
;;   "Disable SOCKS proxy."
;;   (interactive)
;;   (setq url-gateway-method 'native
;;         socks-noproxy nil)
;;   (proxy-socks-show))

;; (defun proxy-socks-toggle ()
;;   "Toggle SOCKS proxy."
;;   (interactive)
;;   (if (bound-and-true-p socks-noproxy)
;;       (proxy-socks-disable)
;;     (proxy-socks-enable)))

(provide 'conf-proxy)
