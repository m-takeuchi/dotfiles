;;; gmsh-mode-el -- Major mode for editing gmsh files

;; Author: Jan Domurath <jan.domurath@googlemail.com>
;; Created: 17 Oct 2011
;; Keywords: gmsh major-mode

;; Copyright (C) 2011 Jan Domurath <jan.domurath@googlemail.com>

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2 of
;; the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be
;; useful, but WITHOUT ANY WARRANTY; without even the implied
;; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
;; PURPOSE.  See the GNU General Public License for more details.

;; You should have received a copy of the GNU General Public
;; License along with this program; if not, write to the Free
;; Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,
;; MA 02111-1307 USA

;;; Commentary:
;;
;; This mode is my first attempt to write an Emacs mode.
;; It's based on the tutorial by Scott Andrew Borton,
;; which can be found here:
;;    http://www.emacswiki.org/emacs/ModeTutorial
;;
;; Here is a list of functions build-ins ...
;; with there corresponding font-lock-faces
;;
;; font-lock-constant-face
;; "Pi" "GMSH_MAJOR_VERSION" "GMSH_MINOR_VERSION" "GMSH_PATCH_VERSION" "MPI_Size"
;; "MPI_Rank"
;;
;; font-lock-keyword-face
;; "Function" "Return" "Call" "For" "In" "EndFor" "If" "EndIf" "newp" "newl"
;; "news" "newv" "newll" "newsl" "newreg" "Exit" "Draw" "Delete Model"
;; "Delete Physicals" "Delete Variables" "Delete Options" "Mesh" "Include"
;; "Sleep" "System" "SetName" "SyncModel" "Printf" "Merge" "Delete" "Print"
;; "Coherence" "Hide"  "Show"
;;
;; font-lock-builtin-face
;; "Acos" "Asin" "Atan" "Atan2" "Ceil" "Cos" "Cosh" "Exp" "Fabs" "Fmod" "Floor"
;; "Hypot" "Log" "Log10" "Modulo" "Rand" "Sqrt" "Sin" "Sinh" "Tan" "Tanh"
;;
;; font-lock-type-face
;; "Point" "Physical Point" "BSpline" "Circle" "CatmullRom" "Ellipse" "Line"
;; "Spline" "Line Loop" "Compound Line" "Physical Line" "Plane Surface"
;; "Ruled Surface" "Surface Loop" "Compound Surface" "Physical Surface" "Volume"
;; "Compound Volume" "Physical Volume" "Extrude"  "Dilate" "Rotate" "Symmetry"
;; "Translate" "Boundary" "CombinedBoundary" "BoundingBox"
;;
;;
;; Usage:
;; put (require 'gmsh-mode) in your init.el
;;


;;; Code:
(defvar gmsh-mode-hook nil)

(add-to-list 'auto-mode-alist '("\\.geo\\'" . gmsh-mode))

(defvar gmsh-mode-map
  (let ((map (make-keymap)))
    (define-key map "\C-c\C-c" 'gmsh-parse-file-in-gmsh)
    (define-key map [f5] 'gmsh-open-file-in-gmsh)
    map)
  "Keymap for gmsh major mode")


(defconst gmsh-font-lock-keywords-1
  (list
   '("\\(A\\(?:cos\\|sin\\|tan2?\\)\\|C\\(?:eil\\|osh?\\)\\|Exp\\|F\\(?:abs\\|loor\\|mod\\)\\|Hypot\\|Log\\(?:10\\)?\\|Modulo\\|Rand\\|S\\(?:inh?\\|qrt\\)\\|Tanh?\\)" . font-lock-builtin-face)
   '("\\(C\\(?:all\\|oherence\\)\\|D\\(?:elete\\(?: \\(?:Model\\|\\(?:Option\\|Physical\\|Variable\\)s\\)\\)?\\|raw\\)\\|E\\(?:nd\\(?:For\\|If\\)\\|xit\\)\\|F\\(?:or\\|unction\\)\\|Hide\\|I\\(?:nclude\\|[fn]\\)\\|Me\\(?:rge\\|sh\\)\\|Printf?\\|Return\\|S\\(?:etName\\|how\\|leep\\|y\\(?:ncModel\\|stem\\)\\)\\|new\\(?:ll\\|reg\\|sl\\|[lpsv]\\)\\)" . font-lock-keyword-face)
   '("\\(GMSH_\\(?:\\(?:M\\(?:\\(?:AJ\\|IN\\)OR\\)\\|PATCH\\)_VERSION\\)\\|MPI_\\(?:Rank\\|Size\\)\\|Pi\\)" . font-lock-constant-face)
   '("\\(B\\(?:Spline\\|ound\\(?:ary\\|ingBox\\)\\)\\|C\\(?:atmullRom\\|ircle\\|om\\(?:binedBoundary\\|pound \\(?:\\(?:Lin\\|Surfac\\|Volum\\)e\\)\\)\\)\\|Dilate\\|E\\(?:\\(?:llips\\|xtrud\\)e\\)\\|Line\\(?: Loop\\)?\\|P\\(?:hysical \\(?:Line\\|Point\\|\\(?:Surfac\\|Volum\\)e\\)\\|lane Surface\\|oint\\)\\|R\\(?:\\(?:otat\\|uled Surfac\\)e\\)\\|S\\(?:pline\\|urface Loop\\|ymmetry\\)\\|\\(?:Translat\\|Volum\\)e\\)" . font-lock-type-face)
    '("\\<Function[ \t]+\\([a-zA-Z_]+[a-zA-Z0-9_]*\\)" 1 font-lock-function-name-face))
  "Minimal highlighting for gmsh mode.")

(defvar gmsh-font-lock-keywords gmsh-font-lock-keywords-1
  "Default highlighting for gmsh mode")


(defvar gmsh-mode-syntax-table
  (let ((gmsh-mode-syntax-table (make-syntax-table)))

    ; Comment styles are same as C++
    (modify-syntax-entry ?/ ". 124b" gmsh-mode-syntax-table)
    (modify-syntax-entry ?* ". 23" gmsh-mode-syntax-table)
    (modify-syntax-entry ?\n "> b" gmsh-mode-syntax-table)
    gmsh-mode-syntax-table)
  "Syntax table for gmsh-mode")


(defun gmsh-open-file-in-gmsh ()
      (interactive)
      (compile (concat "gmsh " (buffer-name))))

(defun gmsh-parse-file-in-gmsh ()
      (interactive)
      (compile (concat "gmsh " (buffer-name) " -")))


(defun gmsh-mode ()
 "Major mode for editing gmsh files.

Key bindings:

  C-c C-c: gmsh-parse-file-in-gmsh -  parse file with gmsh (using compile mode)
  f5 : gmsh-open-file-in-gmsh - open file in gmsh (using compile mode)
"
  (interactive)
  (kill-all-local-variables)
  (make-local-variable 'comment-start)
  (make-local-variable 'comment-end)
  (make-local-variable 'comment-start-skip)

  ;; make compilation-mode recognize errors
  (setq compilation-error-regexp-alist
       (cons '("^Error.* : '\\([^ \t\n]+\\)', line \\([0-9]+\\) :.*" 1 2)
          compilation-error-regexp-alist))


  (use-local-map gmsh-mode-map)
  (set-syntax-table gmsh-mode-syntax-table)
  ;; Set up font-lock
  (set (make-local-variable 'font-lock-defaults) '(gmsh-font-lock-keywords))

  (setq major-mode 'gmsh-mode
        mode-name "gmsh"
        comment-start "// "
        comment-end ""
        comment-start-skip "// *")

  (run-hooks 'gmsh-mode-hook))

(provide 'gmsh-mode)

;;; gmsh-mode.el ends here
