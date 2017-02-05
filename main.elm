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
  --     , renderCell "3" "3" Empty
    --   , renderCell "3" "3" OccupiedWhite
    --  ,div [] [ Html.text (toString model.gamerOne) ]
    --  ,div [] [ Html.text (toString model.gamerTwo) ]
        ]

-----------------


renderCell : String -> String ->Cell -> Html Msg
renderCell ax by cell =
    svg
        [ version "1.1", x "0", y "0"
           ]
        (case cell of
                Empty ->
                    [Svg.rect [ fill holeColor, x "20", y "20", width "40px", height "40px",Events.onClick ChangeToGamerOne ] []
                    ]
                OccupiedBlack ->
                    [Svg.rect [ fill blackColor, x ax, y by, width "40px", height "40px" ] []]

                OccupiedWhite ->
                    renderStone (holeColor)
        )




renderStone : String -> List (Svg Msg)
renderStone color =
    [ Svg.circle [ SvgAttr.r "4.5", SvgAttr.fill color ] [] ]



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

