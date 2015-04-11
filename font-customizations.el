;; M-x ns-popup-font-panel

(defun small-mac-fonts ()
  (cond ((eq system-type 'darwin)
         (setq default "-apple-Monaco-medium-normal-normal-*-10-*-*-*-m-0-iso10646-1")
         (setq bold "-apple-andale mono-medium-b-normal--14-120-75-75-m-12-mac-roman")
         (setq italic "-apple-andale mono-medium-i-normal--14-120-75-75-m-120-mac-roman")
         (setq bold-italic "-apple-andale mono-medium-i-normal--14-120-75-75-m-120-mac-roman")
         )
        (t t)))

(defun big-mac-fonts ()
  (cond ((eq system-type 'darwin)
         (setq default "-apple-Monaco-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1")
         (setq bold "-apple-andale mono-medium-b-normal--14-120-75-75-m-12-mac-roman")
         (setq italic "-apple-andale mono-medium-i-normal--14-120-75-75-m-120-mac-roman")
         (setq bold-italic "-apple-andale mono-medium-i-normal--14-120-75-75-m-120-mac-roman")
         )
        (t t)))

(defun reload-small-mac-fonts ()
  (interactive)
  (small-mac-fonts)
  (load "color-customizations"))

(defun reload-big-mac-fonts ()
  (interactive)
  (big-mac-fonts)
  (load "color-customizations"))

(global-set-key (kbd "C-c [") 'reload-small-mac-fonts)
(global-set-key (kbd "C-c ]") 'reload-big-mac-fonts)

;; by default, use small fonts
(small-mac-fonts)

(provide 'font-customizations)
