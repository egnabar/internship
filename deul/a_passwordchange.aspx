<%@ Page Title="" Language="C#" MasterPageFile="~/adminmaster.Master" AutoEventWireup="true" CodeBehind="a_passwordchange.aspx.cs" Inherits="deul.WebForm26" %>
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
        .password-header {
            text-align: center;
            margin-bottom: 20px;
        }
        .password-header h2 {
            font-size: 1.8rem;
            color: #007bff;
        }
        .password-header .fa-lock {
            font-size: 3rem; /* Reduced size */
        }
        .password-section {
            margin-bottom: 20px;
        }
        .password-section label {
            font-weight: bold;
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
        .back-btn {
            font-size: 0.8rem; /* Reduced size */
            padding: 5px 10px; /* Adjusted padding */
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <a href="a_homepage.aspx" class="btn btn-light btn-sm back-btn position-relative" style="right:-85%;">
            <i class="fa fa-arrow-left"></i> Back
        </a>
        <div class="password-header">
            <i class="fas fa-lock text-primary"></i>
            <h2>Change Password</h2>
        </div>
        <asp:Label ID="lblMessage" runat="server" CssClass="text-danger d-block text-center"></asp:Label>
        <asp:Label ID="lblSuccess" runat="server" CssClass="text-success d-block text-center"></asp:Label>
        
        <div class="password-section">
            <label>Old Password</label>
            <asp:TextBox ID="txtOldPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter your old password"></asp:TextBox>
        </div>

        <div class="password-section">
            <label>New Password</label>
            <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter your new password"></asp:TextBox>
        </div>

        <div class="password-section">
            <label>Confirm New Password</label>
            <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Confirm your new password"></asp:TextBox>
        </div>

        <div class="text-center mt-4">
            <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" CssClass="btn" OnClientClick="return validatePasswords()" OnClick="btnChangePassword_Click" />
        </div>

        <div class="footer">
            <a href="ChangePassword.aspx" class="btn-link">
                <i class="fas fa-key"></i> Forgot Password?
            </a>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        function validatePasswords() {
            const oldPassword = $('#<%= txtOldPassword.ClientID %>').val();
            const newPassword = $('#<%= txtNewPassword.ClientID %>').val();
            const confirmPassword = $('#<%= txtConfirmPassword.ClientID %>').val();

            if (!oldPassword) {
                alert('Please enter your old password.');
                return false;
            }

            if (!newPassword) {
                alert('Please enter a new password.');
                return false;
            }

            if (newPassword.length < 5) {
                alert('New password must be at least 5 characters.');
                return false;
            }

            

            return true;
        }
    </script>
</asp:Content>
