<%@ Page Title="Temple History" Language="C#" MasterPageFile="~/Mahajan.Master" AutoEventWireup="true" CodeBehind="m_TempleHistory.aspx.cs" Inherits="deul.WebForm14" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f9f9f9;
        }
        .container {
            width:80%;
            margin: 100px auto; /* 100px from the top and centered horizontally */
    max-width: 1200px; /* Ensures the container is centered and has a fixed width */
    padding: 40px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    position: relative; /* Keeps it relative for future absolute child elements */

        }
        .header {
            text-align: center;
            margin-bottom: 30px;
        }
        .header h1 {
            font-size: 2.5em;
            margin-bottom: 10px;
            color: #b45f04;
        }
        .header p {
            font-size: 1.2em;
            color: #666;
        }
        .content-section {
            margin-bottom: 20px;
        }
        .content-section h2 {
            font-size: 1.8em;
            margin-bottom: 15px;
            color: #b45f04;
        }
        .content-section p {
            text-align: justify;
            font-size: 1em;
        }
        .image-gallery {
            text-align: justify;
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 20px;
        }
        .image-gallery img {
            width: 100%;
            max-width: 300px;
            height: auto;
            border-radius: 8px;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
        }
        .footer {
            text-align: center;
            padding: 20px;
            margin-top: 30px;
            background-color: #333;
            color: #fff;
            border-radius: 8px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="header">
            <h1>History of the Temple</h1>
            <p>Discover the rich history and heritage of the sacred site.</p>
        </div>

        <div class="content-section">
            <h2>Ancient Origins</h2>
            <p>
                The temple has a history spanning centuries, originating in ancient times when the site was revered for its
                spiritual significance. According to legends, this sacred land is believed to be the birthplace of Lord Ram, one of the most venerated deities in Hinduism.
            </p>
        </div>

        <div class="content-section">
            <h2>Modern Revival</h2>
            <p>
                In recent decades, efforts have been made to rebuild and restore the temple to its former glory. The project has garnered support from devotees worldwide, reflecting its immense cultural and spiritual importance.
            </p>
        </div>

        <div class="content-section">
            <h2>Architectural Marvel</h2>
            <p>
                The temple architecture is a blend of traditional Indian craftsmanship and modern techniques. Carved with intricate details, it stands as a symbol of devotion, resilience, and the shared heritage of millions.
            </p>
        </div>

        <div class="image-gallery">
            <div>
                <div>
                    <br />
                  </div>
            </div>
            <img src="images/temple1.jpg" alt="Temple View 1" />
            <img src="images/temple2.jpeg" alt="Temple View 2" />
            <img src="images/temple3.jpeg" alt="Temple View 3" />
        </div>

        
    </div>
</asp:Content>

