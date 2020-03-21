module MenuSvg exposing (..)

import Svg exposing (node, svg, text)
import Svg.Attributes exposing (..)


view =
    Svg.svg [ class "fill-current text-white-900", height "20", viewBox "0 0 20 20", width "20" ]
        [ Svg.node "title" [] [ Svg.text "menu" ]
        , Svg.path [ d "M0 3h20v2H0V3zm0 6h20v2H0V9zm0 6h20v2H0v-2z" ] []
        ]
