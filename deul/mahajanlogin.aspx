<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mahajanlogin.aspx.cs" Inherits="deul.mahajanlogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>mahajan login</title>
    <link href="css/login.css" rel="stylesheet" />
    <style>
        body{
            background-color:Gainsboro;
        }
    </style>
    
</head>
<body>
        <section>
        <div class="box">
            <div class="square" styles="--i:0;"></div>
            <div class="square" styles="--i:1;"></div>
            <div class="square" styles="--i:2;"></div>
            <div class="square" styles="--i:3;"></div>
            <div class="square" styles="--i:4;"></div>
            <div class="container">
                <div class="form">
                    <h2>login form</h2>
                    <form method="post"  runat="server">
                        <div class="inputbox">
                            
                            <asp:TextBox ID="username" placeholder="username" runat="server" OnTextChanged="username_TextChanged"></asp:TextBox>
                        </div>
                        <div class="inputbox">
                            
                            <asp:TextBox ID="password" placeholder="password" runat="server" TextMode="Password" OnTextChanged="password_TextChanged"></asp:TextBox>
                        </div>
                        <div class="inputbox">
                            <asp:Button ID="submit" runat="server" Text="login" OnClick="submit_Click" />
                        </div>
                        <p class="forget"> Forgot Password ?<a href="#">Click Here</a></p>
                        <p class="forget">Don't have an account ? <a href="registration.aspx">Sign up</a></p>
                    </form>
                </div>
               
            </div>
        </div>
    </section>
</body>
</html>
