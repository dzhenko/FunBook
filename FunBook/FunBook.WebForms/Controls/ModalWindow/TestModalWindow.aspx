<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestModalWindow.aspx.cs" Inherits="TestASCX.TestModalWindow" %>

<%@ Register TagPrefix="uc" TagName="ModalWindow" Src="~/ModalWindow/ModalWindow.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../jquery.min.js"></script>
    <script src="../bootstrap/js/bootstrap.js"></script>
    <link href="../bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../bootstrap/css/bootstrap-theme.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="OpBtn" runat="server" OnClick="OpBtn_Click" Text="Click" />
            <uc:ModalWindow runat="server" ID="Modal" 
                OnOKButtonClicked="Modal_OKButtonClicked"
                OKButtonText ="Continue"
                ModalWindowText="One god damn fine body">
            </uc:ModalWindow>
        </div>
    </form>
</body>
</html>
