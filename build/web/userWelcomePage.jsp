<%@page import="Rent_Info.Rent"%>
<%@page import="Rent_Info.RentCarDao"%>
<%@page import="Car.Car"%>
<%@page import="User.UserDao"%>
<%@page import="java.util.List"%>
<%@page import="newpackage.ConnectionDao"%>
<%@page import="Car.CarDao"%>
<%@page import="User.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<% User user = (User) session.getAttribute("logUser");
    if (user == null) {
        response.sendRedirect("index.jsp");
    }    
    
    UserDao userData = new UserDao(ConnectionDao.getConnection());
    List<User> users = userData.listAllUsers();
    request.setAttribute("User_List", users);

    CarDao carData = new CarDao(ConnectionDao.getConnection());
    List<Car> cars = carData.listAllCars();
    request.setAttribute("Car_List", cars);
    
    List<Car> available = carData.listAvailableCars();
    request.setAttribute("Available_List", available);
    
    int u_id = user.getU_id();
    RentCarDao rentedData = new RentCarDao(ConnectionDao.getConnection());
    List<Rent> renteds = rentedData.listedUserRented(u_id);
    request.setAttribute("AllRent_List", renteds);
    
    List<Rent> oldrenteds = rentedData.listedOldUserRented(u_id);
    request.setAttribute("Old_Rented_List", oldrenteds);
