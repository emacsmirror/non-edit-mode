# Non-edit mode

Minor mode that disables most editing commands (similar to command
mode in Vi). Can be used to protect files from being edited, while
also allowing copy/paste operations, editing org header properties and
tags etc.

## Examples

### Toggle non-edit mode
```elisp
(define-key global-map (kbd "C-<escape>") 'non-edit-mode)
```

### Open org-roam notes in a non-edit mode
This example opens all files in non-edit mode.
```elisp
(defun is-protected (file-name)
  (string-prefix-p org-roam-directory file-name))

(defun non-edit-for-protected ()
  (when-let* ((file-name (buffer-file-name))
              (is-protected file-name))
    (non-edit-mode)))

(add-hook 'text-mode-hook #'non-edit-for-protected)
```
