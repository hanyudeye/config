(with-eval-after-load 'mu4e

      (setq mu4e-maildir "~/.mail"
            mu4e-trash-folder "/trash"
            mu4e-refile-folder "/archive"
            ;; for apple
            ;; mu4e-get-mail-command "mbsync -a"
            mu4e-get-mail-command "offlineimap -a"

            mu4e-update-interval nil
            mu4e-compose-signature-auto-include nil
            mu4e-view-show-images t
            mu4e-view-show-addresses t)

      ;;; Mail directory shortcuts
      (setq mu4e-maildir-shortcuts
            '(("/gmail/INBOX" . ?g)
              ("/163/INBOX" . ?1)))

      ;;多账户
      (setq mu4e-contexts
            `( ,(make-mu4e-context
                 :name "Private"
                 :enter-func (lambda () (mu4e-message "Switch to the Private context"))
                 ;; leave-func not defined
                 :match-func (lambda (msg)
                               (when msg
                                 (mu4e-message-contact-field-matches msg
                                                                     :to "hanyudeye8@gmail.com")))
                 :vars '(  ( user-mail-address      . "hanyudeye8@gmail.com"  )
                           ( user-full-name     . "wu ming" )
                           ( mu4e-compose-signature .
                                                    (concat
                                                     "wu ming \n"
                                                     "Lauttasaari, Finland\n"))))
               ,(make-mu4e-context
                 :name "Work"
                 :enter-func (lambda () (mu4e-message "Switch to the Work context"))
                 ;; leave-fun not defined
                 :match-func (lambda (msg)
                               (when msg
                                 (mu4e-message-contact-field-matches msg
                                                                     :to "hanyudeye@163.com")))
                 :vars '(  ( user-mail-address      . "hanyudeye@163.com" )
                           ( user-full-name     . "Wu Ming" )
                           ( mu4e-compose-signature .
                                                    (concat
                                                     "Prof. Alice Derleth\n"
                                                     "Miskatonic University, Dept. of Occult Sciences\n"))))))

      ;;; Bookmarks
      (setq mu4e-bookmarks
            `(("flag:unread AND NOT flag:trashed" "Unread messages" ?u)
              ("date:today..now" "Today's messages" ?t)
              ("date:7d..now" "Last 7 days" ?w)
              ("mime:image/*" "Messages with images" ?p)
              (,(mapconcat 'identity
                           (mapcar
                            (lambda (maildir)
                              (concat "maildir:" (car maildir)))
                            mu4e-maildir-shortcuts) " OR ")
               "All inboxes" ?i)))

      ;; context policy
      (setq mu4e-context-policy 'ask)
      (setq mu4e-compose-context-policy 'ask)
  )

(provide 'conf-mail)
