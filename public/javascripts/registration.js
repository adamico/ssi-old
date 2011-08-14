$(function() {
  if (!("autofocus" in document.createElement("input"))) {
    $("#registration_surname").focus();
  };

  $("#registration_formatted_arrival").datepicker({
    changeMonth: true,
    altFormat: 'yy-mm-dd',
    altField: '#registration_arrival'
  });
  $("#registration_formatted_departure").datepicker({
    changeMonth: true,
    altFormat: 'yy-mm-dd',
    altField: '#registration_departure'
  });
});
