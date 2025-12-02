(defn invalid [n]
  (def s (string n))
  (def len (length s))

  (if (odd? len)
    false
    (let [half (/ len 2)
          p1 (string/slice s 0 half)
          p2 (string/slice s half)]
      (= p1 p2))))

(defn solve [input]
  (var tsum 0)

  (def ci (->> input
                       (string/replace-all "\n" "")
                       (string/replace-all " " "")))

  (def rng (string/split "," ci))

  (each r rng
    (def parts (string/split "-" r))
    (def start (scan-number (get parts 0)))
    (def end (scan-number (get parts 1)))

    (loop [i :range [start (+ end 1)]]
      (if (invalid i)
        (set tsum (+ tsum i)))))

  (print tsum))


(defn main [& args]
  (def input (try
               (slurp "day2.txt")
               ([err] nil nil)))

  (if input
    (solve input)))
