<%@ Page Title="" Language="C#" MasterPageFile="~/Mahajan.Master" AutoEventWireup="true" CodeBehind="m_homepage.aspx.cs" Inherits="deul.WebForm17" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title> home page </title>
    <style>
         
        /**/body {
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #333;
        }
        h2 {
            color: #2c3e50;
            font-weight: bold;
            text-transform: uppercase;
            margin-bottom: 20px;
        }

        p {
            font-size: 1.1em;
            color: #555;
        }

        .btn {
            background-color: #3498db;
            color: white;
            padding: 12px 25px;
            text-decoration: none;
            border-radius: 25px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #2980b9;
        }

        .section {
            padding: 50px 0;
            text-align: center;
            border-bottom: 1px solid #e0e0e0;
        }

        .section:nth-child(even) {
            background-color: #f0f4f8;
        }

        .carousel img {
            width: 100%;
            height: 450px;
            object-fit: cover;
        }

        .gallery-preview img {
            width: 100%;
            height: 300px;
            object-fit: cover;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .map-preview iframe {
            width: 80%;
            height: 350px;
            border: none;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .video-responsive iframe {
            width: 80%;
            height: 500px; /* Increased height for larger video */
            border: none;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        footer {
            background-color: #34495e;
            color: white;
            text-align: center;
            padding: 20px 0;
            margin-top: 40px;
        }
    </style>

    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div>
            <br />
            <br />
            <br />
        </div>
        <!-- Carousel Section -->
        <div class="section">
            <h2>Welcome to Demo Mandir</h2>
            <p>Explore the spiritual beauty and history of our temple.</p>
            <div id="templeCarousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="images/9b539aae-25f9-48c1-8e1c-141b0f7338cb.jpeg" class="d-block w-100" alt="Temple Image 1">
                    </div>
                    <div class="carousel-item">
                        <img src="images/Beautiful%20Ancient%20Hindu%20Temple.jpeg" class="d-block w-100" alt="Temple Image 2">
                    </div>
                    <div class="carousel-item">
                        <img src="images/Kingdom,%20Kumaran%20Handy.jpeg" class="d-block w-100" alt="Temple Image 3">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#templeCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#templeCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>

        <!-- About Section -->
        <div class="section">
            <h2>About the Temple</h2>
            <p>Discover the rich history and cultural significance of the Demo Mandir.</p>
            <a href="m_TempleHistory.aspx" class="btn">Read More</a>
        </div>

        <!-- Donations Section -->
        <div class="section">
            <h2>Support the Temple</h2>
            <p>Your contributions help us maintain the temple and organize events for the community.</p>
            <a href="m_donation.aspx" class="btn">Donate Now</a>
        </div>

        <!-- Gallery Section -->
        <div class="section gallery-preview">
            <h2>Temple Gallery</h2>
            <div class="row">
                <div class="col-md-4">
                    <img src="images/26b7f546-4532-4cd8-a460-be5c8a7a1933.jpeg" alt="Gallery Image 1">
                </div>
                <div class="col-md-4">
                    <img src="images/623305d2-9fee-48f2-9e1d-0e625c76367f.jpeg" alt="Gallery Image 2">
                </div>
                <div class="col-md-4">
                    <img src="images/82382413-bc28-4c79-b550-83ba3ebabc23.jpeg" alt="Gallery Image 3">
                </div>
            </div>
            <a href="Gallery.aspx" class="btn mt-3">View Full Gallery</a>
        </div>

        <!-- Live Darshan Section -->
        <div class="section">
            <h2>Live Darshan</h2>
            <div class="video-responsive">
                <iframe src="https://www.youtube.com/embed/example" frameborder="0" allowfullscreen></iframe>
            </div>
            <p>Join our live streaming for daily darshan and special events.</p>
        </div>

        <!-- Google Maps Section -->
        <div class="section map-preview">
            <h2>Visit Us</h2>
            <p>Find our temple on Google Maps:</p>
            <iframe 
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3153.8354345098735!2d144.9559262158068!3d-37.8172099797517!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6ad642af0f11fd81%3A0xf5778f3315b8c3ab!2sTemple%20Location!5e0!3m2!1sen!2sus!4v1690912745500!5m2!1sen!2sus"
                allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
            </iframe>
            <br />
            <a href="https://www.google.com/maps?q=temple+location" class="btn mt-3">Open in Google Maps</a>
        </div>
    </div>
</asp:Content>
