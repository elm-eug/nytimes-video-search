# nytimes-video-search

Each step of the tutorial is tagged.

### `step1`

Run `elm init` to create a new project. I would strongly encourage you to read the [Official Guide](https://guide.elm-lang.org/). Create a `Main.elm`.

First we declare a new module named `Main` that will expose a single function `main` and we import a few other modules for `Main` to use:

```elm
module Main exposing (main)

import Browser
import Html
```

Next we add a custom type `Msg` that describes all of the possible messages our app will respond to. `ChangedSearchTerm String` means "Hey, a user entered the search term, here it is."

```elm
type Msg
    = ClickedSearch
    | SetDate String
    | EnteredSearchTerm String
```

Next we begin modeling the application state. We create an alias `Model` to a record with a single field `searchTerm` which must be a string. Then we describe what the initial data actually is in the `initModel` value.

```elm
type alias Model =
    { searchTerm : String
    }


initModel : Model
initModel =
    { searchTerm = "Hello World"
    }
```

Now that we've described the messages and data model of our application we describe how they interact. First we create a `Browser.element` that takes a record with fields set to 4 important functions and returns a type `Program () Model Msg`. (These type annatations are optional but useful. If you have a function named `length` it can be made more understandable with an annotation `length : String -> Int` indicating it returns the number of characters in a string.)

```elm
main : Program () Model Msg
main =
    Browser.element
        { init = always ( initModel, Cmd.none )
        , view = view
        , update = update
        , subscriptions = always Sub.none
        }
```

[`always`](https://package.elm-lang.org/packages/elm/core/latest/Basics#always) is a function that is imported by default along with other functions and types from [`elm/core`](https://package.elm-lang.org/packages/elm/core/latest/). We won't cover [flags](https://guide.elm-lang.org/interop/flags.html)) or [subscriptions](https://guide.elm-lang.org/effects/) in this tutorial.

Finally we have the meat of our application. The all important functions `view` and `update`; Both of which interact with the Elm Runtime in what we call "The Elm Architecture". Below we have the function `view` which transforms a Model into Html that can emit messages. In this case our view is text from our internal data model. Then we have the `update` function which transforms a `Msg` and a `Model` into a new `Model` with zero or more commands to run (For things like Http or getting random numbers). It returns a tuple `(Model, Cmd Msg)` and for the case it gets the `ClickedSearch` message it returns a new model with searchTerm set to "testing 1 2 3" and zero commands. It does nothing for all other cases (`_` is a wild card that fell over).


```elm
view : Model -> Html.Html Msg
view model =
    Html.text model.searchTerm


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ClickedSearch ->
            ( { model | searchTerm = "testing 1 2 3" }, Cmd.none )
        _ ->
            ( model, Cmd.none )
```

Like words _and_ pictures? Then you'll like gifs!

![The Elm Architecture Animated](tea.gif)

For a high level overview of this, read [The Elm Architecture](https://guide.elm-lang.org/architecture/) part of the guide. 

Run `elm reactor` to view your creation.