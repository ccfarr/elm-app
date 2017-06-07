module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- MODEL


type Selection
    = Sandwiches
    | Tacos


type alias Model =
    { selection : Selection
    , sandwichVotes : Int
    , tacoVotes : Int
    }


initModel : Model
initModel =
    -- Model Sandwiches 0 0
    { selection = Sandwiches
    , sandwichVotes = 0
    , tacoVotes = 0
    }



-- UPDATE


type Msg
    = Select Selection
    | Vote


update : Msg -> Model -> Model
update msg model =
    case msg of
        Select newSelection ->
            { model
                | selection = newSelection
            }

        Vote ->
            case model.selection of
                Sandwiches ->
                    { model
                        | sandwichVotes = model.sandwichVotes + 1
                    }

                Tacos ->
                    { model
                        | tacoVotes = model.tacoVotes + 1
                    }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ p []
            [ text "Vote now!" ]
        , fieldset
            []
            [ label []
                [ input
                    [ type_ "radio"
                    , name "vote-choice"
                    , onClick (Select Sandwiches)
                    ]
                    []
                , text "Sandwiches"
                ]
            , label []
                [ input
                    [ type_ "radio"
                    , name "vote-choice"
                    , onClick (Select Tacos)
                    ]
                    []
                , text "Tacos"
                ]
            ]
        , button
            [ type_ "button"
            , onClick Vote
            ]
            [ text "Submit" ]
        , ul []
            [ li []
                [ text ("Sandwiches: " ++ toString model.sandwichVotes)
                ]
            , li []
                [ text ("Tacos: " ++ toString model.tacoVotes)
                ]
            ]
        , p [] [ text (toString model) ]
        ]


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = initModel
        , view = view
        , update = update
        }
