module Lib where

import Crypto.KDF.Scrypt (Parameters (..), generate)
import Data.ByteString (ByteString)
import Data.ByteString.Base58 (bitcoinAlphabet, encodeBase58)
import Data.ByteString.UTF8 (fromString, toString)


params :: Parameters
params = Parameters
  { n = 16384
  , r = 16
  , p = 1
  , outputLength = 32
  }


makePassword :: String -- ^ Salt
             -> String -- ^ Subject
             -> String
makePassword salt subject = toString (encodeBase58 bitcoinAlphabet password)
  where
    password :: ByteString
    password = generate params (fromString subject) (fromString salt)
