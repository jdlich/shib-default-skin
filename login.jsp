<!DOCTYPE html>

<%@ taglib uri="urn:mace:shibboleth:2.0:idp:ui" prefix="idpui" %>
<html>
  <head>
    <meta charset="utf-8" />
    <title>Shibboleth Identity Provider - Example Login Page</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/login.css"/>
  </head>

  <body>
    <img src="<%= request.getContextPath()%>/images/logo.jpg" alt="Shibboleth Logo"/>

    <div class="container">
      <header>
        
      </header>
      
      <div class="content">
        <div class="column">
          <% if(request.getAttribute("actionUrl") != null){ %>
            <form id="login" action="<%=request.getAttribute("actionUrl")%>" method="post">
          <% }else{ %>
            <form id="login" action="j_security_check" method="post">
          <% } %>

            <legend>
              <idpui:serviceDescription>Log in to <idpui:serviceName/></idpui:serviceDescription>
            </legend>

            <section>
              <label for="username">Username</label>
              <input class="form-element form-field" name="j_username" type="text" value="username" />
            </section>

            <section>
              <label for="password">Password</label>
              <input class="form-element form-field" name="j_password" type="password" value="&#149;&#149;&#149;&#149;&#149;&#149;&#149;&#149;">
            </section>

            <section>
              <button class="form-element form-button" type="submit">Log In</button>
            </section>

            <% if ("true".equals(request.getAttribute("loginFailed"))) { %>
              <section>
                <span class="form-element form-error"><img src="images/error.png" /></span>
              </section>
            <% } %>
          </form>
        </div>
        <div class="column">
          <ul class="list list-help">
            <li class="help-list-item"><a href="#"><span class="item-marker">&rsaquo;</span> About Shibboleth</a></li>
            <li class="help-list-item"><a href="#"><span class="item-marker">&rsaquo;</span> Documentation</a></li>
            <li class="help-list-item"><a href="#"><span class="item-marker">&rsaquo;</span> How to Customize this Skin</a></li>
            <li class="help-list-item"><a href="#"><span class="item-marker">&rsaquo;</span> View the Mailing Lists</a></li>
            <li class="help-list-item"><a href="#"><span class="item-marker">&rsaquo;</span> Report a Bug</a></li>
          </ul>
        </div>
      </div>
      
      <footer>
        <p class="footer-text">Shibboleth is a standards based, open source software package for WebSSO across or within organizational boundaries. Shibboleth&reg; is a registered trademark of Internet2&reg;.</p>
        <nav class="footer-links">
          <a href="#">About Shibboleth</a>
          <a href="#">Documentation</a>
        </nav>
      </footer>
     </div>

     <!-- pick the logo. If its between 64 & max width/height display it
          If its too high but OK wide clip by height
          If its too wide clip by width.
          We should not clip by height and width since that skews the image.  Too high an image will just show the top.
  
     <idpui:serviceLogo minWidth="64" minHeight="64" maxWidth="350" maxHeight="147" cssId="splogo">
        <idpui:serviceLogo  minWidth="64" minHeight="64" maxWidth="350" cssId="clippedsplogoY">
            <idpui:serviceLogo  minWidth="64" minHeight="64" cssId="clippedsplogoX"/>
        </idpui:serviceLogo>
     </idpui:serviceLogo> -->

     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/jquery-ui.min.js"></script>
     <script>
       $(document).ready(function () {
         inputFields = $("#login input");

         inputFields.each(function () {
           var inputField   = $(this),
               defaultValue = inputField.val(),
               defaultColor = inputField.css("color");

           inputField.focus(function () {
             var inputField = $(this);

             if ( inputField.val() == defaultValue ) {
               inputField.val('');
               inputField.css("color", "#333333");
             }
           });

           inputField.blur(function () {
             var inputField = $(this);

             if ( !inputField.val() ) {
               inputField.attr("value", defaultValue);
               inputField.css("color", defaultColor);
             }
           });          
         });

         inputFields.first().focus();
      });
    </script>
  </body>
</html>
