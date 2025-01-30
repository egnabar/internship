<%@ Page Title="" Language="C#" MasterPageFile="~/adminmaster.Master" AutoEventWireup="true" CodeBehind="a_sevamanagement.aspx.cs" Inherits="deul.WebForm21" %>
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
            <asp:HyperLink ID="BackLink" NavigateUrl="a_homepage.aspx" CssClass="btn btn-light btn-sm position-absolute" Style="right:10%;" runat="server">
                <i class="fa fa-arrow-left"></i> Back
            </asp:HyperLink>
            <h2>Seva Management</h2>
            <asp:Button ID="ShowAddSeva" CssClass="btn btn-custom" Text="Add New Seva" OnClientClick="showSection('#add-seva-section'); return false;" runat="server" />
            <asp:Button ID="ShowDeleteSeva" CssClass="btn btn-custom" Text="Delete Seva" OnClientClick="showSection('#delete-seva-section'); return false;" runat="server" />
            <asp:Button ID="ShowModifySeva" CssClass="btn btn-custom" Text="Modify Seva " OnClientClick="showSection('#modify-seva-section'); return false;" runat="server" />
        </div>

        <!-- Add Seva Section -->
        <div id="add-seva-section" class="section">
            <h3>Add Seva</h3>
            <asp:TextBox ID="AddSevaName" CssClass="form-control" Placeholder="Seva Name" runat="server" />
            <asp:TextBox ID="AddSevaCharges" CssClass="form-control" Placeholder="Charges" runat="server" />
            <asp:Button ID="AddSevaButton" CssClass="btn btn-custom" Text="Add Seva" OnClick="AddSeva_Click" runat="server" />
        </div>

        <!-- Delete Seva Section -->
        <div id="delete-seva-section" class="section">
            <h3>Delete Seva</h3>
            <asp:TextBox ID="DeleteSevaID" CssClass="form-control" Placeholder="Seva ID" runat="server" />
            <asp:Button ID="DeleteSevaButton" CssClass="btn btn-custom" Text="Delete Seva" OnClick="DeleteSeva_Click" runat="server" />
        </div>

        <!-- Modify Seva Section -->
        <div id="modify-seva-section" class="section">
            <h3>Change Seva Type</h3>
            <asp:TextBox ID="UpdateSevaID" CssClass="form-control" Placeholder="Seva ID" runat="server" />
            <asp:TextBox ID="UpdateSevaCharges" CssClass="form-control" Placeholder="New Charges" runat="server" />
            <asp:Button ID="UpdateSevaButton" CssClass="btn btn-custom" Text="Update Seva Charges" OnClick="UpdateSeva_Click" runat="server" />
        </div>

        <div>
            <h4 class="text-secondary mt-4"><i class="fa fa-table"></i> Seva List</h4>
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
