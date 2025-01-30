<%@ Page Title="" Language="C#" MasterPageFile="~/adminmaster.Master" AutoEventWireup="true" CodeBehind="a_managehall.aspx.cs" Inherits="deul.WebForm22" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            padding: 30px;
            margin-top: 100px;
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            position: relative;
        }

        h2 {
            color: #2c3e50;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .form-select, .form-control {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ced4da;
            margin-bottom: 15px;
        }

        .btn-custom {
            background-color: #007bff;
            margin: 10px;
            color: #fff;
            border-radius: 5px;
            padding: 10px 20px;
            font-weight: bold;
            border: none;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn-custom:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }

        .section {
            display: none; /* Hide all sections initially */
            margin-bottom: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-light btn-sm position-absolute" NavigateUrl="a_homepage.aspx" Style="right: 10%;">
                <i class="fa fa-arrow-left"></i> Back
            </asp:HyperLink>
            <h2>Hall Management</h2>
            <asp:Button ID="showAddHall" runat="server" Text="Add New Hall" CssClass="btn btn-custom" OnClientClick="return false;" />
            <asp:Button ID="showDeleteHall" runat="server" Text="Delete Hall" CssClass="btn btn-custom" OnClientClick="return false;" />
            <asp:Button ID="showModifyHall" runat="server" Text="Modify Hall" CssClass="btn btn-custom" OnClientClick="return false;" />
        </div>

        <!-- Add hall Section -->
        <div id="add-hall-section" class="section">
            <h3>Add Rooms</h3>
            <asp:TextBox ID="hallname" runat="server" CssClass="form-control" placeholder="Hall name"></asp:TextBox>
            <asp:DropDownList ID="halltype" runat="server" CssClass="form-select">
                <asp:ListItem Value="" Disabled Selected>Hall Type</asp:ListItem>
                <asp:ListItem Value="ac">AC</asp:ListItem>
                <asp:ListItem Value="nac">Non-AC</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="charges" runat="server" CssClass="form-control" placeholder="Charges"></asp:TextBox>
            <asp:Button ID="Button4" runat="server" Text="Add Hall" CssClass="btn btn-custom" OnClick="AddHall" />
        </div>

        <!-- Delete hall Section -->
        <div id="delete-hall-section" class="section">
            <h3>Delete Hall</h3>
            <asp:TextBox ID="deletename" runat="server" CssClass="form-control" placeholder="Hall name"></asp:TextBox>
            <asp:Button ID="Button5" runat="server" Text="Delete Hall" CssClass="btn btn-custom" OnClick="DeleteHall"/>
        </div>

        <!-- Modify hall Section -->
        <div id="modify-hall-section" class="section">
            <h3>Change Hall Type</h3>
            <asp:TextBox ID="updatename" runat="server" CssClass="form-control" placeholder="Hall name"></asp:TextBox>
            <asp:DropDownList ID="updatehalltype" runat="server" CssClass="form-select">
                <asp:ListItem Value="" Disabled Selected>Hall Type</asp:ListItem>
                <asp:ListItem Value="ac">AC</asp:ListItem>
                <asp:ListItem Value="nac">Non-AC</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="charges2" runat="server" Type="money" CssClass="form-control" placeholder="Charges"></asp:TextBox>
            <asp:Button ID="Button6" runat="server" Text="Update Hall Details" CssClass="btn btn-custom" OnClick="ModifyHallType"/>
        </div>

        <h4 class="text-secondary mt-4"><i class="fa fa-table"></i> Hall List</h4>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="True" CssClass="table table-bordered table-striped"></asp:GridView>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            // Hide all sections initially
            $(".section").hide();

            // Function to show the selected section and hide others
            function showSection(sectionId) {
                $(".section").hide();
                $(sectionId).fadeIn();
            }

            // Add Room Section
            $("#<%= showAddHall.ClientID %>").click(function (event) {
                event.preventDefault();
                showSection("#add-hall-section");
            });

            // Delete Room Section
            $("#<%= showDeleteHall.ClientID %>").click(function (event) {
                event.preventDefault();
                showSection("#delete-hall-section");
            });

            // Modify Room Section
            $("#<%= showModifyHall.ClientID %>").click(function (event) {
                event.preventDefault();
                showSection("#modify-hall-section");
            });
        });
    </script>
</asp:Content>
