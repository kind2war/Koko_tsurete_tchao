//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require jquery
//= require bootstrap-sprockets
import Raty from "raty.js"
window.raty = function(elem,opt) {
  let raty =  new Raty(elem,opt)
  raty.init();
  return raty;
}