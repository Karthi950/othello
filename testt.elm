
import Html.Events exposing (onClick)
import Html exposing(..)
import Html.Attributes as Attr
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Array exposing (Array)
import Array as Array
import Svg.Attributes as SvgAttr




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
        [ Html.h1 [] [ Html.text (" coucou toi " ) ]
       , renderCell "2" "3" Empty
        ]

-----------------


renderCell : String -> String ->Cell -> Html Msg
renderCell ax by cell =
    svg
        [ SvgAttr.width "40"
        , SvgAttr.height "40"
        , SvgAttr.viewBox "-5 -5 10 10"
        ]
        (Svg.rect [ SvgAttr.x ax, SvgAttr.y by, SvgAttr.width "10", SvgAttr.height "10", SvgAttr.fill "green" ] []
            :: case cell of
                Empty ->
                    [ Svg.circle
                        [ Attr.style
                            [ ( "cursor"  , "default"
                         --     , if highlighted then
                         ---           "pointer"
                         --       else
                          --            "default"
                              )
                            ]
               --         , Events.onMouseEnter (Hoover (Just coord))
               --         , Events.onMouseLeave (Hoover Nothing)
                --        , Events.onClick (ClickAt coord)
                        , SvgAttr.r "4.5"
                        , SvgAttr.fill "#D2691E"
                  --          (if hooverOver then
                  --              stoneColor player
                  --           else if highlighted then
                  --              highlightColor
                  --           else
                  --              holeColor
                  --          )
                        ]
                        []
                    ]

                Occupied stone ->
                    renderStone (Just stone)
        )



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





------------------




type Cell
   = Empty
   | Occupied Stone

type Board
   = Board (Array (Array Cell))

type Stone
   = Black
   | White

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

renderStone : Maybe Stone -> List (Svg Msg)
renderStone stone =
    [ Svg.circle [ SvgAttr.r "4.5", SvgAttr.fill (stoneColor stone) ] [] ]


stoneColor : Maybe Stone -> String
stoneColor stone =
    case stone of
        Just White ->
            whiteColor

        Just Black ->
            blackColor

        Nothing ->
            holeColor


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

