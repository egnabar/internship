<%@ Page Title="Profile Page" Language="C#" MasterPageFile="~/Mahajan.Master" AutoEventWireup="true" CodeBehind="m_Profile.aspx.cs" Inherits="deul.WebForm16" %>
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
        .btn {
            background-color: #4682B4;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <a href="m_homepage.aspx" class="btn btn-light btn-sm position-relative" style="right:-85%;">
            <i class="fa fa-arrow-left"></i> Back
        </a>
        <div class="profile-header">

            <i class="fas fa-user-circle fa-5x text-primary "></i>
            <asp:Label ID="Uname" runat="server" CssClass="profile form-control"></asp:Label>

        </div>
        <div class="profile-section">
            <label>ID :</label>
            <asp:Label ID="mahajanid" runat="server" CssClass="form-control"></asp:Label>
        </div>
        <div class="profile-section">
            <label>Full Name:</label>
            <asp:Label ID="name" runat="server" CssClass="form-control"></asp:Label>
        </div>
        <div class="profile-section">
            <label>Email:</label>
            <asp:Label ID="email" runat="server" CssClass="form-control"></asp:Label>
        </div>
        <div class="profile-section">
            <label>Phone Number:</label>
            <asp:Label ID="phoneno" runat="server" CssClass="form-control"></asp:Label>
        </div>
        <div class="profile-section">
           
        </div>

        <div class="text-center mt-4">
            <a href="m_passwordchange.aspx" class="btn-link">
                <i class="fas fa-key"></i> Change Password
            </a>
        </div>

        
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