%>     
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Kullanıcı sayfası</title>
    <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
                    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.23/css/dataTables.bootstrap4.min.css">

                        <style>
                            #example_info, #example_paginate, #example_length,#example_filter,
                            #example1_length, #example1_paginate, #example1_info,#example1_filter,
                            #example2_length, #example2_paginate, #example2_info,#example2_filter{
                                display: none;
                            }
                            .btnEdit{
                                border:none;
                                border-radius: 4px;
                                background-color: #17a2b8;
                                padding: 4px 10px;
                            }
                            .btnEdit:hover{
                                background-color: #138496;
                            }
                            .btnEdit a{
                                color: #fff;
                                letter-spacing: .6px;
                            }
                            .btnStop{
                                border:none;
                                border-radius: 4px;
                                background-color: #ffc107;
                                padding: 4px 10px;
                            }
                            .btnStop a{
                                color: #000;
                                letter-spacing: .6px;
                            }
                            .btnStop:hover{
                                background-color: #e0a800;
                            }
                            a{
                                text-decoration: none !important;
                            }
                            .brand-logo:hover{
                                text-decoration: none;
                                color:#fff;
                                user-select: none;
                            }
                        </style>
                        </head>
                        <body>
                        <section class="content">
                            <div class="container-fluid">
                                <!-- Main row -->
                                <div class="row">
                                    <!-- start of left side element-->
                                    <section class="col-lg-1" style="background-color: 	#dda0dd; left:5px; top: 5px; background-size: cover; box-shadow: 0 2px 2px 0 rgba(0,0,0,0.14),0 3px 1px -2px rgba(0,0,0,0.12),0 1px 5px 0 rgba(0,0,0,0.2);">
                                        <center>
                                            <div class="admin-left-area">
                                                <div class="profie-card">                        
                                                    <div class="image-card">
                                                        <img src="img/woman.png" style="width:80px ; height:90px; margin-top: 0.5cm;">
                                                    </div>
                                                    <div class="name-card">
                                                        <span class="user-name" style="position: relative; color:#fff; text-transform: uppercase; font-weight: bold; letter-spacing: 1px;"><b>Hoşgeldin <%=user.getName()%></b><br></span>
                                                    </div>
                                                </div>                     
                                            </div>  
                                        </center>
                                    </section>
                                    <!-- end of left side element -->            
                                    <!-- start of right side element -->
                                    <section class="col-lg-11 connectedSortable">
                                        <div class="content-header">
                                            <div class="container-fluid">
                                                <div class="row mb-1">          
                                                </div><!-- /.container-fluid -->
                                            </div>
                                        </div>
                                        <nav style="background-color: 	#dda0dd; left:1px;">
                                            <div class="container">
                                                <div class="nav-wrapper">
                                                    <a class="brand-logo">Araç Kiralama Sayfası</a>
                                                    <ul class="right hide-on-med-and-down">
                                                        <li>
                                                            <div class="search bar">
                                                                <form action="">
                                                                    <input type="text" name="search" required placeholder="Arama">                                   
                                                                </form>
                                                            </div>
                                                        </li>
                                                        <li><a href="LogoutServlet?admin=0"><i class="material-icons">settings_power</i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </nav>

                                        <!-- Custom tabs (Charts with tabs)-->
                                        <div class="card" style="background-color: whitesmoke;">
                                            <div class="card-header">
                                                <h3 class="card-title"><b> Mevcut Araç listesi </b></h3>
                                            </div>
                                            <!-- /.card-header -->
                                            <div class="card-body" style="background-color: whitesmoke; border: 1px solid rgba(0, 0, 0, 0.125); border-radius: 0.25rem;">
                                                <table id="example" class="table table-striped table-bordered"  style="width:100% ">
                                                    <thead>
                                                        <tr>
                                                            <th>Plaka</th>
                                                            <th>Marka</th>
                                                            <th>Renk</th>
                                                            <th>Günlük ücret</th>
                                                            <th>Kiralamak istermisin</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="carList" items="${Available_List}">
                                                            <tr>                                    
                                                                <td>${carList.plate}</td>
                                                                <td>${carList.brand}</td>
                                                                <td>${carList.color}</td>
                                                                <td>${carList.price},00 TL</td> 
                                                                <td>
                                                                    <button class="btnEdit rent"><a href="rent.jsp?c_id=${carList.c_id}&plate=${carList.plate}&u_id=<%=user.getU_id()%>" >Kirala</a></button>                                                            
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>                  
                                                </table>
                                            </div>
                                            <!-- /.card-body -->
                                        </div> 
                                        <div class="content-header">
                                            <div class="container-fluid">
                                                <div class="row mb-2">          
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card" style="background-color: azure;">
                                            <div class="card-header">
                                                <h3 class="card-title"><b>Kiralanan Araçlar</b></h3>
                                            </div>
                                            <!-- /.card-header -->
                                            <div class="card-body">
                                                <table id="example1" class="table table-striped table-bordered" style="width:100%">
                                                    <thead>
                                                        <tr>
                                                            <th>Plaka</th>
                                                            <th>Alış tarihi</th>
                                                            <th>Dönüş Tarihi</th>
                                                            <th>Toplam Tutar</th>
                                                            <th>Durmak mı İstiyorsun?</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="rentedList" items="${AllRent_List}">
                                                            <tr>                                    
                                                                <td>${rentedList.plate}</td>
                                                                <td>${rentedList.st_date}</td>
                                                                <td>${rentedList.fin_date}</td>
                                                                <td>${rentedList.r_price},00 TL</td>
                                                                <td>
                                                                    <button class="btnStop"><a href="StopRentServlet?r_id=${rentedList.r_id}&r_durum=0&plate=${rentedList.plate}&admin=0" >Durdur</a></button>
                                                                </td>                                    
                                                            </tr>
                                                        </c:forEach>  
                                                    </tbody>                  
                                                </table>
                                            </div>
                                        </div>
                                        <div class="content-header">
                                            <div class="container-fluid">
                                                <div class="row mb-2">          
                                                </div><!-- /.container-fluid -->
                                            </div>
                                        </div>
                                        <div class="card" style="background-color: #e9eef3">
                                            <div class="card-header">
                                                <h3 class="card-title"><b>Kiralama Geçmişi</b></h3>
                                            </div>
                                            <!-- /.card-header -->
                                            <div class="card-body">
                                                <table id="example2" class="table table-striped table-bordered" style="width:100%">
                                                    <thead>
                                                        <tr>
                                                            <th>Plaka</th>
                                                            <th>Alış Tarihi</th>
                                                            <th>Dönüş Tarihi</th>
                                                            <th>Toplam Tutar</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>  
                                                        <c:forEach var="oldRentedList" items="${Old_Rented_List}">
                                                            <tr>                                    
                                                                <td>${oldRentedList.plate}</td>
                                                                <td>${oldRentedList.st_date}</td>
                                                                <td>${oldRentedList.fin_date}</td>
                                                                <td>${oldRentedList.r_price},00 TL</td>  
                                                            </tr>
                                                        </c:forEach>           
                                                    </tbody>                    
                                                </table>
                                            </div>
                                            <!-- /.card-body -->
                                        </div> 
                                    </section>
                                </div>
                            </div>    
                        </section>
                        <!--end of body content--> 
                        <script src="http://cdnjs.cloudflare.com/ajax/libs/materalize/1.0.0/css/materalize.min.css.js"></script>   
                        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
                        <script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
                        <script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
                        <script>
                            $(document).ready(function () {
                                $('#example').DataTable();
                                $('#example1').DataTable();
                                $('#example2').DataTable();
                            });
                        </script>
                        </body>
                        </html>