module Layout exposing (view)

import FontAwesome as Fa
import Html exposing (..)
import Html.Attributes as Attr exposing (class)
import Html.Events
import MenuSvg
import Pages exposing (pages)
import Pages.PagePath as PagePath


view : { model | menuOpen : Bool } -> msg -> List (Html msg) -> Html msg
view model toggleMenuMsg main =
    Html.div [ Attr.id "body", class "font-body bg-gray-100 min-h-screen flex flex-col" ]
        [ Html.nav
            [ Attr.class "flex font-display items-center justify-between flex-wrap bg-gray-900 p-6"
            ]
            [ div [ class "flex items-center flex-shrink-0 text-white mr-6" ]
                [ span [ class "font-semibold text-xl tracking-tight" ] [ text "elm-pages Tailwind Starter" ]
                ]
            , div [ class "block lg:hidden" ]
                [ button
                    [ Html.Events.onClick toggleMenuMsg, class "flex items-center px-3 py-2 border rounded text-white border-gray-400 hover:text-white hover:border-white" ]
                    [ MenuSvg.view ]
                ]
            , div [ Attr.classList [ ( "hidden", not model.menuOpen ) ], class "w-full block lg:flex lg:items-center lg:w-auto text-lg" ]
                [ a [ class "block mt-4 lg:inline-block lg:mt-0 text-white hover:text-white mr-4", Attr.href "#responsive-header" ]
                    [ text "About" ]
                , a [ class "block mt-4 lg:inline-block lg:mt-0 text-white hover:text-white mr-4", Attr.href "#responsive-header" ]
                    [ text "Blog" ]
                , button
                    [ class "block mt-4 lg:mt-0 bg-white lg:inline-block hover:bg-gray-200 text-gray-800 font-semibold py-2 px-4 border border-gray-400 rounded shadow-lg font-display"
                    , Attr.href "#"
                    ]
                    [ text "Start Now" ]
                ]
            ]

        -- , div [ class "md:flex flex-grow" ] main
        , div [ class "flex-grow" ] main
        , Html.footer
            [ Attr.class "flex font-display justify-center flex-wrap bg-gray-900 p-6"
            ]
            [ icons ]
        ]


icons =
    Html.div
        [--     Element.centerX
         -- , Element.spacing 12
         -- , Font.size 30
        ]
        [ iconLink
            { icon = Fa.twitterSquare
            , alt = "Twitter"
            , url = "https://twitter.com/elm_pages/"
            }
        , iconLink
            { icon = Fa.youTubeSquare
            , alt = "YouTube"
            , url = "https://www.youtube.com/user/dillonkearns"
            }
        , iconLink
            { icon = Fa.slack
            , alt = "Slack"
            , url = "slack://channel?id=CNSNETV37&team=T0CJ5UNHK"
            }
        ]


iconLink : { icon : Fa.Icon, alt : String, url : String } -> Html msg
iconLink { icon, alt, url } =
    a
        [ Attr.href url
        , class "text-gray-100 hover:text-gray-400 mr-4 text-2xl"
        , Attr.attribute "aria-label" alt
        , Attr.rel "noopener"
        ]
        [ Fa.icon icon ]
