<%@ Page Title="" Language="C#" MasterPageFile="~/adminmaster.Master" AutoEventWireup="true" CodeBehind="a_manageuser.aspx.cs" Inherits="deul.WebForm10" %>
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
            <asp:HyperLink ID="backLink" runat="server" NavigateUrl="a_homepage.aspx" CssClass="btn btn-light btn-sm position-absolute" Style="right:10%;">
                <i class="fa fa-arrow-left"></i> Back
            </asp:HyperLink>
            <h2>User Management</h2>
            <asp:Button ID="btnShowAddUser" runat="server" Text="Add New User" CssClass="btn btn-custom" OnClientClick="showSection('#add-User-section'); return false;" />
            <asp:Button ID="btnShowDeleteUser" runat="server" Text="Delete User" CssClass="btn btn-custom" OnClientClick="showSection('#delete-User-section'); return false;" />
            <asp:Button ID="btnShowModifyUser" runat="server" Text="Modify User" CssClass="btn btn-custom" OnClientClick="showSection('#modify-User-section'); return false;" />
            
        </div>

        <!-- Add User Section -->
        <div id="add-User-section" class="section">
            <h3>Add Users</h3>
            <asp:TextBox ID="txtAddUserName" runat="server" CssClass="form-control" placeholder="User Name"></asp:TextBox>
            <asp:DropDownList ID="ddlUserType" runat="server" CssClass="form-select">
                <asp:ListItem Value="" Text="User Type" Disabled="true" Selected="true"></asp:ListItem>
                <asp:ListItem Value="SuperAdmin">SuperAdmin</asp:ListItem>
                <asp:ListItem Value="Admin">Admin</asp:ListItem>
                <asp:ListItem Value="OStaff">Office staff</asp:ListItem>
                <asp:ListItem Value="Accounts">Accounts</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="txtAddPassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
            <asp:Button ID="btnAddUser" runat="server" Text="Add User" CssClass="btn btn-custom" OnClick="AddUser" />
        </div>

        <!-- Delete User Section -->
        <div id="delete-User-section" class="section">
            <h3>Delete User</h3>
            <asp:TextBox ID="txtDeleteUserName" runat="server" CssClass="form-control" placeholder="User Name"></asp:TextBox>
            <asp:Button ID="btnDeleteUser" runat="server" Text="Delete User" CssClass="btn btn-custom" OnClick="DeleteUser" />
        </div>

        <!-- Modify User Type Section -->
        <div id="modify-User-section" class="section">
            <h3>Change User Type</h3>
            <asp:TextBox ID="txtModifyUserName" runat="server" CssClass="form-control" placeholder="User Name"></asp:TextBox>
            <asp:DropDownList ID="ddlModifyUserType" runat="server" CssClass="form-select">
                <asp:ListItem Value="" Text="User Type" Disabled="true" Selected="true"></asp:ListItem>
                <asp:ListItem Value="SuperAdmin">Super Admin</asp:ListItem>
                <asp:ListItem Value="Admin">Admin</asp:ListItem>
                <asp:ListItem Value="OStaff">Office staff</asp:ListItem>
                <asp:ListItem Value="Accounts">Accounts</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="btnModifyUserType" runat="server" Text="Update User Type" CssClass="btn btn-custom" OnClick="ModifyUserType" />
        </div>

        <!-- Add New User Type Section -->
        

        <!-- User List Section -->
        <div id="dlist" class="section">
            <h4 class="text-secondary mt-4"><i class="fa fa-table"></i> User List</h4>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="True" CssClass="table table-bordered table-striped"></asp:GridView>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function showSection(sectionId) {
            $(".section").hide();
            $(sectionId).fadeIn();
            $("#dlist").fadeIn();
        }
        $(document).ready(function () {
            showSection("#dlist");
        });
        
    </script>
</asp:Content>
