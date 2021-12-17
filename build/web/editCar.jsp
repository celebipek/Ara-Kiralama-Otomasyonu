<%@page import="newpackage.ConnectionDao"%>
<%@page import="Car.Car"%>
<%@page import="Car.CarDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="main/header.jsp" %>

<%  int c_id = Integer.parseInt(request.getParameter("c_id"));
    CarDao carkd = new CarDao(ConnectionDao.getConnection());
    Car car = carkd.selectOneCar(c_id);
    request.setAttribute("edit_cars", car);
%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <title>araba bilgileri</title>
        <style>
            .inner{
                position: relative;
                margin: 0 auto;
                width: 250px;
                display: block;
                padding: 20px 0;
            }
            h3{
                text-align: center;
                border-bottom: 2px solid midnightblue;
                margin-bottom: 20px;
            }
            nav li a{
                font-size: 25px;
                font-weight: 500;
            }
            a{
                color: #fff;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
    <div class="inner">
        <div class=" container">
            <div class="row">
                <div class="col-12">
                    <h3>Araç Bilgilerini Güncelle</h3>
                    <center>
                    <form action="EditCarServlet" method="post">                       
                            <input type="hidden" class="form-control" name="c_id" value="${edit_cars.c_id }">                        
                        <div class="form-group1">
                            <label><b>Plaka No</b></label>
                            <input class="form-control" name="plate" value="${edit_cars.plate }" style="text-align: center; color: black" required>
                        </div>
                        <div class="form-group1">
                            <label><b>Marka</b></label>
                            <input class="form-control" name="brand" value="${edit_cars.brand }" style="text-align: center; color: black" required>
                        </div>
                        <div class="form-group1">
                            <label><b>Renk</b></label>
                            <input class="form-control" name="color" value="${edit_cars.color}" style="text-align: center; color: black" required>
                        </div>
                        <div class="form-group1">
                            <label><b>Fiyat</b></label>
                            <input class="form-control" name="price" value="${edit_cars.price}" style="text-align: center; color: black" required>
                        </div>
                        <div class="form-group1">
                            <label><b>Kullanılamaz durum</b></label>
                            <input class="form-control" name="durum" value="${edit_cars.durum}" style="text-align: center; color: black" required>
                        </div>                        
                        <button type="submit" class="btn btn-primary">Kaydet</button>
                        <button  class="btn btn-primary"><a href="adminWelcomePage.jsp">İptal</a></button>
                    </form>
                        </center>
                </div>
            </div>
        </div>
    </div>
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>