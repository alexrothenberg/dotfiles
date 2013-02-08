// swap github logo with trollface
// $('input[title=Search]')
//   .val('Zach Rothenberg')
  
$('input[name=btnI]')
  .val('Bing Search')
  .click(function(){
    $('form').attr('action', 'http://www.bing.com/search')
  })