<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="aspx_win_docker._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h2>ASP.NET on Docker</h2>
        <p class="lead" id="container_Name" runat="server"></p>
        <p class="lead">ASP.NET App based on .NET Framework 4.7.2 running on Windows based Docker image.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>
</asp:Content>