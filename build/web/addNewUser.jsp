<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>hesap giriş</title>
    <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <style>
        .regbox h3 {
            margin-top: 1px;
            text-align: center;
            font-size: 30px;
        }
    </style>
    </head>
    <body>
    <div class="container">
        <div class="regbox">
            <h3>Yeni Hesap</h3>
            <form action="NewUserServlet" method="post">
                <p>Kullanıcı Adı</p>
                <input type="text" placeholder="Kullanıcı Adı" name="name" required>
                <p>E-Mail</p>
                <input type="text" placeholder="Kullanıcı E-Mail" name="email" required>
                <p>Şifre</p>
                <input type="password" placeholder="Kullanıcı Şifre" name="password" required>
                <input type="submit" value="Kaydol">
                <a href="index.jsp" style="position: relative; left: 70px">Zaten hesabım var</a>
            </form>
        </div>
    </div>
    </body>
</html>