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
<#include "base_nav.ftl">

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
<#include "base_footer.ftl">
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