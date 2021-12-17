<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
    <title>Admin giriş</title>
    <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
    <div class="container">
        <div class="box">
            <h1>Yönetici Hesabı</h1>
            <form action="LoginAdminServlet" method="post">
                <p>E-Mail</p>
                <input type="text" placeholder="Email" name="email" required>
                <p>Şifre</p>
                <input type="password" placeholder="Şifre" name="password" required>
                <input type="submit" value="Giriş Yap">
                    <a href="index.jsp" style="position: relative; left: 40px">Üye girişi için buraya tıklayınız. </a>
            </form>
        </div>
    </div>
    </body>
</html>