;; requires
(require 'package)
(require 'helm)
(require 'org)

;; core org-mode init stuff
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
;; ref: https://cpbotha.net/2019/11/02/forming-and-maintaining-habits-using-orgmode/
;; I may change this to note
(setq org-log-done t)




;; stuff
(defun load-directory (directory)
  "Load recursively all `.el' files in DIRECTORY."
  (dolist (element (directory-files-and-attributes directory nil nil nil))
    (let* ((path (car element))
           (fullpath (concat directory "/" path))
           (isdir (car (cdr element)))
           (ignore-dir (or (string= path ".") (string= path ".."))))
      (cond

       ((and (eq isdir t) (not ignore-dir))
        (load-directory fullpath))
       ((and (eq isdir nil) (string= (substring path -3) ".el"))
        (load (file-name-sans-extension fullpath)))))))

(load-directory "c:/Users/balbrecht/AppData/Roaming/.emacs.d/config")





;; package.el stuff
;(package-initialize)
;(add-to-list 'package-archives
;	     '("melpa" . "https://melpa.org/packages/")
       ;; add more here...
	     )

 ;; ###### Thu Jun 24 09:46:01 CDT 2021   disabling this for faster emacs boot...      
;;(package-refresh-contents)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(menu-bar-mode nil)
 '(org-loop-over-headlines-in-active-region t)
 '(package-selected-packages
 '(helm csv-mode yaml-mode powershell face-explorer gnu-elpa-keyring-update ##))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(tooltip-mode t))


;;###### Sun Jun 20 11:28:38 CDT 2021
;; There is a problem with understanding lisp. 
;; solution: use ielm to REPL lisp untill you understand it 
;;(auto-save-visited-mode t)
;;(setq auto-save-interval 30)
;;(do-auto-save)

;; todo state tracking
(setq org-todo-keywords
      '((sequence "TODO(t!)" "NEXT(n!)" "DOING(i!)" "DONE(d@/!)" "|" "WAIT(w@/!)" "REVIEW(r@/!)" "CANCELED(c@/!)")))


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


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Cascadia Code PL" :foundry "outline" :slant normal :height 98 :width normal)))))



;; org agenda stuff goes here... 
;; a test of the org-agenda files..
(setq org-agenda-files (list "c:/users/balbrecht/WorkBench/sessions/" "c:/users/balbrecht/WorkBench/projects/"))






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
(setq org-refile-log time)


;; Documentation:
;;Non-nil means undone TODO entries will block switching the parent to DONE.
;;Also, if a parent has an :ORDERED: property, switching an entry to DONE will
;;be blocked if any prior sibling is not yet done.
;;Finally, if the parent is blocked because of ordered siblings of its own,
;;the child will also be blocked.

(setq org-enforce-todo-dependencies t)

;; helm stuff...
(helm-mode 1) 



;; hooks



