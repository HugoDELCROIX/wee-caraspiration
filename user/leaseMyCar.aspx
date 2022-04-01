﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="leaseMyCar.aspx.cs" Inherits="user_leaseMyCar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
    <title>CarASPiration :: Lease my car</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" Runat="Server">

    <asp:Label ID="chooseCarLabel" runat="server" Text="Choose a car:"></asp:Label>
    <br />
    <asp:DropDownList ID="carsDropdownList" runat="server" DataSourceID="SqlDataSource1" DataTextField="model" DataValueField="Id"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [model] FROM [Cars] WHERE ([owner_id] = @owner_id)">
        <SelectParameters>
            <asp:Parameter Name="owner_id" Type="string" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />

    <asp:Label ID="labelPrice" runat="server" Text="Label">Price/j: </asp:Label>
    <asp:TextBox ID="textBoxPrice" runat="server"></asp:TextBox>

    <asp:RegularExpressionValidator ID="reprice" 
        ValidationExpression="^\d{0,8}(\.\d{1,2})?$" 
        runat="server" 
        ErrorMessage="Please enter a correct price" 
        ControlToValidate="textBoxPrice" 
        Display="Dynamic">
    </asp:RegularExpressionValidator>

    <br />

    <asp:Button ID="leaseBtn" runat="server" Text="Lease my car!" OnClick="leaseBtn_Click" />

    <br />

    <asp:Label ID="leaseMessage" runat="server" Text=""></asp:Label>
</asp:Content>
