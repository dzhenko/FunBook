<%@ Page Title="" Language="C#"
    MasterPageFile="~/FunAreaPages/FunMasterPage.master"
    AutoEventWireup="true" CodeBehind="ManageFun.aspx.cs"
    Inherits="FunBook.WebForms.FunAreaPages.PrivateFunDetails.ManageFun" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderFunArea" runat="server">
    <asp:UpdatePanel ID="UpdatePanelChooseFun" runat="server" class="managefun-panel-radio" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:RadioButton ID="RadioButtonJoke" runat="server" AutoPostBack="True"
                Text="Joke" OnCheckedChanged="RadioButtonJoke_CheckedChanged" GroupName="GroupFuns" />
            <asp:RadioButton ID="RadioButtonLink" runat="server" AutoPostBack="True"
                Text="Link" OnCheckedChanged="RadioButtonLink_CheckedChanged" GroupName="GroupFuns" />
            <asp:RadioButton ID="RadioButtonPicture" runat="server" AutoPostBack="True"
                Text="Picture" OnCheckedChanged="RadioButtonPicture_CheckedChanged" GroupName="GroupFuns" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />

    <asp:UpdatePanel ID="UpdatePanelFunForms" runat="server">
        <ContentTemplate>
            <asp:Panel ID="PanelJoke" runat="server" Visible="false" class="managefun-panel-radio">
                <form name="joke-form" class="form-horizontal">
                    <fieldset>
                        <legend>Joke</legend>
                        <div class="form-group">
                            <label for="inputTitleJoke" class="col-lg-2 control-label">Title</label>
                            <div class="col-lg-10">
                                <input type="text" class="form-control" id="inputTitleJoke" placeholder="Title">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="textArea" class="col-lg-2 control-label">Textarea</label>
                            <div class="col-lg-10">
                                <textarea class="form-control" rows="3"" id="textArea"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-2">
                                <button class="btn btn-default">Cancel</button>
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </asp:Panel>

            <asp:Panel ID="PanelLink" runat="server" Visible="false" class="managefun-panel-radio">
                <form name="link-form" class="form-horizontal">
                    <fieldset>
                        <legend>Link</legend>
                        <div class="form-group">
                            <label for="inputTitleLink" class="col-lg-2 control-label">Title</label>
                            <div class="col-lg-10">
                                <input type="text" class="form-control" id="inputTitleLink" placeholder="Title">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="urlLink" class="col-lg-2 control-label">Url</label>
                            <div class="col-lg-10">
                                <input type="text" class="form-control" id="urlLink"></input>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-2">
                                <button class="btn btn-default">Cancel</button>
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </asp:Panel>

            <asp:Panel ID="PanelPicture" runat="server" Visible="false" class="managefun-panel-radio">
                <form name="picture-form" class="form-horizontal">
                    <fieldset>
                        <legend>Picture</legend>
                        <div class="form-group">
                            <label for="inputTitlePicture" class="col-lg-2 control-label">Title</label>
                            <div class="col-lg-10">
                                <input type="text" class="form-control" id="inputTitlePicture" placeholder="Title">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="urlPic" class="col-lg-2 control-label">Url path</label>
                            <div class="col-lg-10">
                                <input type="text" class="form-control" id="urlPic"></input>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-2">
                                <button class="btn btn-default">Cancel</button>
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
