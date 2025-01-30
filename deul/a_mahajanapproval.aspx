<%@ Page Title="" Language="C#" MasterPageFile="~/adminmaster.Master" AutoEventWireup="true" CodeBehind="a_mahajanapproval.aspx.cs" Inherits="deul.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet" />
    <style>
         body {
    background-color: #f8f9fa;
}

.container {
    background-color: #ffffff;
    padding: 30px;
    margin-top: 130px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
}

.btn-action {
    margin: 10px;
    font-size: 18px;
}

.btn-accept {
    background-color: #28a745;
    color: white;
}

.btn-reject {
    background-color: #dc3545;
    color: white;
}

.btn-hold {
    background-color: #ffc107;
    color: white;
}

/* Reduced space around the form groups */
.form-group {
    margin-bottom: 1rem; /* Adjust margin for compact layout */
}

/* Reduced spacing between rows */
.form-row {
    margin-bottom: 1rem; /* Compact row spacing */
}

/* Styling for textboxes */
.form-control {
    border-radius: 0.25rem;
    padding-top: 0.5rem; /* Ensure proper alignment with dynamic labels */
    padding-bottom: 0.5rem;
}

/* Dynamic label styling */
.dynamic-label-group {
    position: relative;
}

.dynamic-label {
    position: absolute;
    top: -10px; /* Reduced spacing between label and input */
    left: 10px;
    font-size: 14px; /* Increased label size */
    font-weight: bold; /* Bold text for better visibility */
    color: #495057; /* Darker color for better readability */
    transition: all 0.3s ease;
}

/* File input styling */
.form-control-file {
    border-radius: 0.25rem;
}

.text-muted {
    font-size: 14px;
}

/* Modal styling */
.modal-header,
.modal-body {
    text-align: center;
}

.modal-footer {
    text-align: right;
}

/* Responsive view adjustments */
@media (max-width: 768px) {
    .container {
        margin-top: 50px;
        padding: 20px;
    }

    .btn-action {
        font-size: 16px;
    }
}
     /* Styling for dropdown */
        .form-select {
    margin: 0 auto; /* Center horizontally */
    display: block; /* Ensures it behaves as a block element */
    font-size: 16px;
    padding: 8px;
    border-radius: 5px;
    border: 1px solid #ced4da;
    width: 150px; /* Adjust width for better visibility */
}

.container {
    text-align: center; /* Centers the dropdown inside the container */
}

        /* Modal styling */
        .modal-header,
        .modal-body {
            text-align: center;
        }

        .modal-footer {
            text-align: right;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <asp:HyperLink ID="backLink" runat="server" NavigateUrl="a_homepage.aspx" CssClass="btn btn-light btn-sm position-relative" Style="right: -45%;">
            <i class="fa fa-arrow-left"></i> Back
        </asp:HyperLink>
        <h2>New Registration</h2>

        <!-- User Details Form -->
        <div class="form-row">
            <div class="form-group col-md-4">
                <asp:TextBox ID="fname" runat="server" CssClass="form-control" placeholder="First Name" required></asp:TextBox>
            </div>
            <div class="form-group col-md-4">
                <asp:TextBox ID="mname" runat="server" CssClass="form-control" placeholder="Middle Name" required></asp:TextBox>
            </div>
            <div class="form-group col-md-4">
                <asp:TextBox ID="lname" runat="server" CssClass="form-control" placeholder="Last Name" required></asp:TextBox>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-md-4">
                <asp:TextBox ID="phoneno" runat="server" CssClass="form-control" placeholder="Phone Number" required></asp:TextBox>
            </div>
            <div class="form-group col-md-4">
                <asp:TextBox ID="dob" runat="server" CssClass="form-control" placeholder="Date of Birth" TextMode="Date" required></asp:TextBox>
            </div>
            <div class="form-group col-md-4">
                <asp:TextBox ID="email" runat="server" CssClass="form-control" placeholder="Email" TextMode="Email" required></asp:TextBox>
            </div>
        </div>

        <!-- Address Fields -->
        <div class="form-row">
            <div class="form-group col-md-4">
                <asp:TextBox ID="add1" runat="server" CssClass="form-control" placeholder="Address 1" required></asp:TextBox>
            </div>
            <div class="form-group col-md-4">
                <asp:TextBox ID="add2" runat="server" CssClass="form-control" placeholder="Address 2" required></asp:TextBox>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-md-4">
                <asp:TextBox ID="kuldaivat" runat="server" CssClass="form-control" placeholder="Kuldaivat" required></asp:TextBox>
            </div>
            <div class="form-group col-md-4">
                <asp:TextBox ID="mutt" runat="server" CssClass="form-control" placeholder="Mutt"></asp:TextBox>
            </div>
            <div class="form-group col-md-4">
                <asp:TextBox ID="gotra" runat="server" CssClass="form-control" placeholder="Gotra"></asp:TextBox>
            </div>
        </div>

        <!-- PAN and Aadhaar -->
        <div class="form-row">
            <div class="form-group col-md-4">
                <asp:TextBox ID="panno" runat="server" CssClass="form-control" placeholder="PAN Number" required></asp:TextBox>
            </div>
            <div class="form-group col-md-4">
                <asp:HyperLink ID="panpicLink" runat="server" CssClass="btn btn-info btn-block text-white" Text="View PAN Image" Target="_blank" />
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-md-4">
                <asp:TextBox ID="adharno" runat="server" CssClass="form-control" placeholder="Aadhaar Number" required></asp:TextBox>
            </div>
            <div class="form-group col-md-4">
                <asp:HyperLink ID="adharpicLink" runat="server" CssClass="btn btn-info btn-block text-white" Text="View Aadhaar Image" Target="_blank" />
            </div>
        </div>

        <!-- Dropdown -->
        <div class="form-group">
            <asp:DropDownList ID="mahajanDropdown" runat="server" CssClass="form-select">
                <asp:ListItem Value="" Disabled Selected>Type</asp:ListItem>
                <asp:ListItem Value="mahajan">Mahajan</asp:ListItem>
                <asp:ListItem Value="non-mahajan">Non-Mahajan</asp:ListItem>
            </asp:DropDownList>
        </div>

        <!-- Action Buttons -->
        <div class="text-center mb-4">
            <asp:Button ID="btnAccept" runat="server" Text="Accept" CssClass="btn btn-action btn-accept" OnClick="AcceptButton_Click" />
            <asp:Button ID="btnReject" runat="server" Text="Reject" CssClass="btn btn-action btn-reject" OnClick="RejectButton_Click" />
            <asp:Button ID="btnHold" runat="server" Text="Hold" CssClass="btn btn-action btn-hold" OnClick="HoldButton_Click" />
        </div>

        <!-- Confirmation Modal -->
        <div class="modal fade" id="statusModal" tabindex="-1" role="dialog" aria-labelledby="statusModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <asp:Label ID="lblModalTitle" runat="server" CssClass="modal-title" Text="Change User Status"></asp:Label>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to <asp:Label ID="lblActionText" runat="server"></asp:Label> this user?
                        <br />
                        Selected Category: <asp:Label ID="lblSelectedCategory" runat="server"></asp:Label>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnModalCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" />
                        <asp:Button ID="btnModalConfirm" runat="server" Text="Confirm" CssClass="btn btn-primary" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
