<%@ Page Title="Room Booking" Language="C#" MasterPageFile="~/Mahajan.Master" AutoEventWireup="true" CodeBehind="RoomBooking.aspx.cs" Inherits="deul.RoomBooking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
        .btn {
            background-color: #007bff;
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
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="header">
            <h1>Room Booking</h1>
            <p>Book your stay at our facility with ease!</p>
        </div>

        <asp:Panel ID="bookingForm" runat="server">
            <div class="form-group">
                <label class="form-label" for="name">Full Name:</label>
                <asp:TextBox ID="name" CssClass="form-control" runat="server" Placeholder="Enter your full name"></asp:TextBox>
            </div>

            <div class="form-group">
                <label class="form-label" for="email">Email:</label>
                <asp:TextBox ID="email" CssClass="form-control" runat="server" Placeholder="Enter your email"></asp:TextBox>
            </div>

            <div class="form-group">
                <label class="form-label" for="phone">Phone Number:</label>
                <asp:TextBox ID="phone" CssClass="form-control" runat="server" Placeholder="Enter your phone number"></asp:TextBox>
            </div>

            <div class="form-group">
                <label class="form-label" for="checkInDate">Check-In Date:</label>
                <asp:TextBox ID="checkInDate" CssClass="form-control" runat="server" Placeholder="Select check-in date"></asp:TextBox>
            </div>

            <div class="form-group">
                <label class="form-label" for="checkOutDate">Check-Out Date:</label>
                <asp:TextBox ID="checkOutDate" CssClass="form-control" runat="server" Placeholder="Select check-out date"></asp:TextBox>
            </div>

            <div class="form-group">
                <label class="form-label" for="roomType">Room Type:</label>
                <asp:DropDownList ID="roomType" CssClass="form-control" runat="server">
                    <asp:ListItem Value="Single" Text="Single Room" />
                    <asp:ListItem Value="Double" Text="Double Room" />
                    <asp:ListItem Value="Suite" Text="Suite" />
                </asp:DropDownList>
            </div>

            <div class="text-center">
                <asp:Button ID="submitBooking" CssClass="btn" runat="server" Text="Book Now" OnClick="submitBooking_Click" />
            </div>
        </asp:Panel>

        <div class="footer">
            <p>© 2024 Room Booking | All rights reserved</p>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            // Add date picker functionality (using a jQuery plugin or your own logic)
            $("#<%= checkInDate.ClientID %>, #<%= checkOutDate.ClientID %>").attr("type", "date");

            // Basic validation for phone number
            $("#<%= phone.ClientID %>").on("input", function () {
                let value = $(this).val();
                if (!/^\d*$/.test(value)) {
                    alert("Please enter only numeric values for the phone number.");
                    $(this).val('');
                }
            });

            // Handle form submission logic
            $("#<%= submitBooking.ClientID %>").on("click", function (e) {
                let name = $("#<%= name.ClientID %>").val();
                let email = $("#<%= email.ClientID %>").val();
                let checkInDate = $("#<%= checkInDate.ClientID %>").val();
                let checkOutDate = $("#<%= checkOutDate.ClientID %>").val();

                if (!name || !email || !checkInDate || !checkOutDate) {
                    alert("Please fill in all required fields.");
                    return false;
                }

                alert("Your booking is being processed.");
            });
        });
    </script>
</asp:Content>
