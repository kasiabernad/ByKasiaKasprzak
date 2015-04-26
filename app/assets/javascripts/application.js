// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


function setAsSelectedColor() {
  var td = event.target
  var rgb = td.style.backgroundColor.match(/\d+/g);

  var hex = String('0' + Number(rgb[0]).toString(16)).slice(-2) + String('0' + Number(rgb[1]).toString(16)).slice(-2) + String('0' + Number(rgb[2]).toString(16)).slice(-2);
  $.ajax('/creator/bracelets/pallete.js?current_color=' + hex);
}

function fillRow (row_idx, bracelet_id) {
  var rgb = $('#current-color').css('background-color').match(/\d+/g);
  var hex = String('0' + Number(rgb[0]).toString(16)).slice(-2) + String('0' + Number(rgb[1]).toString(16)).slice(-2) + String('0' + Number(rgb[2]).toString(16)).slice(-2);

  var endpoint = '/creator/bracelets/changerow.js?current_color=' + hex + '&row_idx=' + row_idx + '&id=' + bracelet_id;

  $.ajax(endpoint);

}

function changeColor(position_id) {
  var rgb = $('#current-color').css('background-color').match(/\d+/g);
  var hex = String('0' + Number(rgb[0]).toString(16)).slice(-2) + String('0' + Number(rgb[1]).toString(16)).slice(-2) + String('0' + Number(rgb[2]).toString(16)).slice(-2);

  var endpoint = '/creator/bracelets/change.js?current_color=' + hex + '&position_id=' + position_id;

  $.ajax(endpoint);

  event.target.style.backgroundColor = '#' + hex
}

var hexDigits = new Array("0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"); 

//Function to convert hex format to a rgb color
function rgb2hex(rgb) {
 rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
 return "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]);
}

function hex(x) {
  return isNaN(x) ? "00" : hexDigits[(x - x % 16) / 16] + hexDigits[x % 16];
 }
function PrintDiv(name, file) { 
 var divToPrint = document.getElementById(name);
 var popupWin = window.open('', '_blank', 'width=600,height=600');
 popupWin.document.open();
 popupWin.document.title = file
 popupWin.document.write('<html><style>td {border: 1px solid;width:10px;height:10px}  .hidden-on-print {visibility: hidden;display: none;}</style><body>' + divToPrint.innerHTML + '</body></html>');
 popupWin.document.close();
}