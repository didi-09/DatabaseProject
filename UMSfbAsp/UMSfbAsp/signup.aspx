<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="UMSfbAsp.Signup" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>Signup - Bugz University</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .signup-container {
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        h1 {
            text-align: center;
            color: #0505A9;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #333333;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .btn {
            width: 100%;
            background-color: #0505A9;
            color: #ffffff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #0038A0;
        }

        .validation-error {
            color: red;
            font-size: 12px;
            margin-top: -15px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <form id="signupForm" runat="server">
        <div class="signup-container">
            <h1>Student-Signup</h1>
            <div class="form-group">
                <label for="txtName">Full Name</label>
                <asp:TextBox ID="txtName" runat="server" placeholder="Enter your full name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqName" runat="server" 
                    ControlToValidate="txtName" 
                    ErrorMessage="Full Name is required." 
                    CssClass="validation-error">
                </asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="txtEmail">Email Address</label>
                <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter your email"></asp:TextBox>
                <asp:RegularExpressionValidator ID="emailValidator" runat="server" 
                    ControlToValidate="txtEmail" 
                    ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" 
                    ErrorMessage="Please enter a valid email address." 
                    CssClass="validation-error">
                </asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="reqEmail" runat="server" 
                    ControlToValidate="txtEmail" 
                    ErrorMessage="Email is required." 
                    CssClass="validation-error">
                </asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="txtPassword">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqPassword" runat="server" 
                    ControlToValidate="txtPassword" 
                    ErrorMessage="Password is required." 
                    CssClass="validation-error">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="passwordStrengthValidator" runat="server" 
                    ControlToValidate="txtPassword" 
                    ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$" 
                    ErrorMessage="Password must be at least 8 characters, include uppercase, lowercase, and a number." 
                    CssClass="validation-error">
                </asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <label for="txtConfirmPassword">Confirm Password</label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" placeholder="Confirm your password"></asp:TextBox>
                <asp:CompareValidator ID="passwordMatchValidator" runat="server" 
                    ControlToValidate="txtConfirmPassword" 
                    ControlToCompare="txtPassword" 
                    ErrorMessage="Passwords do not match." 
                    CssClass="validation-error">
                </asp:CompareValidator>
            </div>
            <div class="form-group">
                <label for="txtPhone">Phone Number</label>
                <asp:TextBox ID="txtPhone" runat="server" placeholder="Enter your phone number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqPhone" runat="server" 
                    ControlToValidate="txtPhone" 
                    ErrorMessage="Phone Number is required." 
                    CssClass="validation-error">
                </asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="ddlDepartment">Department</label>
                <asp:DropDownList ID="ddlDepartment" runat="server">
                    <asp:ListItem Text="Select Department" Value=""></asp:ListItem>
                    <asp:ListItem Text="Computer Science" Value="CS"></asp:ListItem>
                    <asp:ListItem Text="Cyber Security" Value="CNC"></asp:ListItem>
                    <asp:ListItem Text="Artificial Intelligence" Value="AI"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="reqDepartment" runat="server" 
                    ControlToValidate="ddlDepartment" 
                    InitialValue="" 
                    ErrorMessage="Please select a department." 
                    CssClass="validation-error">
                </asp:RequiredFieldValidator>
            </div>
            <asp:Button ID="btnSubmit" runat="server" Text="Signup" CssClass="btn" OnClick="btnSubmit_Click" />
        </div>
    </form>
</body>
</html>
