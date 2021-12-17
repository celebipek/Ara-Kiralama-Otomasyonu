<%@page import="Admin.Admin"%>
<%@page import="User.User"%>
<%  User user = (User) session.getAttribute("logUser");
     
    Admin admin = (Admin) session.getAttribute("logAdmin");
    String name;
    if (user != null) {
        name = user.getName();
    } else{
        name =admin.getName();
    }
%>
    <!-- start of left side element-->
    <div class="col m0 s12">
        <div class="admin-left-area">
            <div class="profie-card">
                <div class="image-card">
                    <img src="img/user-avatar.png" style="width:100px ; height:100px; margin-top: 1.5cm; position: relative; right: -20px">
                </div>
                <div class="name-card">
                    <span class="user-name" style="position: relative; right: -10px"><b>Welcome <%=name%></b><br></span>
                </div>
            </div>                    
        </div>
    </div>
    <!-- end of left side element -->   