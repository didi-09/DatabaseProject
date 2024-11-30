<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UMSfbAsp.Default" %>


<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>BUGZ UNIVERSITY</title>
    <style>
      /* Add the same CSS here */
      html, body {
        height: 100%;
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
      }
      
      h1 {
        text-align: center;
        font-family: 'University', sans-serif;
        letter-spacing: 4px;
        color: rgb(255, 255, 255);
        text-shadow: 15px 15px 15px rgba(0, 8, 78, 0.7);
        font-size: 3rem;
        animation: moveUp 2s forwards;
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
      
      @keyframes moveUp {
        0% {
          transform: translateY(0);
        }
        100% {
          transform: translateY(40px);
        }
      }

      .buttons {
        margin-top: 100px;
        text-align: center;
        display: flex;
        flex-direction: column;
        gap: 20px;
      }

      .blob-btn {
        position: relative;
        padding: 20px 46px;
        text-align: center;
        text-transform: uppercase;
        color: #0505A9;
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
        border: 2px solid #0505A9;
        border-radius: 30px;
      }

      .blob-btn:hover {
        color: white;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="background"></div>
        <h1>Bugz University</h1>
        <div class="buttons">
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="blob-btn" OnClick="btnLogin_Click" />
            <asp:Button ID="btnSignup" runat="server" Text="New Student" CssClass="blob-btn" OnClick="btnSignup_Click" />
        </div>
    </form>
</body>
</html>
