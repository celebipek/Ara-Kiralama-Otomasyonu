<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.LocalDate"%>
<%@page import="javax.swing.text.DateFormatter"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.List"%>
<%@page import="Rent_Info.Rent"%>
<%@page import="Rent_Info.RentCarDao"%>
<%@page import="User.User"%>
<%@page import="newpackage.ConnectionDao"%>
<%@page import="Car.Car"%>
<%@page import="Car.CarDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>  
<%@ include file="main/header.jsp" %>

<%  User user = (User) session.getAttribute("logUser");
    if (user == null) {
        response.sendRedirect("index.jsp");
    }
    //get today
    LocalDate myObj = LocalDate.now();
    
    int c_id = Integer.parseInt(request.getParameter("c_id"));
    CarDao carkd = new CarDao(ConnectionDao.getConnection());
    Car car = carkd.selectOneCar(c_id);
    request.setAttribute("Car_List", car);
    
    int u_id = user.getU_id();
    RentCarDao rentedData = new RentCarDao(ConnectionDao.getConnection());
    List<Rent> renteds = rentedData.listedUserRented(u_id);
    request.setAttribute("Rented_List", renteds);
    
    String plate = request.getParameter("plate");
    List<Rent> rents = rentedData.listedSelectedRented(plate);    
    request.setAttribute("AllRent_List", rents);
    
    //fetches date information from database
    String datesJSON = "[";   
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    for(Rent rent:rents){
        Date d1 = sdf.parse(rent.getSt_date());
        Date d2 = sdf.parse(rent.getFin_date());
        Calendar c = Calendar.getInstance(); 
        while(d1.before(d2)){
            datesJSON += "\"" + sdf.format(d1) + "\",";
            c.setTime(d1); 
            c.add(Calendar.DATE, 1);
            d1=c.getTime();
        }        
    }
    datesJSON += "]";
     request.setAttribute("dateJSON", datesJSON);
    
%>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <title>Rent A Car Data</title>
    <style>
              body{
            background-color: ivory;
        }
        .inner{
            background-color: 	#dda0dd;
            position: relative;
            margin: 10px auto;
            width: 300px;
            display: block;
            padding: 15px 10px;
            border-radius: 4px;
        }
        h3{
            text-align: center;
            border-bottom: 2px solid midnightblue;
            padding-bottom: 5px;
            margin-bottom: 10px;
        }
        nav li a{
            font-size: 15px;
            font-weight: 500;
        }
        a{
            color: #fff;
            text-decoration: none;
        }
        label{
            font-size:16px;
        }
        .form-control[readonly]{
            background-color: whitesmoke;
            border: 1px solid black;
        }
  
    </style>        
</head>
<body>
    <div class="inner">
        <div class=" container">
            <div class="row">
                <div class="col-12">
                    <h3>Araç Bilgileri</h3>
                    <form action="pay.jsp?c_id=${Car_List.c_id}&plate=${Car_List.plate}&u_id=<%=user.getU_id()%>" method="post" name="form">                        
                        <center>
                        <div class="form-group">
                            <label style="color: black"><b>Marka</b></label>
                            <input class="form-control" name="brand" style="text-align: center; color: black" value="${Car_List.brand}" readonly>
                        </div>
                        <div class="form-group">
                            <label style="color: black"><b>Renk</b></label>
                            <input class="form-control" name="color" style="text-align: center; color: black" value="${Car_List.color}" readonly>
                        </div>
                        <div class="form-group">
                            <label style="color: black"><b>Günlük ücret</b></label>
                            <input class="form-control" name="price" style="text-align: center; color: black" value="${Car_List.price},00 TL" readonly>
                        </div>
                        <div class="form-group">
                            <div><label for="start" style="color: black"><b>Alış Tarihi</b></label></div>
                            <div><input type="text" id="date1" name="date1" autocomplete="off" style="text-align: center;" required></div>
                                        
                            <div><label for="finish" style="color: black; padding-top: 10px"><b>Dönüş Tarihi</b><br></label></div>
                            <div><input type="text" id="date2" name="date2" autocomplete="off" style="text-align: center;" required></div>
                        </div>
                        <div style="padding-top: 10px">
                            <button type="submit" class="btn btn-primary" style="color:#ffc0cb"><a style="color:#dda0dd" >Öde</a> </button>
                        <button  class="btn btn-primary"><a href="userWelcomePage.jsp" style="color:#dda0dd">İptal</a></button>
                        </div>
                        </center>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw==" crossorigin="anonymous" />
    
    <script type="text/javascript">
        $(function(){             
            $('[name=date1]').datepicker({
                format : 'yyyy-mm-dd',
                autoclose : true                
            });
            $('[name=date1]').datepicker('setDatesDisabled',${dateJSON});
            $('[name=date1]').datepicker('setStartDate',"<%=myObj%>");            
            //$("[name=date1]").val("<%=myObj%>");
            $('[name=date1]').datepicker('setEndDate',"2025-12-31");
            
            $('[name=date2]').datepicker({
                format : 'yyyy-mm-dd',
                autoclose : true
            });
            $('[name=date2]').datepicker('setDatesDisabled',${dateJSON});            
            $('[name=date2]').datepicker('setStartDate',"<%=myObj%>");
            $('[name=date2]').datepicker('setEndDate',"2025-12-31");
      });
    </script>

</body>
</html>
<%@ include file="main/footer.jsp" %>