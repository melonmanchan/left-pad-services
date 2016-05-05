(ns leftpad.handler
  (:require [compojure.core :refer :all]
            [compojure.route :as route]
            [compojure.handler :as handler]
            [ring.middleware.json :refer [wrap-json-response]]
            [ring.middleware.params :refer [wrap-params]]
            [ring.util.response :refer [response]]
            [ring.middleware.defaults :refer [wrap-defaults site-defaults]]))

(defroutes app-routes
  (GET "/" {:keys [params] :as request} (response {:foo (get params :str "none")}))
  (route/not-found "Not Found"))

(def app
  (-> (handler/api app-routes)
             (wrap-params)
             (wrap-json-response)))
