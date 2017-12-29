<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Food Stories</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/create_post.css">
    <link rel="stylesheet" href="css/post.css">
    <link rel="stylesheet" href="css/profile.css">
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/mystories.css">


    <!--<script defer src="js/post.js"></script      >-->
    <link href="js/jquery-ui-1.12.1/jquery-ui.css" type="text/css" rel="stylesheet">
    <script defer src="js/script.js"></script>

    <script src="js/jquery-ui-1.12.1/jquery-ui.js"></script>
    <script src="js/jquery-3.2.1.min.js"></script>

</head>
<body>

<div class="b-search hid" id="ibs">
    <div class="b-search-grid">
        <div class="search-row">
            <div class="input-gr">
                <input type="text" class="search__inp" placeholder="Поиск по историям или #tag" id="pattern"
                       name="pattern">
                <!--
                    Здесь вроде нужно кнопку ссылкой обернуть ты сделай я если че потом поправлю
                    И вообще любые замечания пиши я завтра буду править.
                    Сейчас делаю остальные.
                    Кстати по хорошему нужно вынести отсюда b-header, b-search, b-ham-nav, b-footer и тег main
                    с классом <main class="b-main">, их вместе со стилями(и медиа запросы не забыть и скриптами
                    отдельный шаблон!!! и уже этот шаблон во все остальные так будет проще чинить и меньше неразберихи
                    P.P.S. Верстал в последний раз очень давно, думаю в этой верстке можно многое подправить,
                    но в целом: "Итак сойдет". Как поговаривал "Вовка в Тридевятом Царстве".
                -->

                <button class="search__btn" type="submit" id="searching">
                    <i class="fa fa-search"></i>
                </button>
            </div>
        </div>
    </div>
</div>

<div class="b-ham-nav hid" id="ibh">
    <div class="ham-grid">
        <ul class="b-ham-ul">
            <li class="b-ham-ul-item" id="hamclose">
                <a href="" class="b-ham-ul-item__link">
                    <span class="fa fa-close"></span>
                    Закрыть меню
                </a>
            </li>
            <li class="b-ham-ul-item">
                <a href="/main" class="b-ham-ul-item__link">
                    Главная
                </a>
            </li>
            <li class="b-ham-ul-item">
                <a href="/my_stories/?id=${user.id}" class="b-ham-ul-item__link">
                    Мои истории
                </a>
            </li>
            <li class="b-ham-ul-item">
                <a href="/create_post" class="b-ham-ul-item__link">
                    <span class="fa fa-plus"></span>Новый пост
                </a>
            </li>
            <li class="b-ham-ul-item">
                <a href="/useful" class="b-ham-ul-item__link">
                    Полезное
                </a>
            </li>
            <li class="b-ham-ul-item">
                <a href="/about" class="b-ham-ul-item__link">
                    О сайте
                </a>
            </li>
            <li class="b-ham-ul-item" id="btnsearch2">
                <a href="#" class="b-ham-ul-item__link">
                    <span class="fa fa-search"></span>
                    Поиск
                </a>
            </li>
            <li class="b-ham-ul-item">
                <a href="/profile" class="b-ham-ul-item__link">
                    <span class="fa fa-user"></span>
                </a>
            </li>
            <li class="b-ham-ul-item">
                <a href="/logout" class="b-ham-ul-item__link">
                    <span class="fa fa-sign-out"></span>Выйти
                </a>
            </li>
        </ul>
    </div>
</div>
</div>

<div class="m-fix"></div>
<header class="b-header">
    <div class="b-header-grid">
        <div class="b-logo">
            <a class="b-logo-a" href="/main">
                <strong>Food <span class="b-logo_orange">Stories</span></strong>
            </a>
        </div>
        <nav class="b-nav">
            <ul class="b-nav-ul" id="navigataion">
                <li class="b-nav-ul-item">
                    <a href="/main" class="b-nav-ul-item__link active-item">
                        Главная
                    </a>
                </li>
                <li class="b-nav-ul-item">
                    <a href="/my_stories?id=${user.id}" class="b-nav-ul-item__link">
                        Мои истории
                    </a>
                </li>
                <li class="b-nav-ul-item">
                    <a href="/create_post" class="b-nav-ul-item__link">
                        <span class="fa fa-plus"></span>Новый пост
                    </a>
                </li>
                <li class="b-nav-ul-item">
                    <a href="/useful" class="b-nav-ul-item__link">
                        Полезное
                    </a>
                </li>
                <li class="b-nav-ul-item">
                    <a href="/about" class="b-nav-ul-item__link">
                        О сайте
                    </a>
                </li>
                <li class="b-nav-ul-item" id="btnsearch">
                    <a href="#" class="b-nav-ul-item__link">
                        <span class="fa fa-search" id="i-search"></span>
                    </a>
                </li>
            </ul>
        </nav>
        <div class="b-nav-auth">
            <ul class="b-nav-ul">
                <li class="b-nav-ul-item">
                    <a href="/profile" class="b-nav-ul-item__link">
                        <span class="fa fa-user"></span>
                    </a>
                </li>
                <li class="b-nav-ul-item">
                    <a href="/logout" class="b-nav-ul-item__link">
                        <span class="fa fa-sign-out"></span>Выйти
                    </a>
                </li>
            </ul>
        </div>
        <div class="btn-hamburger" id="btnham">
            <span class="fa fa-bars">
            </span>
        </div>
    </div>
</header>
<main class="b-main">
    <h1 hidden>Food Stroies это сайт о том что объединяет всех людей, будь то деловой обед в ресторане тихий семейный
        ужин или вечер с друзьями за коктейлем. О еде!</h1>
    <!--     Конец header tfl      -->


    <section class="b-articles b-main-grid" id="post_container">

    <#if posts??>
        <#list posts as post>
            <article class="b-article">
                <#if post.photos?size == 1>
                    <a href="/post?id=${post.id}">
                        <div class="b-article-img"
                             style="background-image:  url('load/${post.photos[0]}')">
                        </div>

                    </a>
                </#if>
                <div class="b-article-meta">
                    <header class="b-article-head">
                        <a class="b-article__author" href="/my_stories?id=${post.author.id}">${post.author.login}</a>
                        <span class="b-article__post-date">
                    </span>${post.time}

                    </header>
                    <a href="/post?id=${post.id}">
                        <h2 class="b-article-title">
                        ${post.text}
                        </h2>
                    </a>
                    <footer class="b-article-info">
                        <div class="b-article-likes">
                            <span class="fa fa-heart"></span>${post.likes}
                        </div>
                        <div class="b-article-comments">
                            <span class="fa fa-comments"></span>${post.comments?size}
                        </div>
                    </footer>
                </div>
            </article>
        </#list>
    </#if>

    </section>
<#include "base_footer.ftl">

</html>