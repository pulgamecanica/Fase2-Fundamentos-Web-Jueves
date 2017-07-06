$(document).ready(function() {
  $('h1').bind("click", function(){
    alert("The slot machine was clicked.");
});
  // $('.all').on("submit", function(event){
  //   event.preventDefault();
  //   $.post('/rolls', function( data ) {
  //   console.log( data );
  //   $( ".all" ).html( data );
  //   });

 $('#slot-machine').on("submit", function(event){
   event.preventDefault();
  console.log( "Entramos" );
  $.post("/rolls", function( data ) { 
  console.log( data );
  $( "#die" ).html( data );
});
});
});
