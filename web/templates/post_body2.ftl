<#list posts as post>

<article class="b-article">
    <#if post.photos?size == 1>
        <a href="/post?id=${post.id}">
            <div class="b-article-img"
                 style="background-image:  url('load/${post.photos[0]}')" >
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