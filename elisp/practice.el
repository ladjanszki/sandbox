;; 1.2 Run a program
(+ 2 2)

;; 1.7 Variables

;; 1.8 Arguments
(concat "abc" "def")
(+ 2 fill-column)
(concat "The " (number-to-string (+ 2 fill-column)) " red foxes")

;; 1.8.5 The message function

;; Using the echo area
(message "Message in the echo area")

;; Here buffer-name is in parenthesis because it is a function
(message "The name of this buffer is %s" (buffer-name))

;; fill-column is not in parenthesis because it is a variable
(message "I can print integers too %d" fill-column)

;; More complex
;; A string in double quotes evaluates to itself
(message "There are %d %s in the office!" (- fill-column 14) "pink elephants")

;; Format the code
(message "He saw %d %s"
	 (- fill-column 32)
	 (concat "red "
		 ;; substring is a built in function to get a substring based on indexing
		 (substring
		  "The quick brown foxes jumped." 16 21)
		 " leaping."))

;; 1.9 Setting the values of variables

;; set sets a variable
(set 'flowers '(rose violet daisy buttercup))

;; setq means set and quote 
(setq carnivores '(lion tiger leopard))

;; More than one argument can be given
(setq trees '(pine oak maple)
      herbivores '(gazelle antilope zebra))

;; 2.1 Buffer names
;; These functions get the name of the buffer or the name of the file associated to the buffer
;; If a file is not saved the buffer-file-name function returns nil
(buffer-name)
(buffer-file-name)

;; 2.2 Getting buffers
;; In 2.1 the NAMES of the buffers were returned
;; In this section the buffer object is returned
(current-buffer)
(other-buffer)

;; 2.3 Switching buffers
;; Switch-to-buffer is a function 
(switch-to-buffer (other-buffer))

;; 2.4 Buffer size and Location of point
;; Number of caracters in the buffer
(buffer-size)

;; Character count of the point
(point)

;; Beginning and end
;; The "beginning" and "end" of the buffer or the "beginning" and "end" of the narrowing
;; For narrowing and widening: https://www.gnu.org/software/emacs/manual/html_mono/eintr.html#Narrowing-_0026-Widening
(point-min)
(point-max)


;; 2.5 Exercise
;; Find a file with which you are working and move towards its middle.

;; Jump to the middle character
(goto-char (/ (buffer-size) 2))

;; Moving towards the middle
(if (> (point) (/ (buffer-size) 2)) (backward-char) (forward-char))

;; 3 How to write function definitions
;; Primitive function: those Emacs Lisp functions which were written in C as core functionality





