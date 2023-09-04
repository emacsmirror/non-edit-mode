;;; non-edit-mode.el --- Minor mode that disables editing -*- lexical-binding: t; -*-

;; Author: aragaer <aragaer@gmail.com>
;; Version: 0.1.0
;; Package-Requires: ((emacs "24.1"))
;; URL: https://gitlab.com/aragaer/non-edit-mode
;; Keywords: convenience

;;; License:
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Minor mode that disables most editing commands.

;;; Code:

(defvar non-edit-mode-map (make-sparse-keymap))

(defun non-edit--update-keymap (_ funcs)
  (let ((ignored-map (make-sparse-keymap)))
    (mapc (lambda (func)
            (define-key ignored-map
              (kbd (format "<%s>" func)) #'ignore))
          funcs)
    (define-key non-edit-mode-map (kbd "<remap>") ignored-map)))

;;;###autoload
(defgroup non-edit nil
  "Customization variables for Non-Edit mode."
  :group 'convenience
  :tag "Non-Edit")

;;;###autoload
(defcustom non-edit-disabled-functions
  '(backward-delete-char-untabify
    delete-forward-char
    newline
    self-insert-command)
  "List of functions to disable in non-edit mode."
  :group 'non-edit
  :type '(list function)
  :safe 'listp
  :set #'non-edit--update-keymap)

;;;###autoload
(define-minor-mode non-edit-mode
  "Minor mode that disables any input"
  :lighter " ne")

(provide 'non-edit-mode)

;;; non-edit-mode.el ends here
