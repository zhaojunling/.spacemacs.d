(setq sswanv-packages
      '(
        org
        lua-mode
        company
        evil
        ))

(defun sswanv/post-init-org ()
  (use-package org
    :defer t
    :config
    (progn
      (setq org-agenda-files (quote ("~/org-notes" )))
      (setq org-default-notes-file "~/org-notes/gtd.org")
      (setq org-capture-templates
            '(("t" "todo" entry (file+headline "~/org-notes/gtd.org" "Workspace")
               "* TODO [#B] %?\n  %i\n"
               :empty-lines 1)
              ("n" "notes" entry (file+headline "~/org-notes/notes.org" "Quick notes")
               "* %?\n  %i\n %U"
               :empty-lines 1)
              ("s" "code snippet" entry
               (file "~/org-notes/snippets.org")
               "* %?\t%^g\n#+BEGIN_SRC %^{language}\n\n#+END_SRC")
              ("l" "links" entry (file+headline "~/org-notes/notes.org" "Quick notes")
               "* TODO [#C] %?\n  %i\n %a \n %U"
               :empty-lines 1)
              ("j" "journal"
               entry (file+datetree "~/org-notes/journal.org")
               "* %?"
               :empty-lines 1)))
      )))

(defun sswanv/post-init-lua-mode ()
  (use-package lua-mode
    :defer t
    :config
    (progn
      (require 'company-lua)
      (add-to-list 'company-backends 'company-lua)
      (setq lua-indent-level 4)
      )))

(defun sswanv/post-init-company ()
  (use-package company
    :defer t
    :config
    (progn
      (define-key company-active-map (kbd "M-n") nil)
      (define-key company-active-map (kbd "M-p") nil)
      (define-key company-active-map (kbd "C-n") #'company-select-next)
      (define-key company-active-map (kbd "C-p") #'company-select-previous)
      )))

(defun sswanv/post-init-evil ()
  (use-package evil
    :defer t
    :config
    (progn
      (define-key evil-insert-state-map (kbd "C-f") 'forward-char)
      (define-key evil-insert-state-map (kbd "C-b") 'backward-char)
      (define-key evil-insert-state-map (kbd "C-n") 'next-line)
      (define-key evil-insert-state-map (kbd "C-p") 'previous-line)
      (define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line)
      (define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
      (define-key evil-insert-state-map (kbd "C-k") 'kill-line)
      (define-key evil-insert-state-map (kbd "C-d") 'delete-char)
      )))
