<%
    String message = (String)session.getAttribute("message");
    
    if(message!=null){
    
         %>
  <style>
.alert {
  padding: 10px;
  background-color: #006400;
  color: white;
  border: none;
    font-size: 13px;
    font-weight: 500;
    letter-spacing: 1px;
    border-radius: 6px;
    transition: all 0.3s ease;
}

.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 18px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: black;
}
  </style>
  <div class="alert">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong><%= message%></strong>
</div>
    <%
    
    
        session.removeAttribute("message");
    }

%>