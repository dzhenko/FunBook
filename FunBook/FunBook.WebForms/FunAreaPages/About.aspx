<%@ Page Title="" Language="C#" MasterPageFile="~/FunAreaPages/FunMasterPage.master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="FunBook.WebForms.FunAreaPages.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderFunArea" runat="server">
    <div class="about-funbook text-center">
        <h2>About Funbook</h2>
        <hr />
        <p>
            Funbook is a teamwork assignment from the academy of Telerik 2014.
            It is a place where everyone can see, create or comment on jokes, pictures or videos.
        </p>
        <hr />
        <h2>Made by </h2>
        <hr />

        <div class="creators-carousel">
            <div id="myCarousel" class="carousel slide" data-interval="3000" data-ride="carousel">
                <!-- Carousel indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                    <li data-target="#myCarousel" data-slide-to="3"></li>
                    <li data-target="#myCarousel" data-slide-to="4"></li>
                </ol>
                <!-- Carousel items -->
                <div class="carousel-inner">
                    <div class="active item">
                        <img class="carosel-image" src="" />
                        <div class="carousel-caption">
                            <h3>Elena Picin</h3>
                        </div>
                    </div>
                    <div class="item">
                        <div class="carousel-caption">
                            <h3>Diana Pesheva</h3>
                        </div>
                    </div>
                    <div class="item">
                        <div class="carousel-caption">
                            <h3>Dzhenko Penev</h3>
                        </div>
                    </div>
                    <div class="item">
                        <div class="carousel-caption">
                            <h3>Viktor Klisurski</h3>
                        </div>
                    </div>
                    <div class="item">
                        <div class="carousel-caption">
                            <h3>Viktor Dakov</h3>
                        </div>
                    </div>
                </div>
                <!-- Carousel nav -->
                <a class="carousel-control left" href="#myCarousel" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                </a>
                <a class="carousel-control right" href="#myCarousel" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                </a>
            </div>
        </div>

    </div>
</asp:Content>
