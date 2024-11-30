<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="UMSfbAsp.login" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>BUGZ UNIVERSITY - Login</title>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;        }

        h1 {
            position: absolute;
            top: 50%;
            right: 50%;
            transform: translate(50%, -370%);
            text-align: center;
            font-family: 'University', sans-serif;
            letter-spacing: 0px;
            color: rgb(255, 255, 255);
            text-shadow: 15px 15px 15px rgba(9, 0, 64, 0.7);
            font-size: 3rem;
        }

        #background {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image: url('preview.png');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            filter: blur(2px);
            z-index: -1;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            background: #333;
            font-family: 'Open Sans', Helvetica, Arial, sans-serif;
        }

        .form-container {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 10px;
            width: 100%;
            max-width: 400px;
            text-align: center;
            z-index: 10;
        }

        .form-container input {
            text-align: center;
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 5px solid #ffffff;
            background-color: #fff;
            color: #333;
        }

        .form-container input:focus {
            border-color: #231e3c;
            box-shadow: 0 0 2px rgba(2, 10, 122, 0.5);
        }

        .buttons {
            margin-top: 30px;
            text-align: center;
            border-radius: 30px;
        }

        .blob-btn {
            position: relative;
            padding: 15px 40px;
            margin-top: 20px;
            text-align: center;
            text-transform: uppercase;
            color: #000033;
            font-size: 16px;
            font-weight: bold;
            background-color: transparent;
            outline: none;
            border: none;
            transition: color 0.5s;
            cursor: pointer;
            border-radius: 30px;
        }

        .blob-btn:before {
            content: "";
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            border: 2px solid #03033b;
            border-radius: 30px;
        }

        .blob-btn:hover {
            color: white;
            background-color: #03033b;
        }

        .blob-btn__inner {
            z-index: -1;
            overflow: hidden;
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            border-radius: 30px;
            background: #ffffff;
        }

        .blob-btn__blobs {
            position: relative;
            display: block;
            height: 100%;
            filter: url('#goo');
        }

        .blob-btn__blob {
            position: absolute;
            top: 2px;
            width: 25%;
            height: 100%;
            background: #02025c;
            border-radius: 100%;
            transform: translate3d(0, 150%, 0) scale(1.7);
            transition: transform 0.45s;
        }

        .blob-btn:hover .blob-btn__blob {
            transform: translateZ(0) scale(1.7);
        }

        a {
            color: white;
            position: static;
            top: 50px;
            left: 10px;
        }
    </style>
</head>
<body>
    <div id="ums-app">
        <div id="background"></div>
        <h1>Bugz University</h1>
    </div>

    <div class="form-container">
        <form id="form1" runat="server">
            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" Placeholder="Student ID"></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Password"></asp:TextBox>
            <a href="Default.aspx" target="_self">Go Home?</a>
            <div class="buttons">
                <asp:Button ID="btnLogin" runat="server" CssClass="blob-btn" Text="Login" OnClick="btnLogin_Click" />
            </div>
        </form>
    </div>

    <svg xmlns="http://www.w3.org/2000/svg" version="1.1">
        <defs>
            <filter id="goo">
                <feGaussianBlur in="SourceGraphic" result="blur" stdDeviation="10"></feGaussianBlur>
                <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 21 -7" result="goo"></feColorMatrix>
                <feBlend in2="goo" in="SourceGraphic" result="mix"></feBlend>
            </filter>
        </defs>
    </svg>
</body>
</html>
