;;; non-edit-mode.el -- Minor mode that disables editing -*- lexical-binding: t; -*-

;; Author: aragaer <aragaer@gmail.com>
;; Version: 0.1.0
;; Keywords: read-only

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

(defvar-keymap non-edit-mode-map
  "<remap> <backward-delete-char-untabify>" #'ignore
  "<remap> <delete-forward-char>" #'ignore
  "<remap> <newline>" #'ignore
  "<remap> <self-insert-command>" #'ignore)

;;;###autoload
(define-minor-mode non-edit-mode
  "Minor mode that disables any input"
  :lighter " Nav")

;;;###autoload
(define-key global-map (kbd "C-<escape>") 'non-edit-mode)

;;; non-edit-mode.el ends here
