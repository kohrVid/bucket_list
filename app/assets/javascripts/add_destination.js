$(document).ready(function(){
  $("#add-destination-button").click(function(event){
    event.preventDefault();
    var formData = $(event.currentTarget).closest("form").serialize();
    $.ajax({
      type: "POST",
      url: "/destinations",
      data: formData,
      success: function(destinationHtml){
	$("ul").append(destinationHtml);	
      }
    });
  });
});
