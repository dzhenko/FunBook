<%@ Page Title="" Language="C#"
    MasterPageFile="~/FunAreaPages/FunMasterPage.master"
    AutoEventWireup="true" CodeBehind="AddFun.aspx.cs"
    Inherits="FunBook.WebForms.FunAreaPages.PrivateFunDetails.AddFun" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderFunArea" runat="server">
       <asp:UpdatePanel ID="UpdatePanelChooseFun" runat="server" class="managefun-panel-radio jokes-content blue" UpdateMode="Conditional">
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

        <label for="DropDownListCategory" class="col-lg-2 control-label blue">Category</label>
        <asp:DropDownList ID="DropDownListCategory" class="form-control blue" runat="server"></asp:DropDownList>

        <asp:UpdatePanel ID="UpdatePanelFunForms" runat="server">
            <ContentTemplate>
                <asp:Panel ID="PanelJoke" runat="server" Visible="false" class="managefun-panel-radio blue">
                    <form name="joke-form" class="form-horizontal">
                        <fieldset>
                            <legend class="blue">Joke</legend>
                            <div class="form-group">
                                <label for="inputTitleJoke" class="col-lg-2 control-label">Title</label>
                                <div class="col-lg-10">
                                    <input type="text" class="form-control" id="inputTitleJoke" runat="server" placeholder="Title">
                                    <asp:RequiredFieldValidator ControlToValidate="inputTitleJoke" Display="Dynamic" runat="server" ErrorMessage="You have to enter at least 3 symbols"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="jokeText" class="col-lg-2 control-label">Text</label>
                                <div class="col-lg-10">
                                    <textarea class="form-control" rows="3" id="jokeText" runat="server"></textarea>
                                    <asp:RequiredFieldValidator ControlToValidate="jokeText" Display="Dynamic" runat="server" ErrorMessage="You have to enter at least 3 symbols"></asp:RequiredFieldValidator>
                                    <div class="checkbox">
                                        <label>
                                            <input id="isAnonymous" runat="server" type="checkbox">
                                            Anonymous
                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-10 col-lg-offset-2">
                                            <a href="/" class="btn btn-default" runat="server">Cancel</a>
                                            <asp:LinkButton Text="Create" runat="server" class="btn btn-primary" OnClick="JokeSubmit_Click" />
                                        </div>
                                    </div>
                        </fieldset>
                    </form>
                </asp:Panel>

                <asp:Panel ID="PanelLink" runat="server" Visible="false" class="managefun-panel-radio blue">
                    <form name="link-form" class="form-horizontal">
                        <fieldset>
                            <legend class="blue">Link</legend>
                            <div class="form-group">
                                <label for="inputTitleLink" class="col-lg-2 control-label">Title</label>
                                <div class="col-lg-10">
                                    <input type="text" class="form-control" id="inputTitleLink" placeholder="Title" runat="server">
                                    <asp:RequiredFieldValidator ControlToValidate="inputTitleLink" Display="Dynamic" runat="server" ErrorMessage="You have to enter at least 3 symbols"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="urlLink" class="col-lg-2 control-label">Url</label>
                                <div class="col-lg-10">
                                    <input type="text" class="form-control" runat="server" id="urlLink" />
                                    <asp:RequiredFieldValidator ControlToValidate="urlLink" Display="Dynamic" runat="server" ErrorMessage="You have to enter at least 3 symbols"></asp:RequiredFieldValidator>
                                    <div class="checkbox">
                                        <label>
                                            <input id="isAnonymousLink" runat="server" type="checkbox">
                                            Anonymous
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-10 col-lg-offset-2">
                                    <a href="/" class="btn btn-default" runat="server">Cancel</a>
                                    <asp:LinkButton Text="Create" runat="server" class="btn btn-primary" OnClick="LinkSubmit_Click" />
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </asp:Panel>

                <asp:Panel ID="PanelPicture" runat="server" Visible="false" class="managefun-panel-radio blue">
                    <form name="picture-form" class="form-horizontal">
                        <fieldset>
                            <legend class="blue">Picture</legend>
                            <div class="form-group">
                                <label for="inputTitlePicture" class="col-lg-2 control-label">Title</label>
                                <div class="col-lg-10">
                                    <input type="text" class="form-control" id="inputTitlePicture" placeholder="Title" runat="server" />
                                    <asp:RequiredFieldValidator ControlToValidate="inputTitlePicture" Display="Dynamic" runat="server" ErrorMessage="You have to enter at least 3 symbols"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-2 control-label">Choose File</label>
                                <div class="col-lg-10">
                                    <asp:FileUpload ID="FileUploadControl" runat="server" />
                                    <div class="checkbox">
                                        <label>
                                            <input id="isAnonymousPic" runat="server" type="checkbox">
                                            Anonymous
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-10 col-lg-offset-2">
                                    <a href="/" class="btn btn-default" runat="server">Cancel</a>
                                    <asp:LinkButton Text="Create" runat="server" class="btn btn-primary" OnClick="PictureSubmit_Click" />
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>
