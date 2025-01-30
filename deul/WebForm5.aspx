<%@ Page Title="" Language="C#" MasterPageFile="~/adminmaster.Master" AutoEventWireup="true" CodeBehind="WebForm5.aspx.cs" Inherits="deul.WebForm5" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container{
            position: absolute;
            top:400px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(document).ready(function() {
        // Fetch countries when the page loads
        fetchCountries();

        // Fetch states when a country is selected
        $('#<%= ddlCountries.ClientID %>').change(function() {
            var selectedCountry = $(this).val();
            fetchStates(selectedCountry);
        });

        // Fetch cities when a state is selected
        $('#<%= ddlStates.ClientID %>').change(function() {
            var selectedState = $(this).val();
            fetchCities(selectedState);
        });
    });

    function fetchCountries() {
        $.ajax({
            url: 'https://www.universal-tutorial.com/api/countries/',
            type: 'GET',
            success: function (data) {
                var ddlCountries = $('#<%= ddlCountries.ClientID %>');
                ddlCountries.empty();
                ddlCountries.append('<option value="">Select Country</option>');
                $.each(data, function (key, value) {
                    ddlCountries.append('<option value="' + value + '">' + value + '</option>');
                });
            },
            error: function (xhr, status, error) {
                alert('Failed to fetch countries.');
            }
        });
    }

    function fetchStates(country) {
        $.ajax({
            url: 'api/test/states/' + encodeURIComponent(country),
            type: 'GET',
            success: function (data) {
                var ddlStates = $('#<%= ddlStates.ClientID %>');
                ddlStates.empty();
                ddlStates.append('<option value="">Select State</option>');
                $.each(data, function (key, value) {
                    ddlStates.append('<option value="' + value + '">' + value + '</option>');
                });
            },
            error: function (xhr, status, error) {
                alert('Failed to fetch states.');
            }
        });
    }

    function fetchCities(state) {
        $.ajax({
            url: 'api/test/cities/' + encodeURIComponent(state),
            type: 'GET',
            success: function (data) {
                var ddlCities = $('#<%= ddlCities.ClientID %>');
                ddlCities.empty();
                ddlCities.append('<option value="">Select City</option>');
                $.each(data, function (key, value) {
                    ddlCities.append('<option value="' + value + '">' + value + '</option>');
                });
            },
            error: function (xhr, status, error) {
                alert('Failed to fetch cities.');
            }
        });
    }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
          <asp:DropDownList ID="ddlCountries" runat="server" AutoPostBack="true"  OnSelectedIndexChanged="ddlCountries_SelectedIndexChanged">
</asp:DropDownList>
<asp:DropDownList ID="ddlStates" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlStates_SelectedIndexChanged">
</asp:DropDownList>
<asp:DropDownList ID="ddlCities" runat="server" OnSelectedIndexChanged="ddlCities_SelectedIndexChanged">
</asp:DropDownList>

    </div>

</asp:Content>
