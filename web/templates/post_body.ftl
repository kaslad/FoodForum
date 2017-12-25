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