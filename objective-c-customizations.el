(require 'find-file)
(nconc (cadr (assoc "\\.h\\'" cc-other-file-alist)) '(".m" ".mm"))
(add-to-list 'cc-other-file-alist '("\\.m\\'" (".h")))
(add-to-list 'cc-other-file-alist '("\\.mm\\'" (".h")))

(add-hook 'objc-mode-hook 'visual-line-mode)
;(add-hook 'objc-mode-hook 'adaptive-wrap-prefix-mode)
(add-hook 'objc-mode-hook (lambda ()
                            (setq adaptive-wrap-extra-indent 4)))

;; Helm source for definitions and pragmas in current file
(defvar helm-c-source-objc-headline
  '((name . "Objective-C Headline")
    (headline  "^[-+@]\\|^#pragma mark")))

(defun objc-headline ()
  (interactive)
  ;; Set to 500 so it is displayed even if all methods are not narrowed down.
  (let ((helm-candidate-number-limit 500))
    (helm-other-buffer '(helm-c-source-objc-headline) "*ObjC Headline*")))

(defun dml-objc-mode-hook ()
  ;; Make ff-find-other-file toggle between .m and .h
  (set (make-local-variable 'cc-other-file-alist)
       '(("\\.m" (".h")) ("\\.h" (".m"))))

;  (color-identifiers-mode t)

  ;; Setup indentation -- modified from
  ;; https://github.com/GriffinSchneider/emacs-config/blob/master/objective-c-customizations.el
  ;; with better block indentation
  (setq tab-width 4)
  (c-set-style "java")
  (c-set-offset 'brace-list-close '0)
  (c-set-offset 'brace-list-intro '+)
  (c-set-offset 'arglist-close '0)
  (c-set-offset 'topmost-intro-cont '0)
  (c-set-offset 'statement-cont '0)
  ; brackets should be at same indentation level as the statements they open
  (c-set-offset 'substatement-open '0)
  (c-set-offset 'inline-open '+)
  (c-set-offset 'block-open '+)
  ; all "opens" should be indented by the c-indent-level
  (c-set-offset 'brace-list-open '+)
  ; indent case labels by c-indent-level, too
  (c-set-offset 'case-label '+)
  (c-set-offset 'objc-method-call-cont '0)
  (c-set-offset 'arglist-cont-nonempty '0)

  ;; Fix override of tab switch keybinding
  (define-key objc-mode-map (kbd "M-j") nil))

(add-hook 'objc-mode-hook 'dml-objc-mode-hook)

(font-lock-add-keywords
 'objc-mode
 '(("^[^\n]\\{120\\}\\(.*\\)$"
    1 font-lock-warning-face prepend)))

(provide 'objective-c-customizations)
