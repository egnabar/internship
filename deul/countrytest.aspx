<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="countrytest.aspx.cs" Inherits="deul.countrytest" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Country Dropdown Test</title>
   
    

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" ></asp:TextBox>
            <asp:DropDownList ID="countryDropdown" runat="server"></asp:DropDownList>
        </div>
    </form>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        const jsonData = '<%= TextBox1.Text %>';
        const list = document.getElementById("countryDropdown");
        const countries = JSON.parse(jsonData);
        countries.forEach(country => {
            const option = document.createElement("option");
            option.value = country.country_name;
            option.textContent = country.country_name;
            list.appendChild(option);
        })
        alert(jsonData);
    </script>
</body>
</html>
