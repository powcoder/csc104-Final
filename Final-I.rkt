;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "2019-fall-reader.rkt" "csc104")((modname Final-I) (compthink-settings #hash((prefix-types? . #f))))
; ● ● ●  CSC 104 Winter 2020 Final Assignment — Part I ● ● ●

; The following allows the functions you defined here to be used by other files.
(require (only-in racket/base provide))
; ✓ After you define the four functions, uncomment this so that Part II can use the functions ...
#;(provide attach-data
           extract-data
           extract-one
           key-range)

; These functions manipulate data in the form of lists of lists, where we want to access the data
;  based on the first element of each list. In databasing terms: the first column is being used
;  as an “index”.

; For example, suppose we have some cats and dogs with various temperaments, and that
;  we'll mainly ask about them by temperament. The function  attach-data  you'll define helps
;  to create a list with that kind of information ...
#;(same! (join (attach-data (list (list "nice")
                                  (list "good")
                                  (list "very good"))
                            "doggy")
               (attach-data (list (list "mean"))
                            "cat")
               (attach-data (list (list "good")
                                  (list "sleepy"))
                            "kitty"))
         (list (list "nice" "doggy")
               (list "good" "doggy")
               (list "very good" "doggy")
               (list "mean" "cat")
               (list "good" "kitty")
               (list "sleepy" "kitty")))
; ... and the function  extract-data  you'll define can help collect the data by temperament ...
#;(same! (extract-data "good" (list (list "nice" "doggy")
                                    (list "good" "doggy")
                                    (list "very good" "doggy")
                                    (list "mean" "cat")
                                    (list "good" "kitty")
                                    (list "sleepy" "kitty")))
         (list (list "doggy")
               (list "kitty")))

; ● attach-data ●
; For a list of lists and a value, produce the list with the value appended to each list.

#;(same! #;(attach-data (list (list "spot" "the")
                              (list "good")
                              (list "very" "good"))
                        "dog")
         ; ✓ Add a Partial Design expression that creates each element (of the main list)
         ;      by combining the second argument with an element of the first argument ...

         
         (list (list "spot" "the" "dog")
               (list "good" "dog")
               (list "very" "good" "dog")))

; Make sure the three expressions that create the three elements are identical, except in the place
;  you wrote ...
#;(list "spot" "the") ;  ... or ...
#;(list "good") ;  ... or ...
#;(list "very" "good")

; ✓ Recall that an expression that varies only by varying a value in it is implicitly a unary function
;  of the value. Insert the corresponding unary anonymous function literal as the value expression
;  for the following VARIABLE definition ...
#;(define attach   )
; DO NOT change the form of that definition into a named function definition form.

; That will make the following three assertions correct ...
#;(same! (attach (list "spot" "the"))  (list "spot" "the" "dog"))
#;(same! (attach (list "good"))        (list "good" "dog"))
#;(same! (attach (list "very" "good")) (list "very" "good" "dog"))

#;(same! #;(attach-data (list (list "spot" "the")
                              (list "good")
                              (list "very" "good"))
                        "dog")
         ; ✓ Use that anonymous function literal in a Full Design expression ...

         
         (list (list "spot" "the" "dog")
               (list "good" "dog")
               (list "very" "good" "dog")))

; ✓ Define  attach-data  ...


; ● extract-data ●
; For a value and a list of lists, produce the list of data lists attached to that value.

#;(same! #;(extract-data "red" (list (list "blue" "bird")
                                     (list "red" "breasted" "robin")
                                     (list "gold" "finch")
                                     (list "red" "squirrel")))
         ; ✓ Add a Partial Design expression that has the form of the second argument, but with :
         ;       • some of the elements commented-out (using  #; )
         ;       • a function called on each element
         (list (list "breasted" "robin")
               (list "squirrel")))

; Let's work on making a unary predicate that identifies which elements of the example's second
;  argument to contribute to the result.

; ✓ Insert a boolean expression into ...
#;(true!   ) ; ... that contains the literal ...
#;(list "red" "breasted" "robin")
;  ... and that is true because that element should contribute to the result.

; ✓ Insert a boolean expression into ...
#;(false!   ) ; ... that contains the literal ...
#;(list "blue" "bird")
;  ... and that is false because that element should not contribute to the result.

; Make sure the expressions in the two boolean expressions you just created are the same except
;  in the place(s) you used ...
#;(list "red" "breasted" "robin") ; ... versus ...
#;(list "blue" "bird")

; ✓ Insert the corresponding unary anonymous function literal as the value expression in ...
#;(define include?   )

; That will make the following two assertions correct ...
#;(true!  (include? (list "red" "breasted" "robin")))
#;(false! (include? (list "blue" "bird")))

#;(same! #;(extract-data "red" (list (list "blue" "bird")
                                     (list "red" "breasted" "robin")
                                     (list "gold" "finch")
                                     (list "red" "squirrel")))
         ; ✓ Use that anonymous function literal in a Full Design expression ...
         

         (list (list "breasted" "robin")
               (list "squirrel")))

;  ✓ Define  extract-data  ...


; ● extract-one ●
; For a value and a list of lists, produce the first element of the first data list attached to
;  that value.

(define pet-data (list (list "nice" "doggy")
                       (list "good" "doggy")
                       (list "very good" "doggy")
                       (list "mean" "cat")
                       (list "good" "kitty")
                       (list "sleepy" "kitty")))

#;(same! #;(extract-one "good" (reverse pet-data))
         "kitty")

#;(same! #;(extract-one "good" pet-data)
         ; ✓ Add a Full Design expression, using (not mimicing)  extract-data  ...
         

         "doggy")

; Define  extract-one  ...


; ● key-range ●
; For a non-empty list of lists, where each list has a non-negative whole number as its first element,
;  produce the list of all non-negative whole numbers up to and including that number.

#;(same! #;(key-range (list (list 3 "musketeers")
                            (list 5 "easy" "pieces")
                            (list 2 "by" "four")))
         ; ✓ Add (at least) one Design (Partial or Full) expression ...
         

         (list 0 1 2 3 4 5))

; ✓ Define  key-range  ...

