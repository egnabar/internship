<%@ Page Title="" Language="C#" MasterPageFile="~/adminmaster.Master" AutoEventWireup="true" CodeBehind="a_addmutt.aspx.cs" Inherits="deul.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .container {
            padding: 30px;
            margin-top: 100px;
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            font-weight: bold;
            color: #2c3e50;
        }

        .btn-custom {
            background-color: #007bff;
            color: #fff;
            border-radius: 5px;
        }

        .btn-custom:hover {
            background-color: #0056b3;
            color: #fff;
        }

        .form-group label {
            font-weight: bold;
        }

        .table {
            margin-top: 20px;
        }

        .fa {
            margin-right: 5px;
        }
        .btn-back {
    font-weight: bold;          /* Bold text */
    font-size: 20px;            /* Slightly larger font size */
    background-color: #007bff;  /* Bright blue background */
    color: #ffffff;             /* White text for contrast */
    border: none;               /* No border */
    padding: 10px 15px;         /* Larger padding for better visibility */
    border-radius: 8px;         /* Rounded corners */
    text-decoration: none;      /* Remove underline */
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2); /* Shadow for depth */
    transition: background-color 0.3s ease, transform 0.2s ease; /* Smooth hover effects */
}

.btn-back:hover {
    background-color: #0056b3;  /* Darker blue on hover */
    transform: translateY(-2px); /* Slight lift effect */
    text-decoration: none;      /* Ensure no underline */
    box-shadow: 0px 6px 8px rgba(0, 0, 0, 0.3); /* Slightly larger shadow on hover */
}

.btn-back:focus {
    outline: none;              /* Remove focus outline */
    box-shadow: 0px 0px 5px #0056b3; /* Focused state with glowing border */
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container ">
        <!-- Back Button -->
        <a href="a_homepage.aspx" class="btn btn-light btn-sm position-absolute" style=" right:20%;">
            <i class="fa fa-arrow-left"></i> Back
        </a>

        <h2><i class="fa fa-leaf"></i> Mutt Management</h2>
        <div class="mt-4">
            <h4 class="text-secondary"><i class="fa fa-plus-circle"></i> Add New Mutt</h4>
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="Mutt Name" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="mname" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:Button ID="ADD" runat="server" Text="Add Mutt" CssClass="btn btn-custom" OnClick="ADD_Click" />
            <div>
                <h4 class="text-secondary mt-4"><i class="fa fa-table"></i> Mutt List</h4>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="True" CssClass="table table-bordered table-striped"></asp:GridView>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</asp:Content>
