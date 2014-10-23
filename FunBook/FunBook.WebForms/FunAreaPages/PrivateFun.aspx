<%@ Page Title=""
    Language="C#"
    MasterPageFile="~/FunAreaPages/FunMasterPage.master"
    AutoEventWireup="true"
    CodeBehind="PrivateFun.aspx.cs"
    Inherits="FunBook.WebForms.FunAreaPages.Create" %>

<asp:Content ID="OwnFun" ContentPlaceHolderID="ContentPlaceHolderFunArea" runat="server">
    <h1>Created by <%: Context.User.Identity.GetUserName().Split('@')[0]  %> </h1>
    <ul class="nav nav-tabs">
        <li class="active" runat="server" id="liJoke"><a href="#home" data-toggle="tab">Jokes</a></li>
        <li class="" runat="server" id="liLink"><a href="#links" data-toggle="tab">Links</a></li>
        <li class="" runat="server" id="liPic"><a href="#pics" data-toggle="tab">Pics</a></li>
    </ul>
    <div id="myTabContent" class="tab-content" runat="server">
        <div class="tab-pane fade active in" id="home">
            <asp:ListView ID="ListViewJokes" runat="server" ItemType="FunBook.Models.Joke">
                <LayoutTemplate>
                    <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
                </LayoutTemplate>

                <ItemSeparatorTemplate>
                    <hr />
                </ItemSeparatorTemplate>

                <ItemTemplate>
                    <section class="fun-main-container">
                        <h3><%#: Item.Title %></h3>
                        <br />
                        <asp:LinkButton ID="LinkButtonJokeLink" OnCommand="LinkButtonJoke_Command" CommandArgument="<%# Item.Id %>" runat="server">
                            <p><span id="open-link"><%# Item.Text %></span></p>
                        </asp:LinkButton>
                        <section class="joke-info">
                            <ul class="nav nav-pills">
                                <li class="button">
                                    <asp:LinkButton ID="LinkButtonEditLink" CommandArgument="<%# Item.Id %>" OnCommand="LinkButtonEditJoke_Command" runat="server">
                                        Edit
                                    </asp:LinkButton></li>
                                <li class="button">
                                    <asp:LinkButton ID="LinkButtonDeleteLink" CommandArgument="<%# Item.Id %>" OnCommand="LinkButtonDeleteJoke_Command" runat="server">
                                        Delete
                                    </asp:LinkButton>
                                </li>
                                <li class="button"><a>Views <span class="badge"><%#: Item.Views.Count %></span></a></li>
                                <li class="button"><a>Category <span class="badge"><%#: Item.Category.Name %></span></a></li>
                                <li class="button"><a>Created <span class="badge"><%#: Item.Created %></span></a></li>
                            </ul>
                        </section>
                    </section>
                </ItemTemplate>
            </asp:ListView>

            <asp:DataPager ID="DataPagerJokes" runat="server"
                PagedControlID="ListViewJokes" PageSize="3"
                QueryStringField="page">
                <Fields>
                    <asp:NextPreviousPagerField ShowFirstPageButton="true"
                        ShowNextPageButton="false" ShowPreviousPageButton="false" ButtonCssClass="btn btn-primary btn-xs" />
                    <asp:NextPreviousPagerField NextPageText="Previous"
                        ShowNextPageButton="false" ShowPreviousPageButton="true" ButtonCssClass="btn btn-primary btn-xs" />
                    <asp:NumericPagerField />
                    <asp:NextPreviousPagerField NextPageText="Next"
                        ShowNextPageButton="true" ShowPreviousPageButton="false" ButtonCssClass="btn btn-primary btn-xs" />
                    <asp:NextPreviousPagerField ShowLastPageButton="true"
                        ShowNextPageButton="false" ShowPreviousPageButton="false" ButtonCssClass="btn btn-primary btn-xs" />
                </Fields>
            </asp:DataPager>
        </div>
        <div class="tab-pane fade" id="links">
            <asp:ListView ID="ListViewLinks" runat="server" ItemType="FunBook.Models.Link">
                <LayoutTemplate>
                    <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
                </LayoutTemplate>

                <ItemSeparatorTemplate>
                    <hr />
                </ItemSeparatorTemplate>

                <ItemTemplate>
                    <section class="fun-main-container">
                        <p>
                            <asp:LinkButton ID="LinkButton4" OnCommand="LinkButtonLike_Command" CommandArgument="<%# Item.Id %>" runat="server">
                                <span id="open-link" class="btn btn-default btn-lg btn-block"><%#: Item.Title %></span>
                            </asp:LinkButton>
                        </p>
                        <section class="joke-info">
                            <ul class="nav nav-pills">
                                <li class="button">
                                    <asp:LinkButton ID="LinkButtonEditLink" CommandArgument="<%# Item.Id %>" OnCommand="LinkButtonEditLink_Command" runat="server">
                                        Edit
                                    </asp:LinkButton>
                                </li>
                                <li class="button">
                                    <asp:LinkButton ID="LinkButtonDeleteLink" CommandArgument="<%# Item.Id %>" OnCommand="LinkButtonDeleteLink_Command" runat="server">
                                        Delete
                                    </asp:LinkButton>
                                </li>
                                <li class="button"><a>Views <span class="badge"><%#: Item.Views.Count %></span></a></li>
                                <li class="button"><a>Category <span class="badge"><%#: Item.Category.Name %></span></a></li>
                                <li class="button"><a>Created <span class="badge"><%#: Item.Created %></span></a></li>
                            </ul>
                        </section>
                    </section>
                </ItemTemplate>
            </asp:ListView>

            <asp:DataPager ID="DataPagerLinks" runat="server"
                PagedControlID="ListViewLinks" PageSize="4"
                QueryStringField="page">
                <Fields>
                    <asp:NextPreviousPagerField ShowFirstPageButton="true" ButtonCssClass="btn btn-primary btn-xs"
                        ShowNextPageButton="false" ShowPreviousPageButton="false"/>
                    <asp:NextPreviousPagerField NextPageText="Previous"
                        ShowNextPageButton="false" ShowPreviousPageButton="true" ButtonCssClass="btn btn-primary btn-xs"/>
                    <asp:NumericPagerField />
                    <asp:NextPreviousPagerField NextPageText="Next"
                        ShowNextPageButton="true" ShowPreviousPageButton="false" ButtonCssClass="btn btn-primary btn-xs" />
                    <asp:NextPreviousPagerField ShowLastPageButton="true"
                        ShowNextPageButton="false" ShowPreviousPageButton="false" ButtonCssClass="btn btn-primary btn-xs" />
                </Fields>
            </asp:DataPager>
        </div>
        <div class="tab-pane fade" id="pics">
            <asp:ListView ID="ListViewPics" runat="server" ItemType="FunBook.Models.Picture">
                <LayoutTemplate>
                    <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
                </LayoutTemplate>

                <ItemSeparatorTemplate>
                    <hr />
                </ItemSeparatorTemplate>

                <ItemTemplate>
                    <section class="fun-main-container">
                        <h3>
                            <asp:LinkButton ID="LinkButton1" OnCommand="LinkButtonPicture_Command"
                                CommandArgument="<%# Item.Id %>" runat="server"><%#: Item.Title %></asp:LinkButton>
                        </h3>
                        <section id="fun-content">
                            <p>
                                <asp:LinkButton ID="LinkButton2" OnCommand="LinkButtonPicture_Command"
                                    CommandArgument="<%# Item.Id %>" runat="server"><span id="open-link">
                                <img id="picture-details-image" alt="Picture Details Page" src="<%#: Item.UrlPath %>" /></span></asp:LinkButton>
                            </p>
                            <section class="joke-info">
                                <ul class="nav nav-pills">
                                    <li class="button">
                                        <asp:LinkButton ID="LinkButtonEditLink" CommandArgument="<%# Item.Id %>" OnCommand="LinkButtonEditPicture_Command" runat="server">
                                        Edit
                                        </asp:LinkButton>
                                    </li>
                                    <li class="button">
                                        <asp:LinkButton ID="LinkButtonDeleteLink" CommandArgument="<%# Item.Id %>" OnCommand="LinkButtonDeletePicture_Command" runat="server">
                                        Delete
                                        </asp:LinkButton>
                                    </li>
                                    <li class="button"><a>Views <span class="badge"><%#: Item.Views.Count %></span></a></li>
                                    <li class="button"><a>Category <span class="badge"><%#: Item.Category.Name %></span></a></li>
                                    <li class="button"><a>Created <span class="badge"><%#: Item.Created %></span></a></li>
                                </ul>
                            </section>
                        </section>
                    </section>
                </ItemTemplate>
            </asp:ListView>

            <asp:DataPager ID="DataPagerPics" runat="server"
                PagedControlID="ListViewPics" PageSize="4"
                QueryStringField="page">
                <Fields>
                    <asp:NextPreviousPagerField ShowFirstPageButton="true"
                        ShowNextPageButton="false" ShowPreviousPageButton="false" ButtonCssClass="btn btn-primary btn-xs" />
                    <asp:NextPreviousPagerField NextPageText="Previous"
                        ShowNextPageButton="false" ShowPreviousPageButton="true" ButtonCssClass="btn btn-primary btn-xs" />
                    <asp:NumericPagerField />
                    <asp:NextPreviousPagerField NextPageText="Next"
                        ShowNextPageButton="true" ShowPreviousPageButton="false" ButtonCssClass="btn btn-primary btn-xs" />
                    <asp:NextPreviousPagerField ShowLastPageButton="true"
                        ShowNextPageButton="false" ShowPreviousPageButton="false" ButtonCssClass="btn btn-primary btn-xs" />
                </Fields>
            </asp:DataPager>
        </div>
    </div>
</asp:Content>
