$('.pagination > a').attr('data-remote', 'true');


$('#select').on('change', function() {
  
  var selection = $(this).val();

  $.ajax({
   type: "GET",
   url: "/order_requests",
   data : { selection: selection }
 });

});

$('#LatiField').hide();
$('#LongiField').hide();

function getLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition);
  }
}

function showPosition(position) {
  var lat = position.coords.latitude;
  var longi = position.coords.longitude;
  $('#LatiField').show();
  $('#LongiField').show();
  $("#order_request_latitude").val(lat);
  $("#order_request_longitude").val(longi);

}
