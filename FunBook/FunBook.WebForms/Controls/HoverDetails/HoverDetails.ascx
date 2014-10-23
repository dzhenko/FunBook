<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HoverDetails.ascx.cs" Inherits="TestASCX.HoverDetails.HoverDetails" %>

<div id="HoverDetailsOptions" hidden="hidden">
    <input runat="server" type="hidden" id="HiddenHoveredItemId" value="1" />
</div>

<div id="HoverDetailsHolder" hidden="hidden">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div id="hover-item-details-holder">
                <asp:DetailsView CssClass="table" runat="server" ID="HoverDetailsView" AutoGenerateRows="false" ItemType="FunBook.WebForms.DataModels.AllItemDataModel">
                    <HeaderTemplate>
                       <div class="custom-box blue">
                            <div class="panel-heading">
                                <h3 class="panel-title"><%# Item.Title %></h3>
                            </div>
                            <div class="panel-body">
                            <span class="glyphicon glyphicon-thumbs-down alert-danger">
                                <%# Item.DownVotes %>
                            </span>

                            <span class="glyphicon glyphicon-thumbs-up alert-success">
                                <%# Item.UpVotes %>
                            </span>
                                
                            <span class="glyphicon glyphicon-eye-open alert-primary">
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
