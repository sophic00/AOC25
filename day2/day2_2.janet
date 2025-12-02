(defn invalid [n]
  (def s (string n))
  (def len (length s))
  (var fnd false)

  (loop [p :range [1 (+ 1 (math/floor (/ len 2)))]
         :until fnd]

    (when (= 0 (% len p))
      (let [sub (string/slice s 0 p)
            rpt (/ len p)
            recon (string/repeat sub rpt)]

        (if (= s recon)
          (set fnd true)))))
  fnd)

(defn solve [input]
  (var tsum 0)

  (def ci (->> input
               (string/replace-all "\n" "")
               (string/replace-all " " "")))

  (def rngstr (string/split "," ci))

  (each r rngstr
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
               ([err] nil)))

  (solve input))
