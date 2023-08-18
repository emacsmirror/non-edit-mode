;;; non-edit-mode.el --- Minor mode that disables editing -*- lexical-binding: t; -*-

;; Author: aragaer <aragaer@gmail.com>
;; Version: 0.1.0
;; Package-Requires: ((emacs "28.2") (compat "29.1.1.0"))
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

(defun update-non-edit-keymap (_ funcs)
  (setq non-edit-mode-map (make-sparse-keymap))
  (mapc (lambda (func)
          (define-key non-edit-mode-map
            (kbd (format "<remap> <%s>" func)) #'ignore))
        funcs))

(defgroup non-edit nil
  "Customization variables for Non-Edit mode."
  :group 'convenience
  :tag "Non-Edit")

(defcustom non-edit-disabled-functions
  '(backward-delete-char-untabify
    delete-forward-char
    newline
    self-insert-command)
  "List of functions to disable in non-edit mode."
  :group 'non-edit
  :type 'list
  :safe 'listp
  :set #'update-non-edit-keymap)

;;;###autoload
(define-minor-mode non-edit-mode
  "Minor mode that disables any input"
  :lighter " Nav")

(provide 'non-edit-mode)

;;; non-edit-mode.el ends here
