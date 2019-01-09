module Main exposing (main)

import Browser
import Html


type Msg
    = ClickedSearch
    | SetDate String
    | EnteredSearchTerm String


type alias Model =
    { searchTerm : String
    }


initModel : Model
initModel =
    { searchTerm = ""
    }


main : Program () Model Msg
main =
    Browser.element
        { init = always ( initModel, Cmd.none )
        , view = view
        , update = update
        , subscriptions = always Sub.none
        }


view : Model -> Html.Html Msg
view model =
    Html.text "Hello World"


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ClickedSearch ->
            ( model, Cmd.none )
        _ ->
            ( model, Cmd.none )
