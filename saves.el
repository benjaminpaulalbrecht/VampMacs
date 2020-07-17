;; ref: http://pragmaticemacs.com/emacs/auto-save-and-backup-every-save/

;; Backup settings (global)

(setq
 backup-by-copying t
 kept-new-versions 10
 kept-old-versions 0
 delete-old-versions t
 version-control t
 vc-make-backup-files t)


;; backup every save

(defvar bjm/backup-file-size-limit (* 5 1024 1024)
  "Maximum size of a file (in bytes) that should be copied at each savepoint

if a file is greater than this size, don't make a bcakup of it. Default: 5mb"

  )


(defvar bjm/backup-location (expand-file-name "~/emacs-saves") 
  "Base folder for backups 



(defvar bjm/backup-trash-dir (expand-file-name "~/.Trash") 
"Directory for unwanted backups.") 


(defvar bjm/backup-exclude-regexp "\\[Gmail]\\" 
"Dont backup files matching this regexp.") 


;; Default and per-save backups go here: 
;; N.B. backtick and comma allow evaulation of expression 
;; when forming list 

(setq backup-directory-alist
      `(("" . ,(expand-file-name "per-save" bjm/backup-location)))) 

;; add trash dir if needed 

(if bjm/backup-exclude-regexp 
    (add-to-list 'backup-directory-alist `(,bjm/backup-exclude-regexp . ,bjm/backup-trash-dir)))

(defun bjm/backup-every-save () 
  "backup files every time they are saved." 

(when (not buffer-backed-up) 

(let ((backup-directory-alist 
       `(("." . ,(expand-file-name "per-session" bjm/backup-location))))))

