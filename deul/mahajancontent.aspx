<%@ Page Title="" Language="C#" MasterPageFile="~/Mahajan.Master" AutoEventWireup="true" CodeBehind="mahajancontent.aspx.cs" Inherits="deul.WebForm8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="CSS/homepage5try2.css" rel="stylesheet" />
    <!-- Include jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

     <!--link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="datatables/css/dataTables.dataTables.min.css" rel="stylesheet" />

    <link href="fontawesome/fontawesome/css/all.css" rel="stylesheet" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="datatables/js/dataTables.min.js"></script>

    <!-- Include Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script src="Scripts/homepage.js"></script>
    <style>
       
        

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="containerbox">
        <div> 
            <br />
        </div>
        <!-- Bootstrap Carousel -->
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

    <!-- About Section -->
    <section class="about">
        <div class="container">
            <h2>About Demo Mandir</h2>
            <p>The Demo Mandir is a holy place where devotees come to seek blessings, find peace, and experience the beauty of ancient traditions. Our temple is a center of devotion, culture, and community service.</p>
            <a href="#" class="btn btn-primary">Learn More</a>
        </div>
    </section>

    <!-- Live Darshan Section -->
    <section class="live-darshan">
        <div class="container">
            <h2>Live Darshan</h2>
            <div class="video-responsive">
                <iframe src="https://www.youtube.com/embed/example" frameborder="0" allowfullscreen></iframe>
            </div>
            <p>Join our live streaming for daily darshan and special events.</p>
        </div>
    </section>

    <!-- Testimonials Section -->
    

    <!-- Donation Section -->
    <section class="donations">
        <div class="container">
            <h2>Support the Temple</h2>
            <p>Your donations help us maintain the temple and organize events for the community.</p>
            <a href="#" class="btn btn-success">Donate Now</a>
        </div>
    </section>

    <!-- Events Calendar Section -->
    <section class="events-calendar">
        <div class="container">
            <h2>Upcoming Events</h2>
            <div id="calendar"></div>
        </div>
    </section>

    <!-- Image Gallery -->
    <section class="gallery">
    <div class="container">
        <h2>Image Gallery</h2>
        <div class="row">
            <div class="col-md-4">
                <a href="images/26b7f546-4532-4cd8-a460-be5c8a7a1933.jpeg" data-lightbox="gallery">
                    <img src="images/26b7f546-4532-4cd8-a460-be5c8a7a1933.jpeg" class="img-fluid gallery-thumbnail" alt="Gallery Image 1">
                </a>
            </div>
            <div class="col-md-4">
                <a href="images/623305d2-9fee-48f2-9e1d-0e625c76367f.jpeg" data-lightbox="gallery">
                    <img src="images/623305d2-9fee-48f2-9e1d-0e625c76367f.jpeg" class="img-fluid gallery-thumbnail" alt="Gallery Image 2">
                </a>
            </div>
            <div class="col-md-4">
                <a href="images/82382413-bc28-4c79-b550-83ba3ebabc23.jpeg" data-lightbox="gallery">
                    <img src="images/82382413-bc28-4c79-b550-83ba3ebabc23.jpeg" class="img-fluid gallery-thumbnail" alt="Gallery Image 3">
                </a>
            </div>
        </div>
    </div>
</section>


    <!-- Google Map Section -->
    <section class="map">
        <div class="container">
            <h2>Our Location</h2>
            <div id="map-container" style="height: 400px;"></div>
        </div>
    </section>
    </div>
    
   <footer>
        <div class="container">
            <p>&copy; 2024 Shiv Mandir. All Rights Reserved.</p>
            <ul class="social-links">
                <li><a href="#"><i class="fa-brands fa-facebook"></i></a></li>
                <li><a href="#"><i class="fa-brands fa-instagram"></i></a></li>
                <li><a href="#"><i class="fa-brands fa-youtube"></i></a></li>
            </ul>
        </div>
    </footer>
</asp:Content>
