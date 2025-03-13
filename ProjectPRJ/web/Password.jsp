<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Change Password</title>
        <link rel="stylesheet" href="css/style_login.css">
    </head>
</html>
<body>
    <form action="PasswordControl" method="post">
        <input name="user" type="email" class="form-control" placeholder="Email Address" required>
        <input name="pass" type="password" class="form-control" placeholder="Old Password" required>
        <input name="newpass" type="password" class="form-control" placeholder="New Password" required>
        <input name="renewpass" type="password" class="form-control" placeholder="Confirm New Password" required>
    </form>
</body>