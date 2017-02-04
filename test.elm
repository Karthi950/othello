import Html exposing (beginnerProgram, div, button, text)
import Html.Events exposing (onClick)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Array exposing (Array)
import Array as Array


main =
  beginnerProgram { model = model, view = view, update = update }



type alias Model = {
    winner : String,
    point : Int,
    gamerOne : Bool,
    gamerTwo : Bool
}

model : Model
model = Model "" 0 True False

view model =
  div []
    [ button [ onClick ChangeToGamerTwo ] [ Html.text "Passer au Joueur 2" ],
     button [ onClick (Change "toto") ] [ Html.text (model.winner) ]
    , button [ onClick Increment ] [ Html.text "+" ],
    button [ onClick ChangeToGamerOne ] [ Html.text "Passer au joueur 1" ],
    div [] [ Html.text (toString model.gamerOne) ],
    div [] [ Html.text (toString model.gamerTwo) ]
    ]
  



helloWord : Model -> String -> String
helloWord x y = 
    String.append x.winner y
    



type Msg = Increment | Decrement | Change String | ChangeToGamerOne | ChangeToGamerTwo


update msg model =
  case msg of
    Increment ->
      {model| winner =" +1",
              point = model.point +2
              }

    Decrement ->
      {model| winner =" -1",
              gamerOne =  True
              }
              
    Change txt ->
      {model| winner = helloWord model txt}
      
    ChangeToGamerTwo ->
      {model| gamerOne =False,
              gamerTwo =  True
              }
    ChangeToGamerOne ->
      {model| gamerOne =True,
              gamerTwo =  False
              }          
              