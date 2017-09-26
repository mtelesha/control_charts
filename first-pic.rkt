#lang racket
; provide the path and file name for bitmap/file

(provide first-pic)

; use if so when there is only one file we can 
(define (first-pic)
(build-path ".\\to_be_printed" (car(directory-list "./to_be_printed"))))