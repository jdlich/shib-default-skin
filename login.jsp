<!DOCTYPE html>

<%@ taglib uri="urn:mace:shibboleth:2.0:idp:ui" prefix="idpui" %>
<html>
  <head>
    <meta charset="utf-8" />
    <title>Shibboleth Identity Provider - Example Login Page</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/login.css"/>
  </head>

  <body>
    <div class="wrapper">
      <div class="container">
        <header>
          <a class="logo" href="http://shibboleth.net/"><img src="<%= request.getContextPath()%>/images/logo.png" alt="Shibboleth Logo"/></a>
        </header>
    
        <div class="content">
          <div class="column one">
            <% if(request.getAttribute("actionUrl") != null){ %>
              <form id="login" action="<%=request.getAttribute("actionUrl")%>" method="post">
            <% }else{ %>
              <form id="login" action="j_security_check" method="post">
            <% } %>

              <% if ("true".equals(request.getAttribute("loginFailed"))) { %>
                <section>
                  <p class="form-element form-error">Login has failed. Double-check your username and password.</p>
                </section>
              <% } %>

              <legend>
                Log in to <idpui:serviceName/>
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
            </form>
            
            <%
              //
              //    SP Description & Logo (optional)
              //
              //    Documentation: 
              //      https://wiki.shibboleth.net/confluence/display/SHIB2/IdPAuthUserPassLoginPage
              //
              //    Example:
              //      <p>
              //        <idpui:serviceLogo>default</idpui:serviceLogo>
              //        <idpui:serviceDescription>SP description</idpui:serviceDescription>
              //      </p>
              //
            %>
          </div>
          <div class="column two">
            <ul class="list list-help">
              <li class="list-help-item"><a href="http://shibboleth.net/about"><span class="item-marker">&rsaquo;</span> About Shibboleth</a></li>
              <li class="list-help-item"><a href="https://wiki.shibboleth.net"><span class="item-marker">&rsaquo;</span> Documentation</a></li>
              <li class="list-help-item"><a href="https://wiki.shibboleth.net/confluence/display/SHIB2/IdPAuthUserPassLoginPage"><span class="item-marker">&rsaquo;</span> How to Customize this Skin</a></li>
              <li class="list-help-item"><a href="http://shibboleth.net/community/lists.html"><span class="item-marker">&rsaquo;</span> View the Mailing Lists</a></li>
              <li class="list-help-item"><a href="https://issues.shibboleth.net"><span class="item-marker">&rsaquo;</span> Report a Bug</a></li>
            </ul>
          </div>
        </div>
      </div>

      <footer>
        <div class="container container-footer">
          <p class="footer-text">Shibboleth is a standards based, open source software package for WebSSO across or within organizational boundaries. Shibboleth&reg; is a registered trademark of Internet2&reg;.</p>
          <nav class="footer-links">
            <a href="http://shibboleth.net/about">About Shibboleth</a>
            <a href="https://wiki.shibboleth.net">Documentation</a>
          </nav>
        </div>
      </footer>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/jquery-ui.min.js"></script>
    <script>
      $(document).ready(function () {

        // Placeholder script
        inputFields = $("#login input");

        inputFields.each(function () {
          var inputField   = $(this),
              defaultValue = inputField.val();

          inputField
            .focus(function () {
              var thisInput = $(this);

              if ( thisInput.val() == defaultValue ) {
                thisInput.addClass('form-field-focus').val('');
              }
            })
            .blur(function () {
              var thisInput = $(this);

              if ( !thisInput.val() ) {
                thisInput.removeClass('form-field-focus').attr('value', defaultValue);
              }
            });            
        });
        
        // Autofocus username field
        inputFields.first().focus();
        
        // Add "last" class to footer nav
        $(".footer-links a:last-child").addClass("last");
      });
    </script>
  </body>
</html>
