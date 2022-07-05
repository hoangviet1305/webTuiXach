<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
    <head>
    </head>
    <body>
        <h3>Welcome, Enter The Employee Details</h3>
        <form:form method="POST" 
          action="saveSP" modelAttribute="product">
             <table>
                <tr>
                    <td><form:label path="ten">Name</form:label></td>
                    <td><form:input path="ten"/></td>
                </tr>
               
                <tr>
                    <td><form:label path="gia">
                      Gia</form:label></td>
                    <td><form:input path="gia"/></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Submit"/></td>
                </tr>
            </table>
        </form:form>
    </body>
</html>