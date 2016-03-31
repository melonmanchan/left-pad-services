(ns leftpad.handler
  (:require [compojure.core :refer :all]
            [compojure.route :as route]
            [ring.middleware.json :refer [wrap-json-response]]
            [ring.util.response :refer [response]]
            [ring.middleware.defaults :refer [wrap-defaults site-defaults]]))

(defroutes app-routes
  (GET "/" [] (response {:foo "bar"}))
  (route/not-found "Not Found"))

(def app
  (wrap-json-response app-routes site-defaults))
