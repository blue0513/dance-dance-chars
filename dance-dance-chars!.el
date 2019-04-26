;;; dance-dance-chars! --- Dance! Dance!! Dance!!!

;; Copyright (C) 2019- blue0513

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA

;; Author: blue0513
;; URL: https://github.com/blue0513/dance-dance-chars!
;; Version: 0.1.0

;;; Commentary:
;;; Code:

(require 'animate)

(defun dance-dance-chars! ()
  "Dance! Dance! Dance!"
  (if (eq this-command 'self-insert-command)
      (progn
        (save-excursion
          (backward-char)
          (let* ((str (thing-at-point 'char))
                 (vpos (- (line-number-at-pos) 1))
                 (hpos (current-column)))
            (animate-string str vpos hpos)))
        (right-char))))

(define-minor-mode dance-dance-chars!-mode
  "Minor mode for dance-dance-chars-mode."
  :init-value nil
  :global nil
  :lighter " ddc"
  (if dance-dance-chars!-mode
      (add-hook 'post-self-insert-hook 'dance-dance-chars! nil t)
    (remove-hook 'post-self-insert-hook 'dance-dance-chars! t)))

(add-hook 'dance-dance-chars!-mode-hook
          '(lambda ()
             (setq animate-n-steps 3)))

;; * provide

(provide 'dance-dance-chars!)

;;; dance-dance-chars!.el ends here
