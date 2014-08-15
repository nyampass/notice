(ns notice
  (:require [clojure.java.io :as io])
  (:import [com.sun.jna Native Library]
           [java.io File]))

(def lib-name "libnotice.dylib")

(defn temp-lib-file []
  (File/createTempFile "libnotice" ".dylib"))

(gen-interface
 :name jna.Notice
 :extends [com.sun.jna.Library]
 :methods [[send [String, String, String, String] void]])

(defn notice [title sub-title message sound]
  (let [lib-file (temp-lib-file)
        resource (-> lib-name
                     io/resource
                     io/input-stream)]
    (io/copy resource
             lib-file)
    (.send (Native/loadLibrary (.getAbsolutePath lib-file)
                               jna.Notice)
           title sub-title message sound)
    (.delete lib-file)))
