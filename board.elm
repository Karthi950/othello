import Html exposing (Html, button, div, text, beginnerProgram)
import Html.Events exposing (onClick)

import Svg exposing (svg, rect, line, circle, Svg)
import Svg.Attributes exposing (..)
import Html.Events as Events


main =
  beginnerProgram { model = Model [] , view = view, update = update }

type Msg = Increment | Decrement

type alias Model = { board: List Move }

type Board = List Move

type Move = Color Int Int

type Color = Black | White

update : Msg -> Model -> Model
update msg model = model

f : Int -> Int -> Svg Msg
f a b =  line [ x1 (toString <| (a+1)*40 ), y1 (toString <| (b+1)*40  ), x2 (toString <| (a+19)*40 ), y2 (toString <| (b+ 1)*40 ), stroke "black" , strokeWidth "2" ] []

g : Int -> Int -> Svg Msg
g a b =  line [ x1 (toString <| (a+1)*40 ), y1 (toString <| (b+1)*40  ), x2 (toString <| (a+ 1)*40 ), y2 (toString <| (b+19)*40 ), stroke "black" , strokeWidth "2" ] []

h: (Int, Int, String) -> Svg Msg
h (a, b, color) =  circle [ cx ( toString <| (a)*45 ) , cy (toString <| (b)*45) , r (toString 15),fill color ] []

m: Int -> Int -> Svg Msg
m a b = rect [fill "#77a777", x (toString <| (a+1)*40 ),y (toString <| (b+1)*40 ), width "40px", height "40px" ] []

--m: (Int, Int, String) -> Svg Msg
--model.board =List.map h [ (4,4,"#efefef"),(4,5,"#020202"),(5,4,"#efefef"),(5,5,"#020202") ]

recursion: Int -> Int -> List(Svg Msg)
recursion a b = if a==0 && b==0 then [(m a b)] else if a == 0 then [(m a b)] ++ (recursion 7 (b-1)) else [(m a b)] ++ (recursion (a-1) b)

view: Model -> Html Msg
view model =
  div []
    [ div []
      [ text "Othello"
      ]
    , div [] [ svg [ width "362", height "362" ] <|
       -- [ rect [ width "500", height "500", fill "#77a777"] []
      --  ] ++
       (recursion 7 7) ++
        ( List.map (\c -> f 0 c) <| List.range 0 8 ) ++
        ( List.map (\c -> g c 0) <| List.range 0 8 ) ++
        --( List.map (\c -> m 0 c) <| List.range 0 8 ) ++

    --    (List.map (\d -> List.map (\c -> m d c) <| List.range 0 8 ) <| List.range 0 8) ++
     --   ( List.map (\c -> g c 0) <| List.range 0 8 )++
       ( List.map h [ (4,4,"#efefef"),(4,5,"#020202"),(5,4,"#efefef"),(5,5,"#020202") ] )
      ]
   --, button [ onClick ( ) ] [ Html.text ("toto") ]
    ]