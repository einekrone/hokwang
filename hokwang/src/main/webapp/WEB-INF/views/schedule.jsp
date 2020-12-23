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

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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

<!-- modal -->
<div id="dialog-form" title="일정">
  <p class="validateTips">일정을 등록하세요</p>
 
  <form>
    <fieldset>
      <label>일정?</label>
      <input type="text" name="name" id="name" class="text ui-widget-content ui-corner-all"><br>
      <label>휴가일자</label><br>
      <input type="date" name="work_stdate">&nbsp;~&nbsp;<input type="date" name="work_endate">
      <br>
      <label>사유</label><br>
      <textarea id="work_cause" name="work_cause" cols="35" rows="5"></textarea>
 
      <!-- Allow form submission with keyboard without duplicating the dialog button -->
      <input type="submit" tabindex="-1" style="position:absolute; top:-1000px"><br>
      <button>저장</button>
      <button>취소</button>
    </fieldset>
  </form>
</div>
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
            right: 'dayGridMonth,timeGridWeek,timeGridDay',
            initialView:'dayGridMonth',
           
            
            
          },
          editable: true,
          selectable: true
          
         

        });

        calendar.render();
        
        
        
        
     

    
    


</script>
<script>
$(function(){
	var dialog, form,
	dialog = $( "#dialog-form" ).dialog({
	      autoOpen: false,
	      height: 400,
	      width: 350,
	      modal: true,

	        Cancel: function() {
	          dialog.dialog( "close" );
	        },
	      
	      close: function() {
	        //form[ 0 ].reset();
	        //allFields.removeClass( "ui-state-error" );
	      }
	    });
	
	$('td').on('click',function(){
		dialog.dialog("open");
	});
	
})
</script>
</body>
</html>
