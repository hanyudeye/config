;; 识别文件
(add-to-list 'auto-mode-alist
             '("\\.dem\\'" . (lambda ()
                               ;; add major mode setting here, if needed, for example:
                               ;; (text-mode)
                               ;; (insert "OK")
                               (gnuplot-mode)
                               )))


(provide 'conf-gnuplot)
