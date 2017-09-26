#lang racket
; renames ./temp/control_chart.png to one of many numbers
;(if 
(provide rename-tmp-file)

(define (rename-tmp-file)
;(if (file-exists? "./temp/control_chart.png")
    (rename-file-or-directory
     "./temp/control_chart.png"
     (string-append
      "./temp/control_chart_"
      (number->string (length(directory-list "./temp")))
      (string-append ".png")))
    ;(error "No file to rename")
  )
                              