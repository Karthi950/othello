


import Svg exposing (..)
import Svg.Attributes exposing (..)
import Array exposing (Array)
import Array as Array



main =
 svg
   [ version "1.1", x "0", y "0"
   ]
   [ 
   rect [ fill "#D2691E", x "20", y "97.392", width "40px", height "40px" ] [],
   rect [ fill "#3CB371", x "61", y "97.392", width "40px", height "40px" ] [],
   rect [ fill "#D2691E", x "102", y "97.392", width "40px", height "40px" ] [],
   rect [ fill "#3CB371", x "143", y "97.392", width "40px", height "40px" ] [],
   rect [ fill "#D2691E", x "184", y "97.392", width "40px", height "40px" ] [],
   rect [ fill "#3CB371", x "225", y "97.392", width "40px", height "40px" ] [],

   rect [ fill "#D2691E", x "266", y "97.392", width "40px", height "40px" ] []
--   ,circle [ r "4.5",fill "#800000",x "150,99", y "97.392" ] []
   ]
   
startBoard : Board
startBoard =
   [ List.repeat 8 Empty
   , List.repeat 8 Empty
   , List.repeat 8 Empty
   , [ Empty, Empty, Empty, Occupied Black, Occupied White, Empty, Empty, Empty ]
   , [ Empty, Empty, Empty, Occupied White, Occupied Black, Empty, Empty, Empty ]
   , List.repeat 8 Empty
   , List.repeat 8 Empty
   , List.repeat 8 Empty
   ]
       |> List.map Array.fromList
       |> Array.fromList
       |> Board    
   


type Cell
   = Empty
   | Occupied Stone

type Board
   = Board (Array (Array Cell))
   
type Stone
   = Black
   | White
   
   


