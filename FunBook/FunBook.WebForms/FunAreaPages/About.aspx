<%@ Page Title="" Language="C#" MasterPageFile="~/FunAreaPages/FunMasterPage.master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="FunBook.WebForms.FunAreaPages.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderFunArea" runat="server">
    <div class="about-funbook text-center">
        <h1 class="pink">About Funbook</h1>
        <hr />
        <p class="blue">
            Funbook is a teamwork assignment from the academy of Telerik 2014.
            It is a place where everyone can see, create or comment on jokes, pictures or videos.
        </p>
        <hr />
        <h1 class="pink">Made by </h1>
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
                        <img class="carosel-image" src="../Content/Images/Creators/10580767_10204054652960275_6716628473550351430_o.jpg" />
                        <div class="carousel-caption">
                            <a href="https://github.com/epitsin">
                                <h1 class="pink pull-right">Elena Pitsin</h1>
                            </a>
                        </div>
                    </div>
                    <div class="item">
                        <img class="carosel-image" src="../Content/Images/Creators/10388119_762577167107654_6387298093960230587_n.jpg" />
                        <div class="carousel-caption">
                            <a href="https://github.com/dpesheva">
                                <h1 class="pink pull-right">Diana Pesheva</h1>
                            </a>
                        </div>
                    </div>
                    <div class="item">
                        <img class="carosel-image" src="../Content/Images/Creators/5741004.jpg" />
                        <div class="carousel-caption">
                            <a href="https://github.com/fast4y">
                                <h1 class="pink pull-right">Dzhenko Penev</h1>
                            </a>
                        </div>
                    </div>
                    <div class="item">
                        <img class="carosel-image" src="../Content/Images/Creators/1506855_10202939380631818_1924950813_n.jpg" />
                        <div class="carousel-caption">
                            <a href="https://github.com/viktor90">
                                <h1 class="pink pull-right">Viktor Klisurski</h1>
                            </a>
                        </div>
                    </div>
                    <div class="item">
                        <img class="carosel-image" src="../Content/Images/Creators/10446490_746686535381760_4069692579621278848_n.jpg" />
                        <div class="carousel-caption">
                            <a href="https://github.com/wIksS">
                                <h1 class="pink pull-right">Viktor Dakov</h1>
                            </a>
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
