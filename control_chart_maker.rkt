#lang racket
(require "image-maker.rkt")
(require "file-cleanup.rkt")
(require "rename-tmp-file.rkt")

; Run through the directory with these functions
 (for ([i (directory-list ".\\to_be_printed")])
   (image-maker)
   (file-cleanup)
   (rename-tmp-file))