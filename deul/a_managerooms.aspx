<%@ Page Title="" Language="C#" MasterPageFile="~/adminmaster.Master" AutoEventWireup="true" CodeBehind="a_managerooms.aspx.cs" Inherits="deul.WebForm12" %>
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

        GridView {
            width: 90%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div>
            <asp:HyperLink ID="BackLink" NavigateUrl="a_homepage.aspx" CssClass="btn btn-light btn-sm position-absolute" Style="right:10%;" runat="server">
                <i class="fa fa-arrow-left"></i> Back
            </asp:HyperLink>
            <h2>Rooms Management</h2>
            <asp:Button ID="ShowAddRoom" CssClass="btn btn-custom" Text="Add New Room" OnClientClick="showSection('#add-room-section'); return false;" runat="server" />
            <asp:Button ID="ShowDeleteRoom" CssClass="btn btn-custom" Text="Delete Room" OnClientClick="showSection('#delete-room-section'); return false;" runat="server" />
            <asp:Button ID="ShowModifyRoom" CssClass="btn btn-custom" Text="Modify Room Type" OnClientClick="showSection('#modify-room-section'); return false;" runat="server" />
            <asp:Button ID="ShowAddRoomType" CssClass="btn btn-custom" Text="Update Charges" OnClientClick="showSection('#add-room-type-section'); return false;" runat="server" />
        </div>

        <!-- Add Room Section -->
        <div id="add-room-section" class="section">
            <h3>Add Rooms</h3>
            <asp:DropDownList ID="AgrashalaType" CssClass="form-select" runat="server">
                <asp:ListItem Text="Agrashala" Value="" Selected="True" Disabled="True" />
                <asp:ListItem Text="Agrashala 1" Value="A1" />
                <asp:ListItem Text="Agrashala 2" Value="A2" />
                <asp:ListItem Text="Agrashala 3" Value="A3" />
            </asp:DropDownList>
            <asp:DropDownList ID="RoomType" CssClass="form-select" runat="server">
                <asp:ListItem Text="Room Type" Value="" Selected="True" Disabled="True" />
                <asp:ListItem Text="AC Big" Value="acbig" />
                <asp:ListItem Text="AC Small" Value="acsmall" />
                <asp:ListItem Text="Non-AC Big" Value="nacbig" />
                <asp:ListItem Text="Non-AC Small" Value="nacsmall" />
            </asp:DropDownList>
            <asp:DropDownList ID="FloorLocation" CssClass="form-select" runat="server">
                <asp:ListItem Text="Floor" Value="" Selected="True" Disabled="True" />
                <asp:ListItem Text="Ground Floor" Value="ground" />
                <asp:ListItem Text="1st Floor" Value="1st" />
            </asp:DropDownList>
            <asp:Button ID="AddRoomButton" CssClass="btn btn-custom" Text="Add Room" OnClick="AddRoom_Click" runat="server" />
        </div>

        <!-- Delete Room Section -->
        <div id="delete-room-section" class="section">
            <h3>Delete Rooms</h3>
            <asp:TextBox ID="DeleteRoomID" CssClass="form-control" Placeholder="Room number" runat="server" />
            <asp:Button ID="DeleteRoomButton" CssClass="btn btn-custom" Text="Delete Room" OnClick="DeleteRoom_Click" runat="server" />
        </div>

        <!-- Modify Room Type Section -->
        <div id="modify-room-section" class="section">
            <h3>Change Room Type</h3>
            <asp:TextBox ID="ModifyRoomID" CssClass="form-control" Placeholder="Room ID" runat="server" />
            <asp:DropDownList ID="NewRoomType" CssClass="form-select" runat="server">
                <asp:ListItem Text="Room Type" Value="" Selected="True" Disabled="True" />
                <asp:ListItem Text=" AC Big" Value="acbig" />
                <asp:ListItem Text=" AC Small" Value="acsmall" />
                <asp:ListItem Text=" Non-AC Big" Value="nacbig" />
                <asp:ListItem Text=" Non-AC Small" Value="nacsmall" />
            </asp:DropDownList>
            <asp:Button ID="ModifyRoomButton" CssClass="btn btn-custom" Text="Update Room Type" OnClick="ModifyRoomType_Click" runat="server" />
        </div>

        <!-- update charge Section -->
        <div id="add-room-type-section" class="section">
            <h3>update charges</h3>
            <asp:DropDownList ID="updateRoomType" CssClass="form-select" runat="server">
                <asp:ListItem Text="Room Type Name" Value="" Selected="True" Disabled="True" />
                <asp:ListItem Text=" AC Big" Value="acbig" />
                <asp:ListItem Text=" AC Small" Value="acsmall" />
                <asp:ListItem Text=" Non-AC Big" Value="nacbig" />
                <asp:ListItem Text=" Non-AC Small" Value="nacsmall" />
            </asp:DropDownList>
            <asp:TextBox ID="BasicCharges" CssClass="form-control" Placeholder="Basic Charges" runat="server" />
            <asp:TextBox ID="ExtensionCharges" CssClass="form-control" Placeholder="Extension Charges" runat="server" />
            <asp:Button ID="UpdateRoomTypeButton" CssClass="btn btn-custom" Text="update charges" OnClick="UpdateRoomType_Click" runat="server" />
        </div>

        <div class="cdisplay">
            <h4 class="text-secondary mt-4"><i class="fa fa-table"></i> Rooms List</h4>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="True" CssClass="table table-bordered table-striped"></asp:GridView>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function showSection(sectionId) {
            $(".section").hide(); // Hide all sections
            $(sectionId).fadeIn(); // Show the selected section
        }
    </script>
</asp:Content>
