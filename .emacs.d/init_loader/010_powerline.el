;;;; Powerline settings
(require 'powerline)

;;; select theme
(powerline-default-theme)
;; (powerline-center-theme)


(setq ns-use-srgb-colorspace nil)

;; (setq powerline-arrow-shape 'curve)

;; (powerline-buffer-size nil 'l)
;; (powerline-raw mode-line-mule-info nil 'l)
;; (powerline-raw " ")

;;;; My color settings
(set-face-attribute 'mode-line nil
                    :foreground "Black"
                    :background "DarkOrange"
                    :box nil)

;; (set-face-attribute 'mode-line nil
;;                     :foreground "#ff0"
;;                     :background "#102090"
;;                     :box nil)

(set-face-attribute 'powerline-active1 nil
                    :foreground "#999"
                    :background "#101010"
                    :inherit 'mode-line)

;; (set-face-attribute 'powerline-active2 nil
;;                     :foreground "#ff0"
;;                     :background "#202090"
;; ;;                     :inherit 'mode-line)
