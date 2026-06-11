(defun translate-with-sdcv-async ()
  "Translate the current region with sdcv asynchronously."
  (interactive)
  (if (use-region-p)
      (let* ((word (buffer-substring-no-properties (region-beginning) (region-end)))
             ;; (command (format "sdcv -n %s" (shell-quote-argument word))))
             (command (format "ekho --english-speed=-30 %s" (shell-quote-argument word))))
        (make-process
         :name "sdcv-process"
         ;; :buffer (generate-new-buffer "*sdcv-output*")
         :command (list "sh" "-c" command)
         :connection-type 'pipe)
        ;; (message "Translating...")
        )
    (message "No region selected!")))

;; (global-set-key (kbd "C-c t") 'translate-with-sdcv-async)
(evil-leader/set-key "o l" 'translate-with-sdcv-async)
(provide 'conf-ekho)
