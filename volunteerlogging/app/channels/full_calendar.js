var initialize_calendar;
var vol
$.ajax({
    url: "/signed_in",
    type: "get",
    dataType: "json",
    success: function(data) {
        vol = data;
    }

});

initialize_calendar = function() {
    $('#calendar').fullCalendar({

        events: '/events.json',


        eventClick: function(event, jsEvent, view) {

            $.ajax({
                url: 'event/showEvent',
                dataType: "json",
                type: "GET",
                data: { id: event.id },
                success: function(data) {
                    $("#content").html("");

                    var a = "";
                    var count = 1;
                    var signup = true;

                    data[0].forEach(function(num) {
                        a = "<div id='slot" + count + "' class='col-5'>  <h3>Slot " + count + "</h3><br>";

                        var start = (num.start.substr(11, 2) % 12 == 0 ? 12 : num.start.substr(11, 2) % 12) + ":" + num.start.substr(14, 2) + (num.start.substr(11, 2) < 12 ? 'am' : 'pm');

                        var end = (num.end.substr(11, 2) % 12 == 0 ? 12 : num.end.substr(11, 2) % 12) + ":" + num.end.substr(14, 2) + (num.end.substr(11, 2) < 12 ? 'am' : 'pm');

                        a += "<p>" + start + " - " + end + "</p>";

                        data[num.id].forEach(function(person) {
                            a += "<label>" + person.firstName + " " + person.lastName + "</label>";
                            if (vol.id == person.id) {
                                a += "<button id='leave' value='" + num.id + "' class='btn col-3 hover'>Leave Slot</button>";
                            }
                            a += "<br>";
                        });
                        a += "<button  id='signup'  " + num.id + "' class='btn col-3 hover'>Sign Up</button><br>";

                        a += "</div>";
                        $("#content").append(a);
                        count++;
                    });


                    $('#modal').show();

                },
                error: function() {
                    alert("didnt work");
                }
            });
            return false;
        },
        dayClick: function(date, jsEvent, view) {
            $.getScript('/create_event', function() {});
        }
    });


}
$(document).on('turbolinks:load', initialize_calendar);

$(document).on('click', 'button', function(event) {
    var hour = { section_id: event.target.value, volunteer_id: vol.id };

    if (event.target.id == 'signup') {
        $.ajax({
            url: 'sign_up',
            dataType: "json",
            type: 'POST',
            data: { hour },
            success: function(data) {


            },
            error: function() {
                alert("Sign up failed");
            }

        });
    } else if (event.target.id == 'leave') {

        var hour = { volunteer_id: vol.id, section_id: event.target.value }
        $.ajax({
            url: 'leave',
            dataType: "json",
            type: 'POST',
            data: { hour },
            success: function(data) {
                alert("Successfully left the slot");
            },
            error: function() {
                alert("faiiled");
            }
        });
    }
});
$('span').click(function() {
    $('#modal').hide();

});