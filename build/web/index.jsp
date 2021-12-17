<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    boolean Cookcontrol=false;
    Cookie cookies[] = request.getCookies ();
    Cookie logEmail = null, logPass = null;
    if (cookies != null){
        for (int i = 0; i < cookies.length; i++){
            if (cookies[i].getName().equals("logEmail")){ 
                logEmail = cookies[i]; Cookcontrol=true; 
            }
            if (cookies[i].getName().equals("logPass")){ 
                logPass = cookies[i];  
            }
        }
    } 
%>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
    <title>User Account</title>
    <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
    <div class="container">
        <div class="box">
            <h1>Üye Hesabı</h1>
            <form action="LoginUserServlet" method="post" id="myForm">
            <p>E-Mail</p>
            <input type="text" placeholder="Email" name="email" value="<%=(Cookcontrol==true?logEmail.getValue():"")%>" required>
            <p>Şifre</p>
            <input type="password" placeholder="şifre" name="password" value="<%=(Cookcontrol==true?logPass.getValue():"")%>" required>
            <input type="submit" value="Giriş Yap">                
                <a href="addNewUser.jsp" style="position: relative; left: 70px">Yeni Hesap Oluştur<br></a>
                <a href="admin.jsp" style="position: relative; left: 90px"><br>Admin girişi</a>
                <%
                    if (Cookcontrol) {
                        out.print("<script>document.getElementById('myForm').submit();</script> ");
                    }
                %>
            </form>
        </div>
    </div>
    </body>
</html>