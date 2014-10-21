<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestHoverDetails.aspx.cs" Inherits="TestASCX.HoverDetails.TestHoverDetails" %>

<%@ Register TagPrefix="uc" TagName="HoverDetails" Src="~/HoverDetails/HoverDetails.ascx" %>

<!DOCTYPE html>
<script src="../jquery.min.js"></script>
<script src="../bootstrap/js/bootstrap.js"></script>
<link href="../bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="../bootstrap/css/bootstrap-theme.css" rel="stylesheet" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Repeater runat="server" ID="Repeater" SelectMethod="Repeater_GetData" ItemType="TestASCX.HoverDetails.Joke">
                <ItemTemplate>
                    <span class="hoveredItem" data-id="<%# Item.Id %>">
                        <a href='<%# Item.Id %>'><%# Item.Title %></a>
                    </span>
                    <hr />
                </ItemTemplate>
            </asp:Repeater>
            <uc:HoverDetails runat="server" ID="HoverDetails"></uc:HoverDetails>
        </div>
    </form>
</body>
</html>
