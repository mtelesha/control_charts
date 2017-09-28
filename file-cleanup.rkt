#lang racket

; We need three if else
; 1) does the file exist in ./img directory THEN delete in ./to_be_printed
; 2) does the file NOT exist in ./img then move to ./img

(provide file-cleanup)

(define (file-cleanup)
(cond [(file-exists? (build-path "./img" (first (directory-list "./to_be_printed"))))
       (delete-file  (build-path "./to_be_printed" (first (directory-list "./to_be_printed"))))]
      
      [else
       ;(for ([i (directory-list "./to_be_printed")]) ; This line will go through whole directory at once
       (for ([i (list 1)]) ; This line will go through only one tile
         (copy-file    (build-path "./to_be_printed"
                                   (first (directory-list "./to_be_printed")))
                       (build-path "./img"           (first (directory-list "./to_be_printed"))))
         (delete-file  (build-path "./to_be_printed" (first (directory-list "./to_be_printed")))))]))