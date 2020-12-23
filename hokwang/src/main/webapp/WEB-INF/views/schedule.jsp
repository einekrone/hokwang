<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href='${pageContext.request.contextPath}/resources/packages/core/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/resources/packages/daygrid/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/resources/packages/timegrid/main.min.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/packages/core/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/packages/daygrid/main.js'></script>
<script src="${pageContext.request.contextPath}/resources/packages/interaction/main.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/packages/timegrid/main.min.js"></script></head>
<script src='${pageContext.request.contextPath}/resources/packages/core/locales/ko.js'></script>

<style>
html, body {
  margin: 0;
  padding: 0;
  font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
  font-size: 14px;
}
#external-events {
  position: fixed;
  z-index: 2;
  top: 120px;
  left: 20px;
  width: 150px;
  padding: 0 10px;
  border: 1px solid #ccc;
  background: #eee;
}
.demo-topbar + #external-events { /* will get stripped out */
  top: 60px;
}
#external-events .fc-event {
  margin: 1em 0;
  cursor: move;
}
#calendar-container {
  position: relative;
  z-index: 1;
  margin-left: 200px;
}
#calendar {
  max-width: 900px;
  margin: 20px auto;
}

</style>

</head>
<body>

<div id="external-events">
    <p>
      <strong>사유</strong>
    </p>
    <div class="fc-event">병가</div>
    <div class="fc-event">휴가</div>
    <div class="fc-event">근무</div>
  </div>
 
<div id='calendar'></div>


 <script>
	//달력 조회
   
        var Calendar = FullCalendar.Calendar;
        var Draggable = FullCalendarInteraction.Draggable;
     
        var containerEl = document.getElementById('external-events');
        var calendarEl = document.getElementById('calendar');
       
     
     	//드래그
        new Draggable(containerEl, {
          itemSelector: '.fc-event',
          eventData: function(eventEl) {
            return {
              title: eventEl.innerText
            };
          }
        });
     	
        
     	
        var calendar = new Calendar(calendarEl, {
          plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
          header: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
          },
          editable: true
          
        });

        calendar.render();
        
        
        $('td').click(function() {
        	   
           

      });

    
    


</script>
</body>
</html>
