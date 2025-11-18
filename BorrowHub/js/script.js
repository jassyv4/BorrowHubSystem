document.addEventListener('DOMContentLoaded', function () {
    const loginForm = document.querySelector('.login-form');
    const registerForm = document.querySelector('.register-form');
    const titleLogin = document.querySelector('.title-login');
    const titleRegister = document.querySelector('.title-register');

    function showLogin() {
        loginForm.style.display = 'block';
        registerForm.style.display = 'none';

        titleLogin.style.display = 'block';
        titleRegister.style.display = 'none';
    }

    function showRegister() {
        loginForm.style.display = 'none';
        registerForm.style.display = 'block';

        titleLogin.style.display = 'none';
        titleRegister.style.display = 'block';
    }

    // expose functions for the onclick="" in your HTML
    window.loginFunction = showLogin;
    window.registerFunction = showRegister;

    // initial state: login visible
    showLogin();
});
