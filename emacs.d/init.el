;; requires
(require 'package)
(require 'helm)
(require 'org)

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

;;todo: setup env vars per os 
(load-directory "~/VampMacs/config")





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

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Cascadia Code PL" :foundry "outline" :slant normal :height 98 :width normal)))))


;; helm stuff...
(helm-mode 1) 



;; hooks



