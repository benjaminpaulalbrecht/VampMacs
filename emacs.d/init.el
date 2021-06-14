;; Loads the config files...

(require 'package)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

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

(load-directory "~/.emacs.d/config")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (powershell face-explorer gnu-elpa-keyring-update ##)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(tooltip-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
  ;;If you edit it by hand, you could mess it up, so be careful.
  ;;Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right. 
 '(default ((t (:family "Source Code Pro" :foundry "outline" :slant normal :height 98 :width normal)))))
 (set-frame-font "Monaco:size=12")
 (setq default-frame-alist nil)
 
