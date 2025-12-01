(defn solve [input]
  (var pos 50)
  (var cnt 0)

  (def lines (string/split "\n" (string/trim input)))

  (each line lines
    (def inst (string/trim line))
    (when (not (empty? inst))
        (def dir (string/slice inst 0 1))
        (def val (scan-number (string/slice inst 1)))

      (var az 0)

      (if (= dir "R")
        (do
          (def eval (+ pos val))
          (set az (- (math/floor (/ eval 100))
                              (math/floor (/ pos 100))))
          (set pos (+ pos val)))

        (do
          (def sval (- pos val))
          (def eval (- pos 1))
          (set az (- (math/floor (/ eval 100))
                              (math/floor (/ (- sval 1) 100))))
          (set pos (- pos val))))

      (set cnt (+ cnt az))

      (set pos (mod pos 100))
      (if (< pos 0) (set pos (+ pos 100)))))

  (print cnt))

(defn main [& args]
  (def input (try
               (slurp "day1.txt")
               ([err] nil nil)))

  (if input
    (solve input)))
