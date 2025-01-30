<%@ Page Title="" Language="C#" MasterPageFile="~/adminmaster.Master" AutoEventWireup="true" CodeBehind="a_profile.aspx.cs" Inherits="deul.WebForm25" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f9f9f9;
            font-family: 'Arial', sans-serif;
        }
        .container {
            max-width: 600px;
            margin: 100px auto;
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        .profile-header {
            text-align: center;
            margin-bottom: 20px;
        }
        .profile-header h2 {
            font-size: 2rem;
            color: #007bff;
        }
        .profile-section {
            margin-bottom: 20px;
        }
        .profile-section label {
            font-weight: bold;
        }
        .btn-link {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }
        .btn-link:hover {
            text-decoration: underline;
        }
        .footer {
            text-align: center;
            margin-top: 20px;
            font-size: 0.9rem;
            color: #666;
        }
        .profile{
            font-size:20px;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <a href="a_homepage.aspx" class="btn btn-light btn-sm position-relative" style="right:-85%;">
            <i class="fa fa-arrow-left"></i> Back
        </a>
        <div class="profile-header">

            <i class="fas fa-user-circle fa-5x text-primary "></i>
            <asp:Label ID="Uname" runat="server" CssClass="profile form-control"></asp:Label>

        </div>
        <div class="profile-section">
            <label>ID :</label>
            <asp:Label ID="userid" runat="server" CssClass="form-control"></asp:Label>
        </div>
        
        <div class="profile-section">
            <label>Type:</label>
            <asp:Label ID="utype" runat="server" CssClass="form-control"></asp:Label>
        </div>
        
        <div class="profile-section">
           
        </div>

        <div class="text-center mt-4">
            <a href="a_passwordchange.aspx" class="btn-link">
                <i class="fas fa-key"></i> Change Password
            </a>
        </div>

        
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
