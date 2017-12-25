<!DOCTYPE html>
<!--suppress ALL -->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/style.css">
    <script defer src="js/script.js"></script>
    <script src="js/jquery-3.2.1.min.js"></script>

    <title>Food Stories</title>
</head>
<body>
<div class="b-search hid" id="ibs">
    <div class="b-search-grid">
        <div class="search-row">
            <div class="input-gr">
                <input type="text" class="search__inp" placeholder="Поиск по историям, ключевые слова или #tag" id="pattern" name="pattern">
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

                <button class="search__btn" type="submit" onclick="do_search()">
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
                <a href=/main" class="b-ham-ul-item__link">
                    Главная
                </a>
            </li>
            <li class="b-ham-ul-item">
                <a href="/my_stories" class="b-ham-ul-item__link">
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


<header class="b-header">
    <div class="b-header-grid">
        <div class="b-logo">
            <a class="b-logo-a" href="/main">
                <strong>Food <span class="b-logo_orange">Stories</span></strong>
            </a>
        </div>
        <nav class="b-nav">
            <ul class="b-nav-ul">
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

<main class="b-main" >
    <h1 hidden>Food Stroies это сайт о том что объединяет всех людей, будь то деловой обед в ресторане тихий семейный
        ужин или вечер с друзьями за коктейлем. О еде!</h1>

    <section class="b-articles b-main-grid" id="post_container">
        <#if posts??>
    <#list posts as post>
        <article class="b-article ">
            <#if post.photos?size == 1>
                <a href="#">
                    <figure>
                        <img src="/load/${post.photos[0]}"
                             alt="before dinner">
                    </figure>
                </a>
            </#if>
            <div class="b-article-meta">
                <header class="b-article-head">
                <span class="b-article__author">
                    <a href="/my_stories?id=${post.author.id}">${post.author.login}</a>
                </span>
                    <span class="b-article__post-date">
                    March 21,18:45pm
                </span>
                </header>
                <a href="/post?id=${post.id}">
                    <h2 class="b-article-title">
                        Christmas Dinner with Mushroom Risotto and roasted Pumpkin
                    </h2>
                </a>
                <footer class="b-article-info">
                    <div class="b-artcile-likes">
                        <span class="fa fa-heart">${post.likes}</span>
                    </div>
                    <div class="b-artcile-comments">
                        <span class="fa fa-comments">${post.comments?size}</span>
                    </div>
                </footer>
            </div>
        </article>
    </#list>
        </#if>

    </section>


</main>
<!--
    Насчет фуутера отпиши че тут должно быть
 -->
<footer class="b-footer">

</footer>
</body>
<script type="text/javascript">
    function do_search() {
        console.log(1);
        $.ajax({
            url: "/search_ajax",
            data: {"pattern": $("#pattern").val()},
            dataType: "json",
            success: function (result) {
                $("#post_container").html("");
                $("#post_container").append(result.posts);
            },
            error: function (jqXHR, exception) {
                alert("kekkke");
                if (jqXHR.status === 0) {
                    alert('Not connect.\n Verify Network.');
                } else if (jqXHR.status == 404) {
                    alert('Requested page not found. [404]');
                } else if (jqXHR.status == 500) {
                    alert('Internal Server Error [500].');
                } else if (exception === 'parsererror') {
                    alert('Requested JSON parse failed.');
                } else if (exception === 'timeout') {
                    alert('Time out error.');
                } else if (exception === 'abort') {
                    alert('Ajax request aborted.');
                } else {
                    alert('Uncaught Error.\n' + jqXHR.responseText);
                }
            }
        });
    }

    window.onload = function () {
        do_search()
    }



</script>
</html>