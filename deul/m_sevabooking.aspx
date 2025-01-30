<%@ Page Title="" Language="C#" MasterPageFile="~/Mahajan.Master" AutoEventWireup="true" CodeBehind="m_sevabooking.aspx.cs" Inherits="deul.WebForm20" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        <style>
        body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            background-color: #f9f9f9;
            color: #333;
        }
        .container {
            max-width: 800px;
            margin: 100px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        .header {
            text-align: center;
            margin-bottom: 30px;
        }
        .header h1 {
            font-size: 2em;
            color: #b45f04;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
        }
        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
        }
        .note {
            font-size: 0.9em;
            color: #555;
            margin-top: 5px;
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
        .footer {
            text-align: center;
            margin-top: 20px;
            font-size: 0.9em;
            color: #666;
        }
        .note{
            text-align:center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <a href="a_homepage.aspx" class="btn btn-light btn-sm position-relative" style="right:-85%;">
            <i class="fa fa-arrow-left"></i> Back
        </a>
        <div class="header">
            <h1>Seva Booking Booking</h1>
            
        </div>

        <asp:Panel ID="bookingForm" runat="server">
            <div class="form-group">
                <label class="form-label" for="name">Full Name:</label>
                <asp:TextBox ID="name" CssClass="form-control" runat="server" Placeholder="Enter your full name"></asp:TextBox>
            </div>
           
            <div class="form-group">
                <label class="form-label" for="phone">Phone Number:</label>
                <asp:TextBox ID="phone" CssClass="form-control" runat="server" Placeholder="Enter your phone number"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label class="form-label" for="checkInDate"> Seva Date:</label>
                <asp:TextBox ID="checkInDate" CssClass="form-control" runat="server" type="date" Placeholder="Select check-in date"></asp:TextBox>
            </div>
            <div class="form-group">
                <label class="form-label" for="floorPreference">Select Seva:</label>
                <asp:DropDownList ID="floorPreference" CssClass="form-control" runat="server">
                    <asp:ListItem Value="" Text="Seva" />
                    <asp:ListItem Value="Abhishek" Text="Abhishek" />
                    <asp:ListItem Value="Shatachandi" Text="Shatachandi" />
                    <asp:ListItem Value="Laghurudra" Text="Laghurudra" />
                    <asp:ListItem Value="Maharudra" Text="Maharudra" />
                </asp:DropDownList>
            </div>
            <br />
            <div class="text-center">
                <asp:Button ID="submitBooking" CssClass="btn" runat="server" Text="Check Availability" OnClick="submitBooking_Click" />
            </div>
            <div class="note"  id="stayNote">Availability will be informed later</div>
        </asp:Panel>

       
    </div>

</asp:Content>
