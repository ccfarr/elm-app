module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode exposing (..)


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


init : ( Model, Cmd Msg )
init =
    ( initModel, refreshVotes )



-- Elm record type that mirrors JSON object


type alias Response =
    { id : Int
    , option_name : String
    , number_of_votes : Int
    }



-- Decoders


responseDecoder : Decoder Response
responseDecoder =
    map3 Response
        (field "id" int)
        (field "option_name" string)
        (field "number_of_votes" int)


responseListDecoder : Decoder (List Response)
responseListDecoder =
    Json.Decode.list responseDecoder


refreshVotes : Cmd Msg
refreshVotes =
    let
        url =
            "http://localhost:8888/json"

        request =
            -- Http.getString url
            Http.get url responseListDecoder

        cmd =
            Http.send VotesMsg request
    in
    cmd



-- UPDATE


type Msg
    = Select Selection
    | Vote
    | VotesMsg (Result Http.Error (List Response))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Select newSelection ->
            ( { model
                | selection = newSelection
              }
            , Cmd.none
            )

        Vote ->
            case model.selection of
                Sandwiches ->
                    ( { model
                        | sandwichVotes = model.sandwichVotes + 1
                      }
                    , Cmd.none
                    )

                Tacos ->
                    ( { model
                        | tacoVotes = model.tacoVotes + 1
                      }
                    , Cmd.none
                    )

        VotesMsg (Ok val) ->
            ( { model
                | sandwichVotes = tmp val "sandwiches"
                , tacoVotes = tmp val "tacos"
              }
            , Cmd.none
            )

        VotesMsg (Err err) ->
            ( { model
                | sandwichVotes = 0
                , tacoVotes = 0
              }
            , Cmd.none
            )


maybeToInt : Maybe Int -> Int
maybeToInt x =
    case x of
        Nothing ->
            0

        Just val ->
            val


tmp : List Response -> String -> Int
tmp x y =
    x
        |> List.filter (\n -> n.option_name == y)
        |> List.map .number_of_votes
        |> List.head
        |> maybeToInt



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



-- subscription


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
