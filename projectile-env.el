;;; projectile-env.el --- Quickly open .env files in a Projectile project  -*- lexical-binding: t -*-

;; Copyright (C) 2021 Peter Stuart

;; Author: Peter Stuart <peter@peterstuart.org>
;; Maintainer: Peter Stuart <peter@peterstuart.org>
;; Created: 6 Jun 2021
;; URL: https://github.com/peterstuart/projectile-env
;; Version: 0.1.0
;; Package-Requires: ((emacs "27.1") (projectile "2.4"))

;;; Commentary:

;; Suggested key bindings
;;
;; C-c p e e: projectile-env
;; C-c p e l: projectile-env-local
;; C-c p e t: projectile-env-test
;; C-c p e x: projectile-env-example

;;; Code:

(require 'projectile)

(defun projectile-env (&optional SUFFIX)
  "Open .env file in the project root.

Optionally include a SUFFIX like `.local' to open `.env.local'."
  (interactive)
  (let ((env-file-path
         (expand-file-name
          (concat ".env" SUFFIX)
          (projectile-project-root))))
    (find-file env-file-path)))

(defun projectile-env-local ()
  "Open .env.local file in the project root."
  (interactive)
  (projectile-env ".local"))

(defun projectile-env-test ()
  "Open .env.test file in the project root."
  (interactive)
  (projectile-env ".test"))

(defun projectile-env-example ()
  "Open .env.example file in the project root."
  (interactive)
  (projectile-env ".example"))

(defvar projectile-env t)
(provide 'projectile-env)

;;; projectile-env.el ends here
