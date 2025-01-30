<%@ Page Title="Donation Page" Language="C#" MasterPageFile="~/Mahajan.Master" AutoEventWireup="true" CodeBehind="m_donation.aspx.cs" Inherits="deul.WebForm13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            padding: 30px;
            margin-top: 100px;
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-label {
            font-weight: bold;
        }
        .btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2 class="text-center">Donation Page</h2>
        <div class="form-group">
            <label for="donorname" class="form-label">Donor Name:</label>
            <asp:TextBox ID="donorname" CssClass="form-control" runat="server" Placeholder="Enter your name"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="donationamount" class="form-label">Donation Amount (₹):</label>
            <asp:TextBox ID="donationamount" CssClass="form-control" runat="server" Placeholder="Enter donation amount"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="email" class="form-label">Email:</label>
            <asp:TextBox ID="email" CssClass="form-control" runat="server" Placeholder="Enter your email"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="phone" class="form-label">Phone Number:</label>
            <asp:TextBox ID="phone" CssClass="form-control" runat="server" Placeholder="Enter your phone number"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="paymentmethod" class="form-label">Payment Method:</label>
            <asp:DropDownList ID="paymentmethod" CssClass="form-control" runat="server">
                <asp:ListItem Value="UPI" Text="UPI" />
                <asp:ListItem Value="Credit Card" Text="Credit Card" />
                <asp:ListItem Value="Net Banking" Text="Net Banking" />
            </asp:DropDownList>
        </div>
        <div class="text-center">
            <asp:Button ID="submitDonation" CssClass="btn" runat="server" Text="Proceed" OnClick="submitDonation_Click" />
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            // Add custom validation for donation amount
            $("#<%= donationamount.ClientID %>").on("input", function () {
                let value = $(this).val();
                if (isNaN(value) || value <= 0) {
                    alert("Please enter a valid donation amount.");
                    $(this).val('');
                }
            });

            // Simulate payment gateway validation
            $("#<%= submitDonation.ClientID %>").on("click", function (e) {
                let donorName = $("#<%= donorname.ClientID %>").val();
                let donationAmount = $("#<%= donationamount.ClientID %>").val();
                let email = $("#<%= email.ClientID %>").val();

                if (!donorName || !donationAmount || !email) {
                    alert("Please fill all fields before proceeding.");
                    return false; // Prevent form submission
                }

                alert("Redirecting to payment gateway...");
            });
        });
    </script>
</asp:Content>
