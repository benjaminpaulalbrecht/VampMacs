
;; core org-mode init stuff
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
;; ref: https://cpbotha.net/2019/11/02/forming-and-maintaining-habits-using-orgmode/
;; I may change this to note
(setq org-log-done t)


;; org-mode habits
;; the below is WRONG. But this is a pattern with org-mode. what you THINK it says, it does not.
;;(add-to-list 'org-modules 'org-habit)

;; log TODO creation (I may change this)
(setq org-treat-insert-todo-heading-as-state-change t)

;; log into LOGBOOK drawer (from the ref.)
(setq org-log-into-drawer t)


;; Workbench Archiving... 
;; ref: https://emacs.stackexchange.com/questions/18999/ignore-scheduled-date-in-agenda-if-item-is-cancelled
;; http://doc.endlessparentheses.com/Var/org-archive-location.html

;; Setting Org-Archive Triggers for Canceled tasks:
(setq org-todo-state-tags-triggers
      '(("CANCELED" "DONE" ("ARCHIVE" . t))))
(setq org-archive-location "C:/users/balbrecht/WorkBench/archive/archive.org::datetree/* From %s")



;; org agenda stuff goes here... 
;; a test of the org-agenda files..
(setq org-agenda-files (list "c:/users/balbrecht/WorkBench/sessions/" "c:/users/balbrecht/WorkBench/projects/"))


;; todo state tracking
(setq org-todo-keywords
      '((sequence "TODO(t!)" "NEXT(n!)" "DOING(i!)" "DONE(d@/!)" "|" "WAIT(w@/!)" "REVIEW(r@/!)" "CANCELED(c@/!)")))




;; ---------------- org-refile stuff ------------------
;; ref: blog.aaronbieber.com/2017/03/19/organizing-notes-with-refile.html
;; employ the list of org-mode files in the org-agenda-files list 
(setq org-refile-targets '((org-agenda-files :maxlevel . 3)))

;; use targets like files, using the "/" delimiter:  specify the full path to the target.
(setq org-refile-use-outline-path 'file)

;; have Org generate all of the possible completions and present them at once.
(setq org-out-outline-complete-in-steps nil)

;;Occasionally you may want to refile something into another file or heading and place it beneath a new parent that you create on-the-fly. 
(setq  org-file-allow-cerating-parent-notes 'confirm)

;; set the variable  org-log-refile for either a time stamp or note, whenever an entry is refiled.
(setq org-refile-log t)


;; Documentation:
;;Non-nil means undone TODO entries will block switching the parent to DONE.
;;Also, if a parent has an :ORDERED: property, switching an entry to DONE will
;;be blocked if any prior sibling is not yet done.
;;Finally, if the parent is blocked because of ordered siblings of its own,
;;the child will also be blocked.

(setq org-enforce-todo-dependencies t)

