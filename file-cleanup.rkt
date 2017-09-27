#lang racket

; We need three if else
; 1) does the file exist in ./img directory THEN delete in ./to_be_printed
; 2) does the file NOT exist in ./img then move to ./img

(provide file-cleanup)

(define (file-cleanup)
(if (file-exists? (build-path "./img"           (first (directory-list "./to_be_printed"))))
    (delete-file  (build-path "./to_be_printed" (first (directory-list "./to_be_printed"))))
    (copy-file    (build-path "./to_be_printed" (first (directory-list "./to_be_printed")))
                  (build-path "./img"           (first (directory-list "./to_be_printed"))))))

