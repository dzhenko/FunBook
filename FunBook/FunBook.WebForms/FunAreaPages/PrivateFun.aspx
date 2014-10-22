<%@ Page Title=""
    Language="C#"
    MasterPageFile="~/FunAreaPages/FunMasterPage.master"
    AutoEventWireup="true"
    CodeBehind="PrivateFun.aspx.cs"
    Inherits="FunBook.WebForms.FunAreaPages.Create" %>

<asp:Content ID="OwnFun" ContentPlaceHolderID="ContentPlaceHolderFunArea" runat="server">
    <h1>Created by <%: Context.User.Identity.GetUserName().Split('@')[0]  %> </h1>

    <ul class="nav nav-tabs">
        <li class="active" runat="server" id="liJoke"><a href="#home" data-toggle="tab">Pokes</a></li>
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
                    <div class="joke-item">
                        <h4>
                            <asp:LinkButton ID="LinkButtonJoke" OnCommand="LinkButtonJoke_Command"
                                CommandArgument="<%# Item.Id %>" runat="server"><%#: Item.Title %></asp:LinkButton></h4>
                        <p><%#: Item.Category.Name %></p>
                    </div>
                </ItemTemplate>
            </asp:ListView>

            <asp:DataPager ID="DataPagerJokes" runat="server"
                PagedControlID="ListViewJokes" PageSize="4"
                QueryStringField="page">
                <Fields>
                    <asp:NextPreviousPagerField ShowFirstPageButton="true"
                        ShowNextPageButton="false" ShowPreviousPageButton="false" />
                    <asp:NextPreviousPagerField NextPageText="Previous"
                        ShowNextPageButton="false" ShowPreviousPageButton="true" />
                    <asp:NumericPagerField />
                    <asp:NextPreviousPagerField NextPageText="Next"
                        ShowNextPageButton="true" ShowPreviousPageButton="false" />
                    <asp:NextPreviousPagerField ShowLastPageButton="true"
                        ShowNextPageButton="false" ShowPreviousPageButton="false" />
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
                    <div class="link-item">
                        <h4>
                            <asp:LinkButton ID="LinkButtonJoke" OnCommand="LinkButtonLike_Command"
                                CommandArgument="<%# Item.Id %>" runat="server"><%#: Item.Title %></asp:LinkButton>
                        </h4>
                        <p><%#: Item.Category.Name %></p>
                    </div>
                </ItemTemplate>
            </asp:ListView>

            <asp:DataPager ID="DataPagerLinks" runat="server"
                PagedControlID="ListViewLinks" PageSize="4"
                QueryStringField="page">
                <Fields>
                    <asp:NextPreviousPagerField ShowFirstPageButton="true"
                        ShowNextPageButton="false" ShowPreviousPageButton="false" />
                    <asp:NextPreviousPagerField NextPageText="Previous"
                        ShowNextPageButton="false" ShowPreviousPageButton="true" />
                    <asp:NumericPagerField />
                    <asp:NextPreviousPagerField NextPageText="Next"
                        ShowNextPageButton="true" ShowPreviousPageButton="false" />
                    <asp:NextPreviousPagerField ShowLastPageButton="true"
                        ShowNextPageButton="false" ShowPreviousPageButton="false" />
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
                    <div class="link-item">
                        <h4><%#: Item.Title %></h4>
                        <img src="<%#: Item.UrlPath %>" />
                        <p><%#: Item.Category.Name %></p>
                    </div>
                </ItemTemplate>
            </asp:ListView>

            <asp:DataPager ID="DataPagerPics" runat="server"
                PagedControlID="ListViewPics" PageSize="4"
                QueryStringField="page">
                <Fields>
                    <asp:NextPreviousPagerField ShowFirstPageButton="true"
                        ShowNextPageButton="false" ShowPreviousPageButton="false" />
                    <asp:NextPreviousPagerField NextPageText="Previous"
                        ShowNextPageButton="false" ShowPreviousPageButton="true" />
                    <asp:NumericPagerField />
                    <asp:NextPreviousPagerField NextPageText="Next"
                        ShowNextPageButton="true" ShowPreviousPageButton="false" />
                    <asp:NextPreviousPagerField ShowLastPageButton="true"
                        ShowNextPageButton="false" ShowPreviousPageButton="false" />
                </Fields>
            </asp:DataPager>
        </div>
    </div>
</asp:Content>
