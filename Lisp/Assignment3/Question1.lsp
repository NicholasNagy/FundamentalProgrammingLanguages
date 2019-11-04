;Question 1 A) and B)

(defun functionA (theList n)
  (let ((newList ()))
    (loop
      (when (< n 1) (return newList)) ;(return newList))))
      (decf n)
      (setq newList (append newList (list (car theList))))
      (setq theList (cdr theList)))))



(setf aList (List 1 2 3 4 5))
(print aList)
(setf bList (functionA aList 3))
(print bList)
(setf (car (cdr aList)) 3)
(print bList)
(print aList)

; Question 1 C)
(defun get-length (theList)
  (cond
    ((null theList) 0)
    (t (+ 1 (get-length (cdr theList))))))


(defun cut-in-half (theList)
  (if (equal 1 (get-length theList)) (list theList)
    (let* ((lst1 ()) (lst2 ()) (n (get-length theList)) (half (/ n 2)))
      (loop
        (when (< n 1) (return (list lst1 lst2)))
        (if (> n half)
          (setf lst1 (append lst1 (list (car theList))))
          (setf lst2 (append lst2 (list (car theList)))))
        (decf n)
        (setq theList (cdr theList))))))


(format t "Part C ~%")
(print (cut-in-half '(1 2)))

(print (cut-in-half '(1 2 3)))

(print (cut-in-half '(1 2 3 4)))


; Question 1 D)

(defun make-tree (lst)
  (cond ((< (get-length lst) 2) lst)
        ((null (cdr (cdr lst))) (list (cut-in-half (list (car lst) (car (cdr lst))))))
        ((< (get-length (cdr (cdr lst))) 2) (append (list (cut-in-half (list (car lst) (car (cdr lst))))) (list (make-tree (cdr (cdr lst)))))) ; Made this special case for making a node of 1
        (t (append (list (cut-in-half (list (car lst) (car (cdr lst))))) (make-tree (cdr (cdr lst))))))) ; This case is for when there is at least 2 nodes


(format t "~%~%Part D~%")
(print (make-tree '(1)))
(print (make-tree '(1 2)))
(print (make-tree '(1 2 3)))
(print (make-tree '(1 2 3 4)))
(print (make-tree '(1 2 3 4 5)))
(print (make-tree '(1 2 3 4 5 6 7 8)))


(defun make-tree2 (lst)
  (cond ((equal (get-length lst) 1)  lst)
    ((equal (get-length lst) 2) (cut-in-half lst))
    (t (list (make-tree2 (car (cut-in-half lst))) (make-tree2 (car (cdr (cut-in-half lst))))))))

(format t "~%~%Part D2~%")
(print (make-tree2 '(1)))
(print (make-tree2 '(1 2)))
(print (make-tree2 '(1 2 3)))
(print (make-tree2 '(1 2 3 4)))
(print (make-tree2 '(1 2 3 4 5)))
(print (make-tree2 '(1 2 3 4 5 6 7 8)))



(defun tree-height (tree)
  (cond ((null tree) 0) ((listp tree) (+ 1 (tree-height (car tree))))
    (t 0)))

(format t "~%~%Part D2~%")
(print (tree-height (make-tree2 '(1))))
(print (tree-height (make-tree2 '(1 2))))
(print (tree-height (make-tree2 '(1 2 3))))
(print (tree-height (make-tree2 '(1 2 3 4))))
(print (tree-height (make-tree2 '(1 2 3 4 5))))
(print (tree-height (make-tree2 '(1 2 3 4 5 6 7 8))))
(print (tree-height (make-tree2 '(1 2 3 4 5 6 7 8 9))))
