<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div style="background-color : rgb(101, 178, 255); padding : 0px 12px 12px 12px; color : #fff; margin-top: 12px; border-radius: 4px;">
								    <div class="display-flex">
								        <div class="weather_icon"></div>
								        <div class="current_temp" style="font-size : 36pt; padding-left: 36px;"></div>
								   
								        <div style="padding-left: 12px;">
								        	<div class="weather_description" style="font-size : 20pt;"></div>
								        	<div class="city" style="font-size : 13pt"></div>
								        </div>
								    </div>
								
								    <div class="display-flex" style="justify-content: space-between;">
							            <div class="temp_min"></div>
							            <div class="temp_max"></div>
								    </div>
								    <div class="display-flex" style="justify-content: space-between;">
							            <div class="humidity"></div>
							            <div class="wind"></div>
								    </div>
								</div>

</body>
<script type="text/javascript">

var weatherIcon = {
    '01' : 'fas fa-sun',
    '02' : 'fas fa-cloud-sun',
    '03' : 'fas fa-cloud',
    '04' : 'fas fa-cloud-meatball',
    '09' : 'fas fa-cloud-sun-rain',
    '10' : 'fas fa-cloud-showers-heavy',
    '11' : 'fas fa-poo-storm',
    '13' : 'far fa-snowflake',
    '50' : 'fas fa-smog'
};

	// 날씨 api - 서울
var apiURI = "http://api.openweathermap.org/data/2.5/weather?q="+'seoul'+"&appid="+"7a1ec66578807a91a8efeda47f1aea05";
$.ajax({
    url: apiURI,
    dataType: "json",
    type: "GET",
    async: "false",
    success: function(resp) {

        var $Icon = (resp.weather[0].icon).substr(0,2);
        var $weather_description = resp.weather[0].main;
        var $Temp = Math.floor(resp.main.temp- 273.15) + 'º';
        var $humidity = '습도 : ' + resp.main.humidity+ ' %';
        var $wind = '바람 : ' +resp.wind.speed + ' m/s';
        var $city = '서울';
        var $cloud = '구름' + resp.clouds.all +"%";
        var $temp_min = '최저 온도 : ' + Math.floor(resp.main.temp_min- 273.15) + 'º';
        var $temp_max = '최고 온도 : ' + Math.floor(resp.main.temp_max- 273.15) + 'º';
        

        $('.weather_icon').append('<i class="' + weatherIcon[$Icon] +' fa-5x" style="height : 30px; width : 30px; font-size: 3em; padding-top: 12px;"></i>');
        $('.weather_description').prepend($weather_description);
        $('.current_temp').prepend($Temp);
        $('.humidity').prepend($humidity);
        $('.wind').prepend($wind);
        $('.city').append($city);
        $('.cloud').append($cloud);
        $('.temp_min').append($temp_min);
        $('.temp_max').append($temp_max);               
    }
})
</script>
</html>