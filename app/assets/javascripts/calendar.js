$(function () {
  function eventCalendar() {
    return $('#calendar').fullCalendar({});
  };
  function clearCalendar() {
    $('#calendar').html('');
  };
  $(document).on('turbolinks:load', function () {
    eventCalendar();
  });
  $(document).on('turbolinks:before-cache', clearCalendar);

  $('#calendar').fullCalendar({
    locale: 'ja',
    timeZone: 'Asia/Tokyo',
    timeFormat: "HH:mm",
    events: '/events.json',
    height: 340,
  });
});