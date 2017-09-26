#lang racket
; enviroment 300 dpi
;size of letter paper is 3300 2550)
(require racket)
(require 2htdp/image)
(require "first-pic.rkt")

   (provide image-maker)


(define (image-maker)
  (define pic (bitmap/file (first-pic)))
  ; figure out the correct ratio for big picture
  (define pic-h (image-height pic))
  (define pic-w (image-width pic))
  ; take the minimin to get to 1350
  (define shelf_pic_ratio (min
                           (/ 1400.0 pic-h)
                           (/ 1400.0 pic-w)))
  
  (define basket_pic_ratio (min
                            (/ 1150.0 pic-h)
                            (/ 1150.0 pic-w)))

  (define text-ratio
    (/  225.0 (image-width (text/font (substring (path->string (car(directory-list "./to_be_printed"))) 
                                                 (- (string-length(path->string(car(directory-list "./to_be_printed")))) 4)) 150 "black" "Gill Sans" 'swiss 'normal 'bold #f))))

  (define pic-name (text/font (substring (path->string(car(directory-list "./to_be_printed"))) 0 (- (string-length(path->string(car(directory-list "./to_be_printed")))) 4)) 150 "black"
                              "Gill Sans" 'swiss 'normal 'bold #f))

  ;create the right size image   
(save-image  
       (place-image ; control chart picture
        (above (scale shelf_pic_ratio
                      pic)
               (square 200 "outline" "white") ; space between image and text
               (text/font (substring (path->string(car(directory-list "./to_be_printed"))) 0 (- (string-length(path->string(car(directory-list "./to_be_printed")))) 4)) 110 "black"
                          "Gill Sans" 'swiss 'normal 'bold #f)
               )

        825 950
        (place-image ; Basket image 1
         (scale/xy basket_pic_ratio
                   basket_pic_ratio
                   pic) 2475 650
                        (place-image ; Basket image 1
                         (scale/xy basket_pic_ratio
                                   basket_pic_ratio
                                   pic) 2475 1900
                                        (empty-scene 3300 2550))))
     
   "./temp/control_chart.png"))
