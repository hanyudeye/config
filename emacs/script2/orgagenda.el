;; 这是 agenda capture 抓取的模板配置
;; org-mode
;; reference from http://ju.outofmemory.cn/entry/348743
(with-eval-after-load 'org
  ;; 设置默认 Org Agenda 文件目录
  (setq org-agenda-files '("~/xinde/agenda"))
  (setq org-default-notes-file "~/xinde/agenda/notes.org")

  ;; clear org-capture-templates
  (setq org-capture-templates nil)
  ;; add a group
  (add-to-list 'org-capture-templates '("t" "Tasks"))
  (add-to-list 'org-capture-templates
               '("td" "Todo" entry (file+headline "~/xinde/agenda/gtd.org" "工作安排")
                 "* TODO [#B] %?\n  %i\n"
               :empty-lines 1))
  (add-to-list 'org-capture-templates
               '("tw" "Work Task" entry (file+headline "~/xinde/agenda/work.org" "工作内容")
                 "* TODO %^{任务名}\n%U\n%a\n" :clock-in t :clock-resume t))
  (add-to-list 'org-capture-templates
               '("j" "Journal" entry (file+datetree "~/xinde/agenda/journal.org" "我的记录")
                 "* 我的记录\n%U"))
  (add-to-list 'org-capture-templates
               '("i" "Inbox" entry (file "~/xinde/agenda/inbox.org")
                 "* %U - %^{heading} %^g\n %?\n"))
  (add-to-list 'org-capture-templates
               '("n" "Notes" entry (file "~/xinde/agenda/notes.org")
                  "** %U \n"))
  (add-to-list 'org-capture-templates
               '("w" "Web collections" entry (file+headline "~/xinde/agenda/web.org" "Web")
                 "* %U %:annotation\n\n%:initial\n\n%?"))
  (add-to-list 'org-capture-templates
               `("b" "Blog" plain (file ,(concat "~/xinde/blog/"
                                                 (format-time-string "%Y-%m-%d.org")))
                 ,(concat "#+startup: showall\n"
                          "#+options: toc:nil\n"
                          "#+begin_export html\n"
                          "---\n"
                          "layout     : post\n"
                          "title      : %^{标题}\n"
                          "categories : %^{类别}\n"
                          "tags       : %^{标签}\n"
                          "---\n"
                          "#+end_export\n"
                          "#+TOC: headlines 2\n")))
  
  (setq org-src-fontify-natively t))

(add-hook 'org-mode-hook 'evil-org-mode)
;; (evil-org-set-key-theme '(navigation insert textobjects additional calendar))
(require 'evil-org-agenda)
;; (evil-org-agenda-set-keys)
;; https://github.com/Somelauw/evil-org-mode#common-issues
(setq evil-want-C-i-jump nil)

;; 默认情况下，Org Mode没有打开Markdown文档的转换功能，需要将下面的小代码放到Emacs 的启动配置文件中：
;; (setq org-export-backends (quote (ascii html icalendar latex md)))
;; (eval-after-load "org"
;;   '(require 'ox-md nil t))

;; 在配置文件中（我使用的是模块化的配置，所以我的配置在 init-org.el 文件中）增加如下程序，就可实现 org-mode 中的自动换行。
;; (add-hook 'org-mode-hook 
;; 	  (lambda () (setq truncate-lines nil)))

(provide 'orgagenda)
