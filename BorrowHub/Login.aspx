<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs"
    Inherits="BorrowHub.Login" ClientIDMode="Static" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Login</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- boxicons -->
    <link href="https://cdn.boxicons.com/3.0.3/fonts/basic/boxicons.min.css" rel="stylesheet" />

    <!-- css -->
    <link href="css/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <div class="form-header">
                <div class="titles">
                    <div class="title-login">Login</div>
                    <div class="title-register">Register</div>
                </div>
            </div>

            <!-- LOGIN -->
            <div class="login-form">
                <div class="input-box">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="input-field"></asp:TextBox>
                    <label for="txtEmail" class="label">Email</label>
                    <i class="bx bx-envelope-alt icon"></i>
                </div>

                <div class="input-box">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="input-field" TextMode="Password"></asp:TextBox>
                    <label for="txtPassword" class="label">Password</label>
                    <i class="bx bx-lock icon"></i>
                </div>

                <div class="form-cols">
                    <div class="col-1"></div>
                    <div class="col-2">
                        <a href="#">Forgot password?</a>
                    </div>
                </div>

                <div class="input-box">
                    <!-- REAL SIGN IN BUTTON -->
                    <asp:Button
                        ID="btnLogin"
                        runat="server"
                        Text="Sign In"
                        CssClass="btn-submit"
                        OnClick="btnLogin_Click"
                        UseSubmitBehavior="false" />
                </div>

                <!-- debug label just to prove click works -->
                <asp:Label ID="lblDebug" runat="server" ForeColor="Red"></asp:Label>

                <div class="switch-form">
                    <span>Don't have an account?
                        <a href="#" onclick="registerFunction(); return false;">Register</a>
                    </span>
                </div>
            </div>

            <!-- REGISTER -->
            <div class="register-form">
                <div class="input-box">
                    <asp:TextBox ID="txtRegName" runat="server" CssClass="input-field"></asp:TextBox>
                    <label for="txtRegName" class="label">Username</label>
                    <i class="bx bx-user icon"></i>
                </div>

                <div class="input-box">
                    <asp:TextBox ID="txtRegEmail" runat="server" CssClass="input-field"></asp:TextBox>
                    <label for="txtRegEmail" class="label">Email</label>
                    <i class="bx bx-envelope-alt icon"></i>
                </div>

                <div class="input-box">
                    <asp:TextBox ID="txtRegPass" runat="server" CssClass="input-field" TextMode="Password"></asp:TextBox>
                    <label for="txtRegPass" class="label">Password</label>
                    <i class="bx bx-lock icon"></i>
                </div>

                <div class="form-cols">
                    <div class="col-1"></div>
                    <input type="checkbox" id="agree" />
                    <label for="agree"> I agree to terms &amp; conditions</label>
                    <div class="col-2"></div>
                </div>

                <div class="input-box">
                    <asp:Button
                        ID="btnSignUp"
                        runat="server"
                        Text="Sign Up"
                        CssClass="btn-submit"
                        OnClick="btnSignUp_Click"
                        UseSubmitBehavior="false" />
                </div>

                <div class="switch-form">
                    <span>Already have an account?
                        <a href="#" onclick="loginFunction(); return false;">Login</a>
                    </span>
                </div>
            </div>
        </div>

        <script src="js/script.js"></script>
    </form>
</body>
</html>
