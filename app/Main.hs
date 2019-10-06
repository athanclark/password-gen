module Main where

import Lib
import Options.Applicative


main :: IO ()
main = do
  (salt,subject) <- execParser opts
  putStrLn (makePassword salt subject)
  where
    opts = info (pwOptions <**> helper)
        ( fullDesc
      <> progDesc "Generate a password via SCrypt, Base58 encoded for SUBJECT over SALT"
      <> header "password-gen - a password generator"
        )



pwOptions :: Parser (String,String)
pwOptions = (,) <$> salt <*> subject
  where
    salt = strOption
        ( long "salt"
      <> short 's'
      <> metavar "SALT"
        )

    subject = strOption
        ( long "subject"
      <> short 'p'
      <> metavar "SUBJECT"
        )
