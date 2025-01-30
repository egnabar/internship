<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="a_login.aspx.cs" Inherits="deul.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/login2.css" rel="stylesheet" />
    <title> admin login </title>
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
                    </form>
                </div>
               
            </div>
        </div>
    </section>
</body>
</html>
