(ns plottingData.core
  (:import java.io.File)
  (:use [clojure.java.io :only (writer)]))

; frequency, Hz
(def f 5)
; Sampling rate
(def sr 8000)
; Seconds count
(def secs 3)
; Overall samples count
(def nsamples (* sr secs))
; Sine wave coefficient
(def coef (* 2 Math/PI f))

(defn -main
  [& args] 
  (let [f (File/createTempFile "plottingData" "")]
    (.deleteOnExit f)
    (with-open [writer (writer f)]
      (doseq [i (range nsamples)]
        (def x (float (/ i sr)))
        (.write writer (str x " " (Math/sin (* x coef)) "\n"))))
    (.waitFor
      (.exec (Runtime/getRuntime) (str "../../plotter.gp " (.getAbsolutePath f) " ./result") ))))
