$(document).ready(function () {
    //網頁載入點擊一下今天button
    $("a.colincalendara").live('click', function () {
        $('#calendar').fullCalendar("today");
    });
    if (location.search.includes("calendar")) {
        $("a.colincalendara").click();
    }
    //大的專屬行事曆
    $('#calendar').fullCalendar({
        defaultDate: new Date(),
        events: "ProcessCalendarEvents.ashx",
        eventClick: function (event, jsEvent, view) {
            $.pgwModal({
                title: "預約內容",
                url: 'ProcessCalendarEventsContent.ashx?id=' + event.id,
                ajaxOptions : {
                success : function(data) {
                    if (data) {
                        $.pgwModal({ pushContent: data });
                    } else {
                        $.pgwModal({ pushContent: 'An error has occured' });
                    }
                }
            }
        });     
        },
        eventRender: function (event, element) {
            element.html(event.title);
        }
    });

    
    
    
});