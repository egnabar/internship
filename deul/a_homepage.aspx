<%@ Page Title="" Language="C#" MasterPageFile="~/adminmaster.Master" AutoEventWireup="true" CodeBehind="a_homepage.aspx.cs" Inherits="deul.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/adminhp1.css" rel="stylesheet" />
    <style>
        /* General Styles */
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f7f8fa;
            margin: 0;
            padding: 0;
            line-height: 1.6;
            color: #333;
        }

        h2 {
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        .btn {
            background:linear-gradient(135deg, #778899, #DDA0DD);
            border-radius: 20px;
            transition: all 0.3s ease-in-out;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2)
        }

        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.4);
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        /* Quick Links Section */
        .quick-links {
            
            background:linear-gradient(135deg, #DCDCDC, #dfe6e9);
            color: white;
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 40px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
        }

        .quick-links .card {
            background: linear-gradient(135deg, #B0C4DE, #dfe6e9);
            border: none;
            border-radius: 15px;
            transition: all 0.3s ease-in-out;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .quick-links .card:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
        }

        .quick-links .card-title {
            color: #2d3436;
            font-weight: 600;
        }

        .quick-links .card-text {
            color: #636e72;
        }

        /* About Section */
        .about {
            color:#2c3e50;
            text-align: center;
            padding: 60px 20px;
            background: linear-gradient(135deg, #DCDCDC, #dfe6e9);;
            border-radius: 15px;
            margin-bottom: 40px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
        }

        .about a {
            background: linear-gradient(135deg, #778899, #663399);
            color: white;
            border: none;
            font-weight: bold;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3)
        }

        /* Testimonials Section */
        .testimonials {
            padding: 60px 20px;
            margin-bottom: 40px;
            background: linear-gradient(135deg, #DCDCDC, #dfe6e9);
            color:  #2c3e50;
            border-radius: 15px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
        }

        .testimonials .carousel-item p {
            font-style: italic;
            font-size: 18px;
        }

        /* Donation Section */
        .donations {
            text-align: center;
            padding: 60px 20px;
            background-color: #dfe6e9;
            border-radius: 15px;
            margin-bottom: 40px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3)
        }

        .donations a {
            background: linear-gradient(135deg, #778899, #663399);
            color: white;
            border: none;
            font-weight: bold;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .quick-links .row-cols-md-4 {
                row-cols-2 !important;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content">
        <div>
            
        </div>
        <!-- Quick Links Section -->
        <section class="quick-links">
            <div class="container">
                <h2>Quick Links</h2>
                <div class="row row-cols-1 row-cols-md-4 g-4">

                    <!-- Card 1: Add Gotra -->
                    <div class="col">
                        <div class="card h-100 text-center">
                            <div class="card-body">
                                <h5 class="card-title">Add Gotra</h5>
                                <br />
                                <a href="a_addgotra.aspx" class="btn btn-primary">Add Now</a>
                            </div>
                        </div>
                    </div>

                    <!-- Card 2: Add Kuldaivat -->
                    <div class="col">
                        <div class="card h-100 text-center">
                            <div class="card-body">
                                <h5 class="card-title">Add Kuldaivat</h5>
                                <br />
                                <a href="a_addkuldaivat.aspx" class="btn btn-primary">Add Now</a>
                            </div>
                        </div>
                    </div>

                    <!-- Card 3: Add Mutt -->
                    <div class="col">
                        <div class="card h-100 text-center">
                            <div class="card-body">
                                <h5 class="card-title">Add Mutt</h5>
                                <br />
                                <a href="a_addmutt.aspx" class="btn btn-primary">Add Now</a>
                            </div>
                        </div>
                    </div>

                    <!-- Card 4: Approve Mahajan -->
                    <div class="col">
                        <div class="card h-100 text-center">
                            <div class="card-body">
                                <h5 class="card-title">Approve Mahajan</h5>
                                <br />
                                <a href="a_mahajanapproval.aspx" class="btn btn-primary">Approve</a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>

        <!-- About Section -->
        <section class="about">
            <div class="container">
                <h2>Rooms</h2>
                <p>Check availability of rooms</p>
                <a href="#" class="btn btn-danger">Check Now</a>
            </div>
        </section>

        <!-- Testimonials Section -->
        <section class="testimonials">
            <div class="container">
                <h2>Upcoming Events</h2>
                <div id="testimonialCarousel" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <p>"Shravan Puja" - <strong>Date</strong></p>
                        </div>
                        <div class="carousel-item">
                            <p>"Navratrotsav" - <strong>Date</strong></p>
                        </div>
                        <div class="carousel-item">
                            <p>"Jatrotsav" - <strong>Date</strong></p>
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#testimonialCarousel" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#testimonialCarousel" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </section>

        <!-- Donation Section -->
        <section class="donations">
            <div class="container">
                <h2>Donations</h2>
                <p>Check donations and details of donors</p>
                <a href="#" class="btn btn-success">Check Now</a>
            </div>
        </section>

    </div>
</asp:Content>
