<%@ Page Title="" Language="C#" MasterPageFile="~/adminmaster.Master" AutoEventWireup="true" CodeBehind="WebForm6.aspx.cs" Inherits="deul.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container{
            position: absolute;
            top:400px;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                type: "POST",
                url: "WebForm6.aspx/GetCountries",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var countries = JSON.parse(response.d);
                    var dropdown = $('#ddlCountries');
                    dropdown.empty();
                    dropdown.append('<option selected="true" disabled>Choose Country</option>');
                    dropdown.prop('selectedIndex', 0);

                    $.each(countries, function (key, country) {
                        dropdown.append($('<option></option>').attr('value', country.country_name).text(country.country_name));
                    });
                },
                error: function (err) {
                    console.log(err);
                }
            });
        });
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container">
          <asp:DropDownList ID="ddlCountries" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCountries_SelectedIndexChanged">
                <asp:ListItem Text="Select a Country" Value="" />
            </asp:DropDownList>
            <asp:DropDownList ID="ddlStates" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlStates_SelectedIndexChanged">
            
            </asp:DropDownList>
            <asp:DropDownList ID="ddlCities" runat="server" OnSelectedIndexChanged="ddlCities_SelectedIndexChanged">

            </asp:DropDownList>
       </div>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
</asp:Content>
