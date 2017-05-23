(setq show-paren-style 'expression)
(show-paren-mode 2)

(menu-bar-mode -1)
(tool-bar-mode -1)

(setq make-backup-files         nil) ; Don't want any backup files
(setq auto-save-list-file-name  nil) ; Don't want any .saves files
(setq auto-save-default         nil) ; Don't want any auto saving

(add-to-list 'load-path "/home/fedora/.emacs.d/lisp")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; http://stable.melpa.org
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; http://code.google.com/p/dea/source/browse/trunk/my-lisps/linum%2B.el
;;(require 'linum+)
;;(setq linum-format "%d ")
;;(global-linum-mode 1)

;; built-in
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;; built-in
(require 'bs)
(setq bs-configurations
      '(("files" "^\\*scratch\\*" nil nil bs-visits-non-file bs-sort-buffer-interns-are-last)))

(global-set-key (kbd "<f2>") 'bs-show)

;; http://www.emacswiki.org/emacs/AutoComplete
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "/home/fedora/.emacs.d/auto-complete/dict")

;; http://www.emacswiki.org/emacs/SrSpeedbar
(require 'sr-speedbar)
(global-set-key (kbd "<f12>") 'sr-speedbar-toggle)

;; http://www.emacswiki.org/emacs/Yasnippet
;(add-to-list 'load-path "~/EmacsCasts/episode03/yasnippet")
;(require 'yasnippet)
;(yas-global-mode 1)
;(yas/load-directory "~/EmacsCasts/episode03/yasnippet/snippets")

;; https://github.com/sellout/emacs-color-theme-solarized
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
(load-theme 'solarized t)
(set-frame-parameter nil 'background-mode 'light)
(set-terminal-parameter nil 'background-mode 'light)
(enable-theme 'solarized)

;; Options -> Set default font
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-12"))
(set-default-font "DejaVu Sans Mono-12")
