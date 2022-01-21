<%@page import="Rent_Info.Rent"%>
<%@page import="Rent_Info.RentCarDao"%>
<%@page import="Admin.Admin"%>
<%@page import="Car.Car"%>
<%@page import="User.UserDao"%>
<%@page import="java.util.List"%>
<%@page import="newpackage.ConnectionDao"%>
<%@page import="Car.CarDao"%>
<%@page import="User.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<% Admin admin = (Admin) session.getAttribute("logAdmin");
    if (admin == null) {
        response.sendRedirect("admin.jsp");
    }  
    //list user info
    UserDao userData = new UserDao(ConnectionDao.getConnection());
    List<User> user = userData.listAllUsers();
    request.setAttribute("User_List", user);
    //list car info
    CarDao carData = new CarDao(ConnectionDao.getConnection());
    List<Car> cars = carData.listUnavailableCars();
    request.setAttribute("Unavailable_Car_List", cars);    
    List<Car> available = carData.listAvailableCars();
    request.setAttribute("Available_List", available);
    //list rented car info
    RentCarDao rentedData = new RentCarDao(ConnectionDao.getConnection());
    List<Rent> rents = rentedData.listAllRented();
    request.setAttribute("AllRent_List", rents);
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Welcome Page</title>
    <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
                    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.23/css/dataTables.bootstrap4.min.css">

                        <style>
                            body {
                                background-image: url(../img/Cars.jpg);
                                background-size: cover;
                                background-repeat: no-repeat;
                                font-family: 'Arimo', sans-serif;
                                margin: 0;
                                padding: 0;
                                height: 100%;
                                box-sizing: border-box;
                            }
                            #example_info, #example_paginate, #example_length,#example_filter,
                            #example1_length, #example1_paginate, #example1_info,#example1_filter,
                            #example2_length, #example2_paginate, #example2_info,#example2_filter{
                                display: none;
                            }

                            .editBtn{
                                border: none;
                                border-radius: 4px;
                                padding: 4px 10px;
                            }
                            .editBtn.delete{
                                background-color: #dc3545;
                                margin-left: 10px;
                            }
                            .editBtn.delete:hover{
                                background-color: #c82333;
                            }

                            .editBtn.update:hover{
                                background-color: #138496;
                            }

                            .editBtn.update{
                                background-color: #17a2b8;
                            }
                            .editBtn a{
                                color:#fff;
                                text-decoration: none;
                            }

                            .brand-logo:hover{
                                text-decoration: none;
                                color:#fff;
                                user-select: none;
                            }
                            .btnStop{
                                border:none;
                                border-radius: 4px;
                                background-color: #ffc107;
                                padding: 4px 10px;
                            }
                            .btnStop a{
                                text-decoration: none;
                                color: #000;
                                letter-spacing: .6px;
                            }
                            .btnStop:hover{
                                background-color: #e0a800;
                            }
                        </style>
                        </head>
                        <body>
                        <section class="content">
                            <div class="container-fluid">
                                <!-- Main row -->
                                <div class="row">
                                    <!-- start of left side element-->
                                    <section class="col-lg-1" style="background-color: #ffc0cb; left:5px; top: 5px; background-size: cover; box-shadow: 0 2px 2px 0 rgba(0,0,0,0.14),0 3px 1px -2px rgba(0,0,0,0.12),0 1px 5px 0 rgba(0,0,0,0.2);">
                                        <center>
                                            <div class="admin-left-area">
                                                <div class="profie-card">                        
                                                    <div class="image-card">
                                                        <img src="img/woman.png" style="width:80px ; height:90px; margin-top: 0.2cm;">
                                                    </div>
                                                    <div class="name-card"style="margin-top:10px;">
                                                        <span class="admin-name" style="color:#fff; text-transform: uppercase; font-weight: bold; letter-spacing: 1px;">Hoşgeldin <%= admin.getName()%><br></span>
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
                                        <nav style="background-color: #ffc0cb; left:1px;">
                                            <div class="container">
                                                <div class="nav-wrapper">
                                                    <a class="brand-logo" >Araç kiralama</a>
                                                    <ul class="right hide-on-med-and-down" >
                                                        <li>
                                                            <div class="search bar">
                                                                <form action="">
                                                                    <input type="text" name="search" required placeholder="Ara">                                   
                                                                </form>
                                                            </div>
                                                        </li>
                                                        <li><a href="LogoutServlet?admin=1"><i class="material-icons">settings_power</i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </nav> 
                                        <!-- Custom tabs (Charts with tabs)-->
                                        <div class="card" style="padding:10px">
                                            <div class="card-header">
                                                <h3 class="card-title"><b>Mevcut Araçlar</b></h3>
                                            </div>
                                            <!-- /.card-header -->
                                            <div class="card-body" style="background-color: whitesmoke; border: 1px solid rgba(0, 0, 0, 0.125); border-radius: 0.25rem;">
                                                <table id="example" class="table table-striped table-bordered" style="width:100%">
                                                    <thead>
                                                        <tr>
                                                            <th>Plaka</th>
                                                            <th>Marka</th>
                                                            <th>Renk</th>
                                                            <th>Günlük Fiyat</th>
                                                            <th>Faaliyet</th>
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
                                                                    <button class="editBtn update"><a href="editCar.jsp?c_id=${carList.c_id}">Güncelle</a></button>
                                                                    <button class="editBtn delete"><a href="DeleteCarServlet?c_id=${carList.c_id}">Sil</a></button>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>                  
                                                </table>
                                                <div class="container-fluid">
                                                    <div class="row mb-2" style="padding-top: 5px">
                                                        <section class="col-lg-12">
                                                            <a href="addNewCar.jsp" class="btn btn-success" style="float:right; margine-bottom:10px;">Yeni Araç Ekle</a><br>   
                                                        </section>           
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="content-header">
                                                <div class="container-fluid">
                                                    <div class="row mb-2">          
                                                    </div><!-- /.container-fluid -->
                                                </div>
                                            </div>
                                            <div class="card">
                                                <div class="card-header" style="background-color: azure;">
                                                    <h3 class="card-title"><br><b>Kiralanan Araç Listesi</b></h3>
                                                </div>
                                                <!-- /.card-header -->
                                                <div class="card-body" style="background-color: azure;">
                                                    <table id="example1" class="table table-striped table-bordered" style="width:100%">
                                                        <thead>
                                                            <tr>
                                                                <th>Plaka</th>
                                                                <th>Alış Tarihi</th>
                                                                <th>Dönüş Tarihi</th>
                                                                <th>Toplam Tutar</th>
                                                                <th>Durmak istiyor musun?</th>
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
                                                                        <button class="btnStop"><a href="StopRentServlet?r_id=${rentedList.r_id}&r_durum=0&plate=${rentedList.plate}&admin=1">Durdur</a></button>
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
                                            <div class="card" >
                                                <div class="card-header" style="background-color: #e9eef3;">
                                                    <h3 class="card-title"><br><b>Kullanılamayan Araç listesi</b></h3>
                                                </div>
                                                <!-- /.card-header -->
                                                <div class="card-body" style="background-color: #e9eef3" >
                                                    <table id="example2" class="table table-striped table-bordered" style="width:100%">
                                                        <thead>
                                                            <tr>
                                                                <th>Plaka</th>
                                                                <th>Marka</th>
                                                                <th>Renk</th>
                                                                <th>Fiyat</th>
                                                                <th>Durum</th>
                                                                <th>Faaliyet</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>  
                                                            <c:forEach var="unavailableCarList" items="${Unavailable_Car_List}">
                                                                <tr>
                                                                    <td>${unavailableCarList.plate}</td>
                                                                    <td>${unavailableCarList.brand}</td>
                                                                    <td>${unavailableCarList.color}</td>
                                                                    <td>${unavailableCarList.price}</td>
                                                                    <td>${unavailableCarList.durum}</td>
                                                                    <td>
                                                                        <button class="editBtn update"><a href="editCar.jsp?c_id=${unavailableCarList.c_id}">Güncelle</a></button>
                                                                        <button class="editBtn delete"><a href="DeleteCarServlet?c_id=${unavailableCarList.c_id}">Sil</a></button>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>           
                                                        </tbody>                    
                                                    </table>
                                                </div>
                                                <!-- /.card-body -->
                                            </div> 
                                            <div class="new-users" style="border: 1px solid rgba(0, 0, 0, 0.125); border-radius: 0.25rem;">
                                                <div class="card-header" style="background-color: #e7f0f4;">
                                                    <h3 class="card-title"><br><b>KULLANICI LİSTESİ</b></h3>
                                                </div>
                                                <div class="user-item-block" style="background-color: #e7f0f4;">
                                                    <div class="row" style="padding:10px">
                                                        <c:forEach var="userList" items="${User_List}">
                                                            <div class="col m2" style="left:10px; padding-right: 4cm;">                                    
                                                                <div class="card" style="background-color: transparent; border: 1px solid black; padding: 10px;">
                                                                    <div class="user-profile-icon" >                                                
                                                                        <b>ID=</b>${userList.u_id}<br><b>İSİM=</b>${userList.name}<br><b>Email=</b>${userList.email}
                                                                    </div>
                                                                    <button style="background-color: #dc3545 ; border: none; border-radius: 4px; padding: 5px 0px; margin-top: 10px;"><a href="DeleteUserServlet?u_id=${userList.u_id}" style="color: #fff">KAYDI SİL</a></button>
                                                                </div>                                      
                                                            </div>  
                                                        </c:forEach>
                                                    </div>                            
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                    <!-- end of right side element -->
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