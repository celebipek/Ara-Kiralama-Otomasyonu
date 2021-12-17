<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">        
</head>
<body>
    <center>
        <script type="text/javascript">
        window.onload = setInterval(clock, 1000);
        function clock()
        {
            var d = new Date();
            var date = d.getDate();
            var month = d.getMonth();
            var montharr = ["Ocak", "Şubat", "Mart", "Nisan", "Mayıs", "Haziran", "Temmuz", "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık"];
            month = montharr[month];
            var year = d.getFullYear();
            var date = d.getDate();
            var day = d.getDay();
            var dayarr = ["Pazar", "Pazartesi", "Salı", "Çarşamba", "Perşembe", "Cuma", "Cumartesi"];
            day = dayarr[day];
            var hour = d.getHours();
            var min = d.getMinutes();
            var sec = d.getSeconds();
            document.getElementById("date").innerHTML = day + " - " + date + " " + month + " " + year;
            document.getElementById("time").innerHTML = hour + ":" + min + ":" + sec;
        }
        </script>        
        <style type="text/css"> 
            #date {margin-top:20px; font-size:20px; text-align:center; color:black; padding:5px; width:250px; margin-left:0px;}
            #time {margin-top:20px; font-size:20px; text-align:center; color:black; padding:5px; width:150px; margin-left:0px;}
        </style>         
        <div>   
            <p id="date"> </p>
            <p id="time"> </p>
        </div>
    </center>
</body>
</html>
