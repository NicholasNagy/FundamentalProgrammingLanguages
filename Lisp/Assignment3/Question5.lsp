; Question 5


(defun power-of-n (x n)
  (if (> n 1) (* x (power-of-n x (- n 1))) x))


(defun find-ln (x max n)
  (cond ((equal max n) (if (oddp n) (/ (power-of-n x n) n) (- 0 (/ (power-of-n x n) n))))
    ((oddp n) (+ (/ (power-of-n x n) n) (find-ln x max (+ n 1))))
    ((evenp n) (+ (- 0 (/ (power-of-n x n) n)) (find-ln x max (+ n 1))))))

(defun compute-ln (&key (x 0) (n 1))
  (if (and (numberp x) (numberp n) (plusp n) (or (and (< x 1) (> x -1)) (equal x 1))) (if (equal n 1) x (+ x (find-ln x n 2)))
    (progn
      (princ "Error invalid input")
      nil)))






(compute-ln :n -1)
