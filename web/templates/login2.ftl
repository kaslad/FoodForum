<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/login.css">
    <title>Food Stories | Auth</title>
</head>
<body>
<div class="b-login">
    <section class="b-login-form" id="login">
        <h1>Food <span class="orange">Stories</span></h1>
        <form class="login-form" action="#" method="POST">

            <input type="text" name="login" required placeholder="Логин">
            <input type="password" name="password" required placeholder="Пароль">

            <input class="sub-btn" type="submit" value="Войти">
            <h5>Нет аккаунта? <a href="#" id="reg-button">Зарегистрироваться</a></h5>

        </form>
    </section>

    <section class="b-login-form hide" id="registration">
        <h1>Food <span class="orange">Stories</span></h1>
        <form class="login-form" action="#">

            <input type="text" name="login" required placeholder="Логин">

            <input type="text" name="name" required placeholder="Имя">

            <input type="email" name="email" required placeholder="Email">

            <input type="password" name="password" required placeholder="Пароль">

            <input class="sub-btn" type="submit" value="Регистрация">
            <h5>Уже зарегистрированы? <a href="#" id="log-button">Войти</a></h5>
        </form>
    </section>
</div>
<script>
    document.addEventListener("click", lhide);

    function lhide(e) {
        console.log(e.target);
        if (e.target == document.getElementById("reg-button") || e.target == document.getElementById("log-button")) {
            login.classList.toggle("hide");
            registration.classList.toggle("hide");
        }
    }

</script>

</body>
</html>
