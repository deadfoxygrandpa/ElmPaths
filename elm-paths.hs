import System.Environment
import System.Exit
import qualified Elm.Internal.Paths as Elm

handle :: [String] -> IO ()
handle args =
	case args of
		[]      -> putStrLn usage >> exitWith (ExitFailure 1)
		(cmd:_) -> 	case cmd of
						"docs"    -> putStrLn Elm.docs
						"runtime" -> putStrLn Elm.runtime
						_		  -> putStrLn usage >> exitWith (ExitFailure 1)

usage :: String
usage = "Usage:\telm-paths docs\t\tprint absolute file path to docs.json" ++
            "\n\telm-paths runtime\tprint absolute file path to elm-runtime.js"

main :: IO ()
main = do
	args <- getArgs
	handle args
