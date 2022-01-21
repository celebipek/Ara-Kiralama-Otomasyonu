<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kayıt Olma Sayfası</title>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
    <div class="container">
        <div class="regbox" id="addcar">
            <img class="avatar" id="addcaravatar" src="img/green.png">
            <h1>Yeni Araba Ekleme Sayfası</h1>
            <form action="NewCarServlet" method="get">
            <p>Plaka</p>
            <input type="text" placeholder="Plaka" name="plate" required>
            <p>Marka</p>
            <input type="text" placeholder="Marka" name="brand" required>
            <p>Renk</p>
            <input type="text" placeholder="Renk" name="color" required>
            <p>Günlük Fiyat</p>
            <input type="text" placeholder="Fiyat" name="price" required>            
            <input type="submit" value="Kaydet!">                            
            </form>
        </div>
     </div>
    </body>
</html>