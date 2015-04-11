(require 'font-customizations)

;;;;;;;;;;;;;;;;;;;;;;;EMACS 24 STUFF;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar emacs24
  (if (string-match "24" (substring emacs-version 0 2)) t nil)
  "Is this Emacs 24?")

(cond (emacs24 (cond ((eq window-system 'ns)
                      (setq ns-use-srgb-colorspace nil)
                      (setq x-cursor-fore-pixel "green")
                      (menu-bar-mode -1)
                      (toggle-scroll-bar -1)
                      (transient-mark-mode t)
                      (load "paren")
                      (set-default-font default)
;;; Color defs
                      (defvar zsienna     "#8A5233") ;/* R=138 ; G= 82 ; B= 51 */
                      (defvar zcoffee     "#453232") ;/* R= 69 ; G= 50 ; B= 50 */
                      (defvar zgrey       "#BCBCBC") ;/* R=188 ; G=188 ; B=188 */
                      (defvar zmouse      "#768BA0") ;/* R=118 ; G=139 ; B=160 */
                      (defvar zcadetblue "#92ADDF") ;/* R=146 ; G=173 ; B=223 */
                      (defvar zmidnight  "#222245") ;/* R= 34 ; G= 34 ; B= 69 (was 11,62,104)*/
                      (defvar zgoldenrod "#DCC963") ;/* R=220 ; G=201 ; B= 99 */
                      (defvar ztomato        "tomato") ;/* alias */
                      (defvar zgreen3        "green3") ;/* alias */
                      (defvar zkhaki          "Khaki") ;/* alias */
                      (defvar zorange        "Orange") ;/* alias */
                      (defvar zorchid        "Orchid") ;/* alias */
                      (defvar zturquoise    "Turquoise")
                      (defvar zlimegreen2 "green3") ;/* alias */
                      (defvar zlimegreen "LimeGreen")
                      (defvar zpink            "Pink")
                      (defvar zsalmon        "Salmon") ;/* alias */
                      (defvar zgrey45       "#666362") ;/* alias */
                      (defvar zgrey60       "#8F8E8D") ;/* alias */
                      (set-face-foreground 'default               zgoldenrod)
                      (set-face-background 'default               zmidnight)

                      (set-face-foreground 'isearch               zorange)
                      (set-face-background 'isearch               zmidnight)
                      (set-face-foreground 'region                zlimegreen2)
                      (set-face-background 'region                zmidnight)
                      ;;(set-face-background 'primary-selection  zmidnight)
                      (set-face-foreground 'secondary-selection  zlimegreen2)
                      (set-face-background 'secondary-selection  zmidnight)

                      (set-face-foreground 'bold                  zlimegreen2)
                      (set-face-foreground 'italic                zturquoise)
                      (set-face-background 'italic                zmidnight)
                      (set-face-foreground 'bold-italic   zlimegreen2)
                      (set-face-background 'bold-italic   zmidnight)
                      (set-face-foreground 'highlight             zlimegreen2)
                      (set-face-background 'highlight             zmidnight)

                      ;;(set-face-underline-p 'primary-selection nil)
                      (invert-face 'secondary-selection)
                      (load "font-lock")
                      (setq font-lock-comment-face 'italic)
                      (setq font-lock-doc-string-face 'italic)
                      (setq font-lock-string-face 'bold-italic)
                      (setq font-lock-function-name-face 'bold)
                      (setq font-lock-keyword-face 'bold)
                      (setq font-lock-type-face 'bold)
                      (setq emacs-lisp-mode-hook 'font-lock-mode)
                      (setq lisp-mode-hook 'font-lock-mode)
                      (setq scheme-mode-hook 'font-lock-mode)
                      (add-hook 'c-mode-hook 'turn-on-font-lock)
                      (add-hook 'c++-mode-hook 'turn-on-font-lock)
                      (setq lisp-font-lock-keywords lisp-font-lock-keywords-2)
                      (cond (t
                             (setq initial-frame-alist
                                   '((minibuffer . t)
                                        ;(font . default)
                                     (mouse-color  . "red")
                                     (cursor-color . "#DCC963")
                                     (foreground-color . "#DCC963")
                                     (background-color . "#222245")))
                             (setq default-frame-alist
                                   '((minibuffer . f)
                                        ;(font . default)
                                     (mouse-color  . "tomato")
                                     (cursor-color . "#DCC963")
                                     (foreground-color . "#DCC963")
                                     (background-color . "#222245")))
                             (set-face-foreground 'region "tomato")
                             (set-face-background 'region "black")
                             )
                            (t
                             (setq default-frame-alist
                                   '((font . default)
                                     (foreground-color . "white")
                                     (background-color . "black"))))))
                     (t t))
               (setq calendar-longitude -71.105)
               (setq calendar-latitude 42.365)
               (setq calendar-location-name "San Francisco, CA"))
      (t t))

(cond ((eq window-system nil)
       (setq default-frame-alist
	     '((font . default)
	       (foreground-color . "white")
	       (background-color . "black")))))

(provide 'color-customizations)
