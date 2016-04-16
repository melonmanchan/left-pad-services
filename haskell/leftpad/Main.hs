{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

import GHC.Generics
import Web.Scotty
import Data.Aeson (ToJSON)

data StrOutput = StrOutput { str :: String } deriving (Generic)

instance ToJSON StrOutput

main :: IO ()
main = scotty 3000 $ do
  get "/" $ do
    let out = StrOutput { str = "test" }
    json out
