{-
   This is a "stub" file.  It's a little start on your solution. It's not a
   complete solution though; you have to write some code.

   The module name is expected by the test program and must match the name of this
   file. It has to stay just the way it is.
-}


module HelloWorld exposing (..)
import String exposing (concat)

-- It's good style to include any types at the top level of your modules.


helloWorld : Maybe String -> String
helloWorld name =
    case name of
        Nothing -> "Hello, World!"
        Just name -> String.concat ["Hello, ", name, "!"]



{-
   When you have a working solution, REMOVE ALL THE STOCK COMMENTS.
   They're here to help you get started but they only clutter a finished solution.
   If you leave them in, nitpickers will protest!
-}
