<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HoverDetails.ascx.cs" Inherits="TestASCX.HoverDetails.HoverDetails" %>

<asp:ScriptManager runat="server"></asp:ScriptManager>
<link href="../bootstrap/css/bootstrap.css" rel="stylesheet" />
<div id="HoverDetailsOptions" hidden="hidden">
    <input runat="server" type="hidden" id="HiddenHoveredItemId" value="1" />
</div>

<div id="HoverDetailsHolder" hidden="hidden">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div id="hover-item-details-holder">
                <asp:DetailsView CssClass="table" runat="server" ID="HoverDetailsView" AutoGenerateRows="false" ItemType="TestASCX.HoverDetails.Joke">
                    <HeaderTemplate>
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title"><%# Item.Title %></h3>
                            </div>
                            <div class="panel-body">
                                <%# Item.Text.Substring(0, 30) %> ...
                            <span class="badge alert-danger">
                                <%# Item.DownVotes %>
                            </span>

                            <span class="badge alert-success">
                                <%# Item.UpVotes %>
                            </span>
                                
                            <span class="text-primary">
                                Views : <%# Item.Views %>
                            </span>
                            </div>
                        </div>
                    </HeaderTemplate>
                </asp:DetailsView>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
<link href="hoverDetails.css" rel="stylesheet" />
<script src="hoverDetails.js"></script>
