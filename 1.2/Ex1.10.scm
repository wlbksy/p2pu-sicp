;; Exercise 1.10:
;; --------------
;; The following procedure computes a mathematical function
;; called Ackermann’s function.

;; Using 2 as base
(define (A x y)
  (cond ((= y 0) 0)
	((= x 0) (* 2 y))
	((= y 1) 2)
	(else (A (- x 1)
		 (A x (- y 1))))))

;; What are the values of the following expressions?

(A 1 10) ; --> 2^10 = 1024

;; (A 1 10)
;; (A 0 (A 1 9))
;; (* 2 (A 1 9))
;; (* 2 (A 0 (A 1 8)))
;; (* 2 (* 2 (A 1 8)))
;; (* 2 (* 2 (A 0 (A 1 7))))
;; (* 2 (* 2 (* 2 (A 1 7))))
;; (* 2 (* 2 (* 2 (A 0 (A 1 6)))))
;; (* 2 (* 2 (* 2 (* 2 (A 1 6)))))
;; (* 2 (* 2 (* 2 (* 2 (A 0 (A 1 5))))))
;; (* 2 (* 2 (* 2 (* 2 (* 2 (A 1 5))))))
;; (* 2 (* 2 (* 2 (* 2 (* 2 (A 0 (A 1 4)))))))
;; (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (A 1 4)))))))
;; (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (A 0 (A 1 3))))))))
;; (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (A 1 3))))))))
;; (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (A 0 (A 1 2)))))))))
;; (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (A 1 2)))))))))
;; (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (A 0 (A 1 1))))))))))
;; (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (A 1 1))))))))))
;; (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 2)))))))))
;; (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 4))))))))
;; (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 8)))))))
;; (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 16))))))
;; (* 2 (* 2 (* 2 (* 2 (* 2 32)))))
;; (* 2 (* 2 (* 2 (* 2 64))))
;; (* 2 (* 2 (* 2 128)))
;; (* 2 (* 2 256))
;; (* 2 512)
;; 1024

(A 2 4) ; --> 65536

;; (A 2 4)
;; (A 1 (A 2 3))
;; (A 1 (A 1 (A 2 2)))
;; (A 1 (A 1 (A 1 (A 2 1))))
;; (A 1 (A 1 (A 1 2)))
;; (A 1 (A 1 (A 0 (A 1 1))))
;; (A 1 (A 1 (* 2 (A 1 1))))
;; (A 1 (A 1 (* 2 2)))
;; (A 1 (A 1 4)) ---> 2^(2^4) = 2^16 = 65536
;; (A 1 (A 0 (A 1 3)))
;; (A 1 (* 2 (A 1 3)))
;; (A 1 (* 2 (A 0 (A 1 2))))
;; (A 1 (* 2 (* 2 (A 1 2))))
;; (A 1 (* 2 (* 2 (A 0 (A 1 1)))))
;; (A 1 (* 2 (* 2 (* 2 (A 1 1)))))
;; (A 1 (* 2 (* 2 (* 2 2))))
;; (A 1 (* 2 (* 2 4)))
;; (A 1 (* 2 8))
;; (A 1 16) ---> 2^16 = 65536
;; 65536

(A 3 3) ; --> 65536

(define (f n) (A 0 n))
;; f(n) = 2*n = 2+2+...+2 (n times)

(define (g n) (A 1 n))
;; g(n) = A(0, A(1, n-1)) = (expt 2 n) = 2^n = 2*2*...*2 (n times)

(define (h n) (A 2 n))
;; h(n) = A(1, A(2, n-1)) = (expt 2 (expt 2 (...))) = 2^2^...^2 (n times)

;; Test:
(expt 2 (expt 2 4)) ; --> 65536
(- (expt 2 (expt 2 (expt 2 2))) (A 2 4)) ; --> 0
(- (expt 2 (expt 2 (expt 2 (expt 2 2)))) (A 2 5)) ; --> 0
(- (expt 2 (expt 2 (expt 2 (expt 2 (expt 2 2))))) (A 2 6)) 
; --> it will calculate this forever, eating all memory

(A 1 4) ; --> 2^4 = 16

(A 4 2) ; --> 4

(A 3 1) ; --> 2
(A 3 2) ; --> 4
(A 3 3) ; --> 65536
(A 3 4) ; --> 2^2^..^2 (65536 times): the Universe is too small to contain this

;;(- (expt 2 65536) (A 2 5))
;;(- (expt 2 65536) (h 5))
