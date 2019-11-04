;Question 4

(defun isnode (lst)
  (if (and (null (second lst)) (null (third lst))) nil t)) ; Checks whether the given list is a node

(defun check_l (lst) (if (null (second lst)) t (>= (car lst) (car (second lst))))) ; Checks whether the left child is less than parent element

(defun check_r (lst) (if (null (third lst)) t (<= (car lst) (car (third lst)))))  ; Checks whether the right child is greater than the parent element

(defun check_children (lst) (and (check_l lst) (check_r lst))) ; Checks both the left and right children

; Checks the tree
(defun check_tree (lst)
  (cond ((null lst) nil)
    ((check_children lst)
     (and (if (isnode (second lst)) (check_tree (second lst)) t)
       (if (isnode (third lst)) (check_tree (third lst)) t)))))


(print (check_tree '(8 (3 (1 () ()) (6 (4 () ()) (7 () ()))) (10 () (14 (13) ())))))
(print (check_tree '(8 (3 (1 () ()) (6 (4 () ()) (7 () ()))) (13 () (10 (14) ())))))
(print (check_tree '(8 (3 (1 () ()) (4 (6 () ()) (7 () ()))) (10 () (14 (13) ())))))
(print (check_tree '(8 (3 (1 (0) (5)) (6 (4 (2) (5)) (7 (5) (9)))) (10 (8) (14 (13) (16))))))
(write-line "")
(write-line "Finished")
