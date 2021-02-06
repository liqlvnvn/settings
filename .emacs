;; Maximize Emacs on start up
;; https://stackoverflow.com/questions/7763847/maximize-emacs-on-start-up-not-the-fullscreen
(defun fullscreen (&optional f)
       (interactive)
       (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
               '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
       (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
               '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))

(fullscreen t)

(add-to-list 'load-path "~/.emacs.d/el/")

;; because it avoids autoloads of elisp modes)
(setq initial-major-mode 'text-mode)

;; From haskell-mode guide https://github.com/haskell/haskell-mode
(require 'package)

;; MELPA
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;; Setting by emacs
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (solarized-light)))
 '(custom-safe-themes
   (quote
    ("a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(electric-pair-inhibit-predicate (quote electric-pair-default-inhibit))
 '(electric-pair-mode t)
 '(electric-pair-preserve-balance t)
 '(electric-pair-skip-self (quote electric-pair-default-skip-self))
 '(global-hl-line-mode t)
 '(inhibit-startup-screen t)
 '(linum-format "%3d ")
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa-stable" . "http://stable.melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (auctex markdown-mode ghc-imported-from ghc intero solarized-theme jedi haskell-mode)))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(show-paren-ring-bell-on-mismatch t)
 '(show-paren-style (quote parenthesis))
 '(show-paren-when-point-inside-paren 1)
 '(tool-bar-mode nil))
(package-initialize)
 ;;
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(border ((t nil))))
;;(add-to-list 'default-frame-alist '(height . 26))
;;    (add-to-list 'default-frame-alist '(width . 109))

;; https://www.emacswiki.org/emacs/LineNumbers
;; easy way to display line numbers in emacs
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

;; Column number
;; https://www.gnu.org/software/emacs/manual/html_node/efaq/Displaying-the-current-line-or-column.html
(setq column-number-mode t)

;; http://tkf.github.io/emacs-jedi/latest/
;; Python programming
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)                 ; optional
(setq python-shell-interpreter "python3")

;; Unable line numbers in files with source code
(add-hook 'prog-mode-hook 'linum-mode)
(setq linum-format "%3d")

;; https://www.emacswiki.org/emacs/ElectricPair
;; ElectricPair
;; provides a way to easily insert matching delimiters
(add-hook 'prog-mode-hook 'electric-pair-mode)

;; Haskell


;; toggle input method
;(add-hook 'text-mode-hook 'toggle-input-method)
(setq default-input-method "russian-computer")

;; https://david.rothlis.net/emacs/customize_c.html
;; indentation setting in cc-mode
(setq-default c-basic-offset 4)
(setq-default indent-tabs-mode nil)

;; https://github.com/auto-complete/auto-complete/
;; auto-complete
(ac-config-default)

;; ido-mode
;; https://david.rothlis.net/emacs/customize_general.html
(ido-mode 1)

(eldoc-mode 1)

;; change pager from less to cat in shell
(setenv "PAGER" "/bin/cat")

;; higlight a line with cursor
(hl-line-mode 1)

;; for session save
;; (desktop-save-mode 1)

;; checking if 2 files have same name than rename buffer
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; solve problem with tabs
;; (setq-default indent-tabs-mode nil)

;; some program needs empty line at the end of file
(setq require-final-newline t)

;; 80 ColumnRule
;; https://www.emacswiki.org/emacs/EightyColumnRule
(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
;(add-hook 'prog-mode-hook (global-whitespace-mode t))
(add-hook 'prog-mode-hook (lambda ()
                            (interactive)
                            (global-whitespace-mode t)))

;; https://www.emacswiki.org/emacs/AutoFillMode
(setq-local comment-auto-fill-only-comments t)
(auto-fill-mode 1)

;;;; ************************************************************************
;;;; *** strip trailing whitespace on write
;;;; ************************************************************************
;;;; ------------------------------------------------------------------------
;;;; --- ws-trim.el - [1.3] ftp://ftp.lysator.liu.se/pub/emacs/ws-trim.el
;;;; ------------------------------------------------------------------------
(require 'ws-trim)
(global-ws-trim-mode t)
(set-default 'ws-trim-level 2)
(setq ws-trim-global-modes '(guess (not message-mode eshell-mode)))
(add-hook 'ws-trim-method-hook 'joc-no-tabs-in-java-hook)


;; Emacs: How can I eliminate whitespace-mode in auto-complete pop-ups?
;;https://stackoverflow.com/questions/12965814/emacs-how-can-i-eliminate-whitespace-mode-in-auto-complete-pop-ups
(defun joc-no-tabs-in-java-hook ()
  "WS-TRIM Hook to strip all tabs in Java mode only"
  (interactive)
  (if (string= major-mode "jde-mode")
      (ws-trim-tabs)))

(defvar my-prev-whitespace-mode nil)
(make-variable-buffer-local 'my-prev-whitespace-mode)

(defadvice popup-draw (before my-turn-off-whitespace activate compile)
  "Turn off whitespace mode before showing autocomplete box"
  (if whitespace-mode
      (progn
        (setq my-prev-whitespace-mode t)
        (prelude-turn-off-whitespace))
    (setq my-prev-whitespace-mode nil)))

(defadvice popup-delete (after my-restore-whitespace activate compile)
  "Restore previous whitespace mode when deleting autocomplete box"
  (if my-prev-whitespace-mode
      (prelude-turn-on-whitespace)))
