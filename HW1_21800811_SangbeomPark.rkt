#lang plai

;Problem 1:
;Solved by myself : Y
;Time taken : about 3 mins
;[contract] dollar->won : number->number
;[purpose] To convert dollar to won
;[tests] (test (dollar->won 3) 3378)
;        (test (dollar->won 1) 1126)
(define (dollar->won a) (* 1126 a))

(test (dollar->won 3) 3378)
(test (dollar->won 1) 1126)


;Problem 2:
;Solved by myself : Y
;Time taken: about 3 mins
;[contract] a+b+c->d : number->number
;[purpose] To add three numbers
;[tests] (test (digit_sum 1 2 3) 6)
;        (test (digit_sum 4 5 6) 15)
(define (digit_sum a b c) (+ a b c))

(test (digit_sum 1 2 3) 6)
(test (digit_sum 4 5 6) 15)


;Problem 3:
;Solved by myself : Y
;Time taken: about 3 mins
;[contract] n * 2.54 * hours -> inchworm-travel : number->number
;[purpose] To calculate inchworm can travel in that time in centimeters
;[tests] (test (inchworm-travel 3 5) 38.1)
;        (test (inchworm-travel 2 6) 30.48)
(define (inchworm-travel n hours) (* 2.54 n hours))

(test (inchworm-travel 3 5) 38.1)
(test (inchworm-travel 2 6) 30.48)

;Problem 4:
;Solved by myself : Y
;Time taken: about 5 mins
;[contract] is-odd? -> Yes/No : number->boolean
;[purpose] To define the number is odd or not
;[tests] (test (is-odd? 10) #f)
;        (test (is-odd? 9) #t)
(define (is-odd? a) (= (modulo a 2) 1))

(test (is-odd? 10) #f)
(test (is-odd? 9) #t)



;Problem 5:
;Solved by myself : Y
;Time taken: about 10 mins
;[contract] num1 num2 -> n!/(n-k)!k! : number->number
;[purpose] To find combinations of two integer
;[tests] (test (combination 5 2) 10)
;        (test (combination 52 2) 1326)
(define (factorial n)
  (cond
    [(= 0 n) 1]
    [else (* n (factorial (- n 1)))]))
(define (combination n k)
  (/ (factorial n) (* (factorial k) (factorial (- n k)))))

(test (combination 5 2) 10)
(test (combination 52 2) 1326)

;Problem 6:
;Solved by myself : Y
;Time taken: about 20 mins
;a
;[purpose] To define PERSON and Professor, UndergraduateStudent and GraduateStudent
;b
;[contract] person -> number of courses : PERSON->number
;[purpose] To find number of person's courses
;[tests] (define myPro (Professor 3 4))
;        (define myUn (UndergraduateStudent 5))
;        (test (have-courses myPro) 3)
;        (test (have-courses myUn) 5)
;c
;[contract] person -> YES/NO : PERSON->boolean
;[purpose] To find that graduate student is ready to graduate
;[tests] (define myGra (GraduateStudent 2 2))
;        (define myGrad (GraduateStudent 8 9))
;        (test (ready-to-graduate myGra) #f)
;        (test (ready-to-graduate myGrad) #t)
(define-type PERSON
  (Professor (courses number?)
             (projects number?))
  (UndergraduateStudent (courses number?))
  (GraduateStudent (courses number?)
                   (papers number?)))
(define (have-courses p)
  (cond
    [(Professor? p) (Professor-courses p)]
    [(UndergraduateStudent? p) (UndergraduateStudent-courses p)]
    [(GraduateStudent? p) (GraduateStudent-courses p)]))
(define (ready-to-graduate p)
  (and (GraduateStudent? p) (> (GraduateStudent-papers p) 2)))
(define myPro (Professor 3 4))
(define myUn (UndergraduateStudent 5))
(define myGra (GraduateStudent 2 2))
(define myGrad (GraduateStudent 8 9))

(test (have-courses myPro) 3)
(test (have-courses myUn) 5)
(test (ready-to-graduate myGra) #f)
(test (ready-to-graduate myGrad) #t)


;Problem 7:
;Solved by myself : Y
;Time taken: about 120 mins
;[contract] '(a b n) => '(alice unnamed unnamed) : list->list
;[purpose] To change list contents depends on alphabet
;[tests] (test (name-alphabet '(a b n)) '(alice unnamed unnamed))
;        (test (name-alphabet '(a b c j k l)) '(alice unnamed cherry jc kate unnamed))
(define (name-alphabet lst)
  (if (empty? lst) empty
      (cons
       (cond
         [(symbol=? (first lst) 'a) 'alice]
         [(symbol=? (first lst) 'c) 'cherry]
         [(symbol=? (first lst) 'j) 'jc]
         [(symbol=? (first lst) 'k) 'kate]
         [else 'unnamed])
       (name-alphabet (rest lst)))))

(test (name-alphabet '(a b n)) '(alice unnamed unnamed))
(test (name-alphabet '(a b c j k l)) '(alice unnamed cherry jc kate unnamed))



;Problem 8:
;Solved by myself : Y
;Time taken: about 5 mins
;[contract] original list => after update list : list->list
;[purpose] To change list old to new if it has
;[tests] (test (update-name 'cherry 'claire (cons 'jc (cons 'cherry (cons 'kate empty)))) '(jc claire kate))
;        (test (update-name 'jc 'jk '(a b c jc)) '(a b c jk))
(define (update-name lst1 lst2 lst3)
  (if (empty? lst3) empty
      (cons
       (cond
         [(symbol=? (first lst3) lst1) lst2]
         [else (first lst3)])
       (update-name lst1 lst2 (rest lst3)))))

(test (update-name 'cherry 'claire (cons 'jc (cons 'cherry (cons 'kate empty)))) '(jc claire kate))
(test (update-name 'jc 'jk '(a b c jc)) '(a b c jk))


