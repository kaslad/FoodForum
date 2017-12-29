<#include "base_nav.ftl" >
    <style>
        .b-main-grid {
            width: 60%;
            margin: 0 auto;
        }

        .b-article {
            width: 60%;
        }
    </style>


<div class="about-user">
    <div class="b-profile-img" id="profimg"
         <#if user.photo??>
         style="background-image: url('/load/${user.photo}')">
         </#if>
    </div>
    <div class="about-user-text">
        <div class="about-user-text__el">
            <span class="label_el">Логин:</span> ${user.login}
        </div>
        <div class="about-user-text__el">
            <span class="label_el">E-mail:</span> ${user.email}
        </div>
        <div class="about-user-text__el">
            <span class="label_el">Город:</span> ${user.city}
        </div>
    </div>

</div>
<section class="b-articles b-main-grid">

<#if posts??>
    <#list posts as post>
        <article class="b-article">
            <#if post.photos?size == 1>
                <a href="#">
                    <div class="b-article-img"
                         style="background-image:  url('load/${post.photos[0]}')">
                    </div>

                </a>
            </#if>
            <div class="b-article-meta">
                <header class="b-article-head">
                    <a class="b-article__author" href="">${user.login}</a>
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