import hljs from "highlight.js/lib/highlight";
import "highlight.js/styles/github.css";
import elm from 'highlight.js/lib/languages/elm';
import './src/tailwind-compiled.css';

// we're just importing the syntaxes we want from hljs
// in order to reduce our JS bundle size
// see https://bjacobel.com/2016/12/04/highlight-bundle-size/
hljs.registerLanguage('elm', elm);


import "./style.css";
// @ts-ignore
window.hljs = hljs;
const { Elm } = require("./src/Main.elm");
const pagesInit = require("elm-pages");

pagesInit({
  mainElmModule: Elm.Main
});

window.addEventListener('load', function() { 
  loadCss('https://use.fontawesome.com/releases/v5.12.1/css/all.css');
});

function loadCss(url) {
  var head = document.getElementsByTagName('HEAD')[0];  
  var link = document.createElement('link'); 
  link.rel = 'stylesheet';  
  link.type = 'text/css'; 
  link.href = url;
  head.appendChild(link);  
}