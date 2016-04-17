{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

import GHC.Generics
import Web.Scotty
import Data.Aeson (ToJSON)

data PadOutput = PadOutput { str :: String } deriving (Generic)
instance ToJSON PadOutput

-- Snippet originally from https://hackage.haskell.org/package/acme-left-pad
leftPad :: String -> Int -> String -> String
leftPad s l "" = leftPad' s l ' '
leftPad s l (c:[]) = leftPad' s l c

leftPad' s 0 c = s
leftPad' s n c = if length s < n then [c] ++ leftPad' s (n - 1) c else leftPad' s (n - 1) c

main :: IO ()
main = scotty 3000 $ do
  get "/" $ do
    stringToPad <- param "str"
    padding     <- param "ch"
    padLength   <- param "len"
    let out = PadOutput { str = leftPad stringToPad padLength padding}
    json out
