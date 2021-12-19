<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ page import = "java.util.Map" %>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />	

<%
	Map dataMap = (Map) request.getAttribute("dataMap");
	String twenty = String.valueOf(dataMap.get("20대"));
	String twentyResult = twenty.substring(1,2);
	
	String thirty = String.valueOf(dataMap.get("30대"));
	String thirtyResult = thirty.substring(1,2);
	
	String forty = String.valueOf(dataMap.get("40대"));
	String fortyResult = forty.substring(1,2);
	
	String fifty = String.valueOf(dataMap.get("50대"));
	String fiftyResult = fifty.substring(1,2);
	
 %>
<!DOCTYPE html>

<meta charset="utf-8">
<head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- <script src="https://code.jquery.com/jquery.min.js"></script> -->

  <script type="text/javascript">
  
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    
    function drawChart() {
      
   	  var h_twenty= parseInt(document.getElementById("twenty").value);
      var h_thirty= parseInt(document.getElementById("thirty").value);
   	  var h_forty= parseInt(document.getElementById("forty").value);
   	  var h_fifty= parseInt(document.getElementById("fifty").value);
   	 
    	
      var data = google.visualization.arrayToDataTable([
        ["Element", "밀도", { role: "style" } ],
        ["20대", h_twenty, "#b87333"],
        ["30대", h_thirty, "silver"],
        ["40대", h_forty, "gold"],
        ["50대", h_fifty, "color: #e5e4e2"]
      ]);

      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);

      var options = {
        title: "연령별 이용 회원자 수",
        width: 800,
        height: 400,
        bar: {groupWidth: "95%"},
        legend: { position: "none" },
      };
      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
      chart.draw(view, options);
  }
    
    var chartDrowFun = {
    		 
    	    chartDrow : function(){
    	        var chartData = '';
    	 
    	        //날짜형식 변경하고 싶으시면 이 부분 수정하세요.
    	        var chartDateformat     = 'yyyy년MM월dd일';
    	        //라인차트의 라인 수
    	        var chartLineCount    = 10;
    	        //컨트롤러 바 차트의 라인 수
    	        var controlLineCount    = 10;
    	 
    	 
    	        function drawDashboard() {
    	 
    	          var data = new google.visualization.DataTable();
    	          //그래프에 표시할 컬럼 추가
    	          data.addColumn('datetime' , '날짜');
    	          data.addColumn('number'   , '남성');
    	          data.addColumn('number'   , '여성');
    	          data.addColumn('number'   , '전체');
    	 
    	          //그래프에 표시할 데이터
    	          var dataRow = [];
    	 
    	          for(var i = 0; i <= 29; i++){ //랜덤 데이터 생성
    	            var total   = Math.floor(Math.random() * 300) + 1;
    	            var man     = Math.floor(Math.random() * total) + 1;
    	            var woman   = total - man;
    	 
    	            dataRow = [new Date('2020', '08', i , '24'), man, woman , total];
    	            data.addRow(dataRow);
    	          }
    	 
    	 
    	            var chart = new google.visualization.ChartWrapper({
    	              chartType   : 'LineChart',
    	              containerId : 'lineChartArea', //라인 차트 생성할 영역
    	              options     : {
    	                              isStacked   : 'percent',
    	                              focusTarget : 'category',
    	                              height          : 500,
    	                              width              : '100%',
    	                              legend          : { position: "top", textStyle: {fontSize: 13}},
    	                              pointSize        : 5,
    	                              tooltip          : {textStyle : {fontSize:12}, showColorCode : true,trigger: 'both'},
    	                              hAxis              : {format: chartDateformat, gridlines:{count:chartLineCount,units: {
    	                                                                  years : {format: ['yyyy년']},
    	                                                                  months: {format: ['MM월']},
    	                                                                  days  : {format: ['dd일']},
    	                                                                  hours : {format: ['HH시']}}
    	                                                                },textStyle: {fontSize:12}},
    	                vAxis              : {minValue: 100,viewWindow:{min:0},gridlines:{count:-1},textStyle:{fontSize:12}},
    	                animation        : {startup: true,duration: 1000,easing: 'in' },
    	                annotations    : {pattern: chartDateformat,
    	                                textStyle: {
    	                                fontSize: 15,
    	                                bold: true,
    	                                italic: true,
    	                                color: '#871b47',
    	                                auraColor: '#d799ae',
    	                                opacity: 0.8,
    	                                pattern: chartDateformat
    	                              }
    	                            }
    	              }
    	            });
    	 
    	            var control = new google.visualization.ControlWrapper({
    	              controlType: 'ChartRangeFilter',
    	              containerId: 'controlsArea',  //control bar를 생성할 영역
    	              options: {
    	                  ui:{
    	                        chartType: 'LineChart',
    	                        chartOptions: {
    	                        chartArea: {'width': '70%','height' : 80},
    	                          hAxis: {'baselineColor': 'none', format: chartDateformat, textStyle: {fontSize:12},
    	                            gridlines:{count:controlLineCount,units: {
    	                                  years : {format: ['yyyy년']},
    	                                  months: {format: ['MM월']},
    	                                  days  : {format: ['dd일']},
    	                                  hours : {format: ['HH시']}}
    	                            }}
    	                        }
    	                  },
    	                    filterColumnIndex: 0
    	                }
    	            });
    	 
    	            var date_formatter = new google.visualization.DateFormat({ pattern: chartDateformat});
    	            date_formatter.format(data, 0);
    	 
    	            var dashboard = new google.visualization.Dashboard(document.getElementById('Line_Controls_Chart'));
    	            window.addEventListener('resize', function() { dashboard.draw(data); }, false); //화면 크기에 따라 그래프 크기 변경
    	            dashboard.bind([control], [chart]);
    	            dashboard.draw(data);
    	 
    	        }
    	          google.charts.setOnLoadCallback(drawDashboard);
    	 
    	      }
    	    }
    	 
    	$(document).ready(function(){
    	  google.charts.load('current', {'packages':['line','controls']});
    	  chartDrowFun.chartDrow(); //chartDrow() 실행
    	  google.charts.load("current", {packages:['corechart']});
    	  google.charts.setOnLoadCallback(drawChart);
    	
    	});


  </script>

</head>

<body>
	<br>
	<h3>연령별 가입 회원자 수 그래프 </h3>
	<div id="columnchart_values" style="width: 900px; height: 300px;"></div>
	<br>
	<br>
	<br><br><br>
 	<h3>사이트 방문자 성별 현황 그래프</h3>
    <div id="Line_Controls_Chart">
      <!-- 라인 차트 생성할 영역 -->
          <div id="lineChartArea" style="padding:0px 20px 0px 0px;"></div>
      <!-- 컨트롤바를 생성할 영역 -->
          <div id="controlsArea" style="padding:0px 20px 0px 0px;"></div>
        </div>
      <br>  
  	<form id="testform">
	  <input type="hidden" id="twenty" name="twenty" value=<%= twentyResult%>>
	  <input type="hidden" id="thirty" name="thirty" value="<%= thirtyResult%>">
	  <input type="hidden" id="forty" name="forty" value="<%= fortyResult%>">
	  <input type="hidden" id="fifty" name="fifty" value="<%= fiftyResult%>">
     </form>


</body>
