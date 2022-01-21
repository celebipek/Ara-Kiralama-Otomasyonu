<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="User.User"%>
<%@page import="Rent_Info.DateDifferance"%>
<%@page import="newpackage.ConnectionDao"%>
<%@page import="Car.Car"%>
<%@page import="Car.CarDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="main/header.jsp" %>

<%  User user = (User) session.getAttribute("logUser");
    if (user == null) {
        response.sendRedirect("index.jsp");
    }    
    int c_id = Integer.parseInt(request.getParameter("c_id"));
    CarDao carkd = new CarDao(ConnectionDao.getConnection());
    Car car = carkd.selectOneCar(c_id);
    request.setAttribute("Edit_Cars", car);
    int price = Integer.parseInt(car.getPrice());
    
    String date1=request.getParameter("date1");
    String date2=request.getParameter("date2");
    DateDifferance dt = new DateDifferance();
    int dt1 = (int) dt.findDifference(date1, date2);
   
    int sonuc = price * dt1;
%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">        
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <title>Rent A Car Data</title>
        <style>
            .inner{
                position: relative;
                margin: 10px auto;
                background-color: #ffc0cb;
                width: 310px;
                display: block;
                padding: 20px 0;
            }
            h3{
                text-align: center;
                border-bottom: 2px solid midnightblue;
                padding-bottom: 5px;
                margin-bottom: 20px;
            }
            nav li a{
                font-size: 15px;
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
                    <center>
                    <h3>Araç Bilgileri</h3>
                    <form>
                        <input type="hidden" name="plate" value="${Edit_Cars.plate}"></input>
                        <div class="form-group">
                            <label style="color: black"><b>PLAKA = </b></label>
                            <span class="plate"><b>${Edit_Cars.plate}</b><br></span>
                        </div> 
                        <div class="form-group">
                            <label style="color: black"><b>KİRALANAN GÜN  = </b></label>
                            <span class="days"><b><%=dt1%> Days</b><br></span>
                        </div>
                        <div class="form-group">
                            <label style="color: black"><b>TOPLAM TUTAR = </b></label>
                            <span class="price  "><b><%=sonuc%>,00 TL</b><br><br></span>
                        </div>
                        <button type="submit" class="btn btn-success"><a href="RentCarServlet?plate=${Edit_Cars.plate}&c_id=${Edit_Cars.c_id}&u_id=<%=user.getU_id()%>&st_date=<%=date1%>&fin_date=<%=date2%>&brand=${Edit_Cars.brand}&color=${Edit_Cars.color}&price=${Edit_Cars.price}&r_price=<%=sonuc%>&r_durum=1" style="color: #ffffff">KABUL ET</a></button>
                        <button  class="btn btn-danger"><a href="userWelcomePage.jsp" style="color: #ffffff">İPTAL</a></button>
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
</html
<%@ include file="main/footer.jsp" %>