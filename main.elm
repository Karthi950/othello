import Html.Events exposing (onClick)
import Html exposing(..)
import Html.Attributes as Attr
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Array exposing (Array)
import Array as Array
import Svg.Attributes as SvgAttr
import Html.Events as Events



main =
  Html.beginnerProgram {
      model = model,
      update = update,
      view = view
      }



type alias Model = {
    gamerOne : Bool,
    gamerTwo : Bool
}

model : Model
model = Model True False

view : Model -> Html Msg
view model =
    Html.div
        []
        [ Html.h1 [] [ Html.text (" Maxime la pute" ) ]
     --  , renderCell "test" "3" "3" Empty
   --   , button [ onClick (renderStone2 "green") ] [ Html.text "Passer au joueur 1" ]
       , renderCell "1" "3" "3" Empty
    --  ,div [] [ Html.text (toString model.gamerOne) ]
    --  ,div [] [ Html.text (toString model.gamerTwo) ]
        ]

-----------------

--viewBoard : Model -> Html Message


renderStone : String -> List (Svg Msg)
renderStone color =
    [ Svg.circle [ SvgAttr.r "4.5", SvgAttr.fill color ] [] ]



--renderStone2 : String -> List (Svg msg)
--renderStone2 color =
    --rect [ id "17", fill color, x "20", y "102", width "40px", height "40px"]
 --     rect []
------------------




type Cell
   = Empty
   | OccupiedBlack
   | OccupiedWhite

type Board
   = Board (Array (Array Cell))


type Msg = ChangeToGamerOne | ChangeToGamerTwo


update msg model =
  case msg of

    ChangeToGamerTwo ->
      {model| gamerOne =False,
              gamerTwo =  True
              }
    ChangeToGamerOne ->
      {model| gamerOne =True,
              gamerTwo =  False
              }




whiteColor : String
whiteColor =
    "#efefef"


blackColor : String
blackColor =
    "#020202"


highlightColor : String
highlightColor =
    "#77c777"


holeColor : String
holeColor =
    "#77a777"


--$( "svg" ).style.width = "900px";
--$( "svg" ).style.height = "900px";
----------------





renderCell : String -> String -> String ->Cell -> Html Msg
renderCell idCell ax by cell =
    svg
        [ version "1.1", x "0", y "0"
           ]
        (case cell of
                Empty ->
                    [ Svg.rect [ id "1", fill holeColor, x "20", y "20", width "40px", height "40px",Events.onClick (renderStone blackColor ) ] []
                    , Svg.rect [ id "2", fill holeColor, x "61", y "20", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "3", fill holeColor, x "102", y "20", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "4", fill holeColor, x "143", y "20", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "5", fill holeColor, x "184", y "20", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "6", fill holeColor, x "225", y "20", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "7", fill holeColor, x "266", y "20", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "8", fill holeColor, x "307", y "20", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []

                    , Svg.rect [ id "9", fill holeColor, x "20", y "61", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "10", fill holeColor, x "61", y "61", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "11", fill holeColor, x "102", y "61", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "12", fill holeColor, x "143", y "61", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "13", fill holeColor, x "184", y "61", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "14", fill holeColor, x "225", y "61", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "15", fill holeColor, x "266", y "61", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "16", fill holeColor, x "307", y "61", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []


                    , Svg.rect [ id "17", fill holeColor, x "20", y "102", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "18", fill holeColor, x "61", y "102", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "19", fill holeColor, x "102", y "102", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "20", fill holeColor, x "143", y "102", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "21", fill holeColor, x "184", y "102", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "22", fill holeColor, x "225", y "102", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "23", fill holeColor, x "266", y "102", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "24", fill holeColor, x "307", y "102", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []


                    , Svg.rect [ id "25", fill holeColor, x "20", y "143", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "26", fill holeColor, x "61", y "143", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "27", fill holeColor, x "102", y "143", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "28", fill blackColor, x "143", y "143", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "29", fill whiteColor, x "184", y "143", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "30", fill holeColor, x "225", y "143", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "31", fill holeColor, x "266", y "143", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "32", fill holeColor, x "307", y "143", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []

                    , Svg.rect [ id "33", fill holeColor, x "20", y "184", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "34", fill holeColor, x "61", y "184", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "35", fill holeColor, x "102", y "184", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "36", fill whiteColor, x "143", y "184", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "37", fill blackColor, x "184", y "184", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "38", fill holeColor, x "225", y "184", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "39", fill holeColor, x "266", y "184", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "40", fill holeColor, x "307", y "184", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []

                    , Svg.rect [ id "41", fill holeColor, x "20", y "225", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "42", fill holeColor, x "61", y "225", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "43", fill holeColor, x "102", y "225", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "44", fill holeColor, x "143", y "225", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "45", fill holeColor, x "184", y "225", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "46", fill holeColor, x "225", y "225", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "47", fill holeColor, x "266", y "225", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "48", fill holeColor, x "307", y "225", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []


                    , Svg.rect [ id "49", fill holeColor, x "20", y "266", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "50", fill holeColor, x "61", y "266", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "51", fill holeColor, x "102", y "266", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "52", fill holeColor, x "143", y "266", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "53", fill holeColor, x "184", y "266", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "54", fill holeColor, x "225", y "266", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "55", fill holeColor, x "266", y "266", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "56", fill holeColor, x "307", y "266", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []

                    , Svg.rect [ id "57", fill holeColor, x "20", y "307", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "58", fill holeColor, x "61", y "307", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "59", fill holeColor, x "102", y "307", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "60", fill holeColor, x "143", y "307", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "61", fill holeColor, x "184", y "307", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "62", fill holeColor, x "225", y "307", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "63", fill holeColor, x "266", y "307", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    , Svg.rect [ id "64", fill holeColor, x "307", y "307", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    ]
                OccupiedBlack ->
                    [ Svg.rect [ id idCell, fill blackColor, x ax, y by, width "40px", height "40px",Events.onClick ChangeToGamerOne ] []]

                OccupiedWhite ->
                    renderStone (holeColor)
        )
