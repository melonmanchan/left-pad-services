(ns leftpad.handler
  (:require [compojure.core :refer :all]
            [compojure.route :as route]
            [compojure.handler :as handler]
            [ring.middleware.json :refer [wrap-json-response]]
            [ring.middleware.params :refer [wrap-params]]
            [ring.util.response :refer [response]]
            [ring.middleware.defaults :refer [wrap-defaults site-defaults]]))

(defn leftpad
  [mystr len]
  (if (= len "0") mystr (format (str "%" (str len) "s") mystr)))

(defroutes app-routes
  (GET "/" {:keys [params] :as request} (response {:str
                                                  (leftpad (get params :str "") (get params :len "0"))}))
  (route/not-found "Not Found"))

(def app
  (-> (handler/api app-routes)
             (wrap-params)
             (wrap-json-response)))
