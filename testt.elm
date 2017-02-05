
import Color exposing (..)
import Color exposing (..)
import Element exposing (..)
import Collage exposing (..)
import Html.Events exposing (onClick)
import Html exposing(..)

main =
  Html.beginnerProgram {
      model = model,
      update = update,
      view = view
      }

-- model --
type alias Model =  {
    board : Board,
    gamerOne : Bool,
    gamerTwo : Bool }


model : Model
model = Model board2 True False


view : Model -> Html Msg
view model =
    div []
        [ button [onClick ChangeToGamerTwo] [Html.text "Passer au Joueur 2"],
          button [onClick ChangeToGamerOne] [Html.text "Passer au joueur 1"],
          div [] [ Html.text (toString model.gamerOne) ],
          div [] [ Html.text (toString model.gamerTwo) ],
          generateBoard board]


type alias Square = {x : Float, y : Float, size : Float, aColor : Color }
type alias Board = List Square

generateBoard : Board -> Html.Html msg
generateBoard param =
    let
       collageSize = 800

       makeSquare : Color -> Float -> Float -> Float -> Form
       makeSquare color x y size =
         let
           padding = 1
           realSize = size

           toRealPosition : Float -> Float
           toRealPosition x =
                (x * (realSize + padding))
         in
           (move (toRealPosition x, toRealPosition y) (filled color (square size)))

       generateForms : List Square -> List Form
       generateForms board =
            case board of
                []         -> []
                head::tail -> (makeSquare head.aColor head.x head.y head.size) :: (generateForms tail)

       generateElement : List Form -> Element
       generateElement forms =
            collage collageSize collageSize forms

    in
        toHtml (generateElement (generateForms param))



type Msg = ChangeToGamerOne | ChangeToGamerTwo


update msg model =
  case msg of
    ChangeToGamerTwo ->
      {model| gamerOne =False, gamerTwo=True
              }
    ChangeToGamerOne ->
       {model| gamerOne =True, gamerTwo=False
              }


board2 : Board
board2 = [
        {x = 0, y = 1, size = 40, aColor = black}
        ]

board : Board
board = [
        {x = 0, y = 1, size = 40, aColor = brown},
        {x = 1, y = 1, size = 40, aColor = green},
        {x = 2, y = 1, size = 40, aColor = brown},
        {x = 3, y = 1, size = 40, aColor = green},
        {x = 4, y = 1, size = 40, aColor = brown},
        {x = 5, y = 1, size = 40, aColor = green},
        {x = 6, y = 1, size = 40, aColor = brown},
        {x = 7, y = 1, size = 40, aColor = green},

        {x = 0, y = 2, size = 40, aColor = green},
        {x = 1, y = 2, size = 40, aColor = brown},
        {x = 2, y = 2, size = 40, aColor = green},
        {x = 3, y = 2, size = 40, aColor = brown},
        {x = 4, y = 2, size = 40, aColor = green},
        {x = 5, y = 2, size = 40, aColor = brown},
        {x = 6, y = 2, size = 40, aColor = green},
        {x = 7, y = 2, size = 40, aColor = brown},

        {x = 0, y = 3, size = 40, aColor = brown},
        {x = 1, y = 3, size = 40, aColor = green},
        {x = 2, y = 3, size = 40, aColor = brown},
        {x = 3, y = 3, size = 40, aColor = green},
        {x = 4, y = 3, size = 40, aColor = brown},
        {x = 5, y = 3, size = 40, aColor = green},
        {x = 6, y = 3, size = 40, aColor = brown},
        {x = 7, y = 3, size = 40, aColor = green},


        {x = 0, y = 4, size = 40, aColor = green},
        {x = 1, y = 4, size = 40, aColor = brown},
        {x = 2, y = 4, size = 40, aColor = green},
        {x = 3, y = 4, size = 40, aColor = brown},
        {x = 4, y = 4, size = 40, aColor = green},
        {x = 5, y = 4, size = 40, aColor = brown},
        {x = 6, y = 4, size = 40, aColor = green},
        {x = 7, y = 4, size = 40, aColor = brown},

        {x = 0, y = 5, size = 40, aColor = brown},
        {x = 1, y = 5, size = 40, aColor = green},
        {x = 2, y = 5, size = 40, aColor = brown},
        {x = 3, y = 5, size = 40, aColor = green},
        {x = 4, y = 5, size = 40, aColor = brown},
        {x = 5, y = 5, size = 40, aColor = green},
        {x = 6, y = 5, size = 40, aColor = brown},
        {x = 7, y = 5, size = 40, aColor = green},


        {x = 0, y = 6, size = 40, aColor = green},
        {x = 1, y = 6, size = 40, aColor = brown},
        {x = 2, y = 6, size = 40, aColor = green},
        {x = 3, y = 6, size = 40, aColor = brown},
        {x = 4, y = 6, size = 40, aColor = green},
        {x = 5, y = 6, size = 40, aColor = brown},
        {x = 6, y = 6, size = 40, aColor = green},
        {x = 7, y = 6, size = 40, aColor = brown},

        {x = 0, y = 7, size = 40, aColor = brown},
        {x = 1, y = 7, size = 40, aColor = green},
        {x = 2, y = 7, size = 40, aColor = brown},
        {x = 3, y = 7, size = 40, aColor = green},
        {x = 4, y = 7, size = 40, aColor = brown},
        {x = 5, y = 7, size = 40, aColor = green},
        {x = 6, y = 7, size = 40, aColor = brown},
        {x = 7, y = 7, size = 40, aColor = green},


        {x = 0, y = 8, size = 40, aColor = green},
        {x = 1, y = 8, size = 40, aColor = brown},
        {x = 2, y = 8, size = 40, aColor = green},
        {x = 3, y = 8, size = 40, aColor = brown},
        {x = 4, y = 8, size = 40, aColor = green},
        {x = 5, y = 8, size = 40, aColor = brown},
        {x = 6, y = 8, size = 40, aColor = green},
        {x = 7, y = 8, size = 40, aColor = brown}


        ]



