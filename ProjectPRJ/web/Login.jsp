<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="css/homePageStyle.css">
    <link rel="stylesheet" href="css/style_login.css">
    <title>Login - LCD Web Store</title>
</head>
<body class="container-fluid">
    <header class="row">
        <div class="col-md-2 logo">
            <img src="elements/Untitled design.png">
        </div>
        <div class="col-md-4"></div>
        <nav class="col-md-6 navigate">
            <a href="HomePage.html">home</a>
            <a href="#">search</a>
            <a href="#">explore</a>
            <a href="login.jsp">account</a>
            <a href="#">cart</a>
        </nav>
    </header>

    <main class="row justify-content-center">
        <div class="col-md-4">
            <h2 class="text-center">login</h2>
            <h2 class="text-center2">${mess}</h2>
            <form id="loginForm" action="login" method="post">
                <div class="mb-3">
                    <input name="user" type="email" class="form-control" placeholder="Email Address" required>
                </div>
                <div class="mb-3">
                    <input name="pass" type="password" class="form-control" placeholder="Password" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">Login</button>
            </form>
            <p class="text-center1 mt-3">Don't have an account? <button id="showRegister" class="btn btn-link">register here</button></p>
        </div>
    </main>

    <section id="register" class="row justify-content-center mt-5 hidden">
        <div class="col-md-4">
            <h2 class="text-center">register</h2>
            <form id="registerForm">
                <div class="mb-3">
                    
                    <input name="user" type="email" class="form-control" placeholder="Email Address" required>
                </div>
                <div class="mb-3">
                    <input name="phone" type="tel" class="form-control" placeholder="Phone Number" required>
                </div>
                <div class="mb-3">
                    <input name="pass" type="password" class="form-control" placeholder="Password" required>
                </div>
                <div class="mb-3">
                    
                    <input name="re-pass" type="password" class="form-control" placeholder="Confirm Password" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">register</button>
            </form>
            <p class="text-center1 mt-3">Already have an account? <button id="showLogin" class="btn btn-link">login here</button></p>
        </div>
    </section>

    <footer class="footer row">
        <div class="col-md-4 title_contact">
            <h3>CONTACT US</h3>
        </div>
        <div class="col-md-4 contact_info">
            <p>Address: 123 Main Street, Ha Noi</p>
            <p>Phone: 0123456789</p>
        </div>
    </footer>

    <script>
        document.getElementById('showRegister').addEventListener('click', function() {
            document.getElementById('loginForm').parentElement.classList.add('hidden');
            document.getElementById('register').classList.remove('hidden');
        });

        document.getElementById('showLogin').addEventListener('click', function() {
            document.getElementById('register').classList.add('hidden');
            document.getElementById('loginForm').parentElement.classList.remove('hidden');
        });
    </script>
</body>
</html>
