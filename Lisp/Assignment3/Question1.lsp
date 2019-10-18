;Question 1 A)

(defun functionA (theList n)
  (let ((newList ()))
    (loop
      (when (< n 1) (return newList)) ;(return newList))))
      (decf n)
      (setq newList (append newList (list (car theList))))
      (setq theList (cdr theList)))))

(print (functionA '(1 2 3 4 5) 3))
