(defn solve [input]
  (var pos 50)
  (var cnt 0)
  (def lines (string/split "\n" (string/trim input)))

  (each line lines
    (def inst (string/trim line))
    (when (not (empty? inst))
        (def dir (string/slice inst 0 1))
        (def val (scan-number (string/slice inst 1)))

      (cond
        (= dir "R") (set pos (+ pos val))
        (= dir "L") (set pos (- pos val)))

      (set pos (mod pos 100))

      (if (< pos 0) (set pos (+ pos 100)))

      (if (= pos 0)
        (++ cnt))))

  (print cnt))

(defn main [& args]
  (def input (try
               (slurp "day1.txt")
               ([err] nil nil)))

  (if input
    (solve input)))
