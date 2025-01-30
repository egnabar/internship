<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="deul.registration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link href="fontawesome/fontawesome/css/all.css" rel="stylesheet" />
    <style>
        body {
            background-color: #e0f7fa;
            font-family: 'Roboto', sans-serif;
        }
        .registration-form {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            margin: 60px auto;
            max-width: 900px;
            transition: transform 0.3s ease-in-out;
        }
        .registration-form:hover {
            transform: scale(1.02);
        }
        .registration-form .form-control {
            margin-bottom: 20px;
            border-radius: 30px;
            padding: 10px 20px;
        }
        .registration-form p {
            font-size: 26px;
            font-weight: 700;
            text-align: center;
            margin-bottom: 20px;
            color: #00796b;
        }
        .registration-form .btn {
            background-color: #00796b;
            color: #ffffff;
            font-size: 18px;
            border-radius: 30px;
            padding: 10px;
        }
        .registration-form .btn:hover {
            background-color: #004d40;
            color: #ffffff;
        }
        .form-control::placeholder {
            color: #9e9e9e;
            opacity: 1;
        }
        .form-control:focus {
            border-color: #00796b;
            box-shadow: 0 0 5px rgba(0, 121, 107, 0.5);
        }
        .password-toggle {
            position: relative;
        }
        .password-toggle .toggle-password {
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
        }
        .password-toggle .toggle-password i {
            color: #00796b;
        }
        .field-hidden {
            display: none;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="registration-form">
            <p>Registration</p>
             <div class="form-row">
                <div class="form-group col-md-4">
                    <asp:Label ID="Label1" runat="server" CssClass="text-danger field-hidden" Text="username already exists"></asp:Label>
                    <asp:TextBox ID="username" runat="server" CssClass="form-control " placeholder="Username" required OnTextChanged="username_TextChanged"></asp:TextBox>
                    
                    <asp:TextBox ID="cuni" runat="server" CssClass="form-control field-hidden" placeholder="unique"  OnTextChanged="username_TextChanged"></asp:TextBox>
                </div>
                 <div class="form-group col-md-4">
                    <asp:Button ID="check" runat="server" CssClass="btn btn-primary btn-block" Text="check" OnClick="submit_TextChanged" />
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6 password-toggle">
                    <asp:TextBox ID="password" runat="server" CssClass="form-control" placeholder="Password" required TextMode="Password"></asp:TextBox>
                    <span class="toggle-password"><i class="fas fa-eye"></i></span>
                </div>
                <div class="form-group col-md-6 password-toggle">
                    <asp:TextBox ID="confirmPassword" runat="server" CssClass="form-control" placeholder="Confirm Password" required TextMode="Password"></asp:TextBox>
                    <span class="toggle-password"><i class="fas fa-eye"></i></span>
                </div>
            </div>
           
            <div class="form-row">
                <div class="form-group col-md-4">
                    <asp:TextBox ID="fname" runat="server" CssClass="form-control" placeholder="First Name" required></asp:TextBox>
                </div>
                <div class="form-group col-md-4">
                    <asp:TextBox ID="mname" runat="server" CssClass="form-control" placeholder="Middle Name" required OnTextChanged="mname_TextChanged"></asp:TextBox>
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
                    <asp:TextBox ID="dob" runat="server" CssClass="form-control" placeholder="Date of Birth" type="date" required></asp:TextBox>
                </div>
                <div class="form-group col-md-4">
                    <asp:TextBox ID="email" runat="server" CssClass="form-control" placeholder="Email" type="email" required></asp:TextBox>
                </div>
            </div>
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
                    <asp:TextBox ID="add3" runat="server" CssClass="form-control" placeholder="Address 3" required></asp:TextBox>
                </div>
                <div class="form-group col-md-4">
                    <asp:TextBox ID="add4" runat="server" CssClass="form-control" placeholder="Address 4" required></asp:TextBox>
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
            <div class="form-row">
                <div class="form-group col-md-4">
                    <asp:TextBox ID="panno" runat="server" CssClass="form-control" placeholder="PAN Number" required></asp:TextBox>
                </div>
                <div class="form-group col-md-4">
                    <asp:FileUpload ID="panpic" runat="server" CssClass="form-control-file" required Enabled="false" />
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-4">
                    <asp:TextBox ID="adharno" runat="server" CssClass="form-control" placeholder="Aadhaar Number" required></asp:TextBox>
                </div>
            
                <div class="form-group col-md-4">
                    <asp:FileUpload ID="adharpic" runat="server" CssClass="form-control-file" required Enabled="false" />
                </div>
            </div>
           
            <asp:Button ID="submit" runat="server" CssClass="btn btn-primary btn-block" Text="Submit" OnClick="submit1_TextChanged" />
        </div>
    </form>

    <!-- jQuery, Popper.js, Bootstrap JS, and Font Awesome -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>

    <script>
        $(document).ready(function () {
            // Toggle visibility of password
            $('.toggle-password').on('click', function () {
                let input = $(this).siblings('input');
                let icon = $(this).find('i');
                if (input.attr('type') === 'password') {
                    input.attr('type', 'text');
                    icon.removeClass('fa-eye').addClass('fa-eye-slash');
                } else {
                    input.attr('type', 'password');
                    icon.removeClass('fa-eye-slash').addClass('fa-eye');
                }
            });

            // Disable file upload fields initially
            $(document).ready(function () {
                // Initial check on page load
                let ucheck = $('#cuni').val();
                let isDisabled = ucheck === 'false';
                isDisabled = false;
                toggledis(false);
            });
                $('#check').on('click', function () {
                    ucheck = $('#cuni').val();
                    isDisabled = ucheck === 'true';
                    //alert(isDisabled);
                    toggledis(isDisabled);
                });

                function toggledis(disable) {
                    $('#panpic, #adharpic, #password, #confirmPassword, #fname, #mname, #lname, #phoneno, #dob, #email, #add1, #add2, #add3, #add4, #kuldaivat, #mutt, #gotra, #panno, #adharno').each(function () {
                        if (disable) {
                            
                            $(this).prop('disabled', false).addClass('disabled');

                        } else {
                            $(this).prop('disabled', true).removeClass('disabled');
                        }
                    });
                }
            



            //if (ucheck === 'true') {
            // Simulate validation check (replace with actual validation logic)
            // Assuming validation passed if username is longer than 3 characters
            // $('#panpic, #adharpic, #fname, #mname, #lname, #phoneno, #dob, #email, #add1, #add2, #add3, #kuldaivat, #mutt, #gotra, #panno, #adharno').each(function () { $(this).prop('disabled', false).removeClass('disabled'); }
            //} else {
            //   $('#panpic, #adharpic, #fname, #mname, #lname, #phoneno, #dob, #email, #add1, #add2, #add3, #kuldaivat, #mutt, #gotra, #panno, #adharno').prop('disabled', true);
            //}


            // Toggle visibility of additional address fields
            $('#add2').on('input', function () {
                if ($(this).val()) {
                    $('#add3').slideDown();
                } else {
                    $('#add3').slideUp();
                }
            });

            // Check if passwords match
            $('#confirmPassword').on('input', function () {
                var password = $('#password').val();
                var confirmPassword = $(this).val();
                if (password !== confirmPassword) {
                    $(this).addClass('is-invalid');
                } else {
                    $(this).removeClass('is-invalid');
                }
            });

            // Submit button click event
          /*  $('#submit').on('click', function (e) {
                e.preventDefault();
                var isValid = true;

                // Basic validation checks
                $('.form-control').each(function () {
                    if ($(this).val() === '' && $(this).attr('required')) {
                        $(this).addClass('is-invalid');
                        isValid = false;
                    } else {
                        $(this).removeClass('is-invalid');
                    }
                });

                if (isValid) {
                    alert('Form submitted successfully!');
                    //Uncomment the next line to actually submit the form in production
                    $('#form1').submit();
                }
            });*/

            // Optional: Fade in form on page load
            $('.registration-form').hide().fadeIn(1000);
        });
    </script>
</body>
</html>
