<#include "base_nav.ftl">
<!--         ////////////////////////////////////////////////       -->


<div class="b-e-post-container">
    <section class="b-e-post" id="editpost">
        <header class="b-e-post-header">
            <a href="/my_stories?id=${post.author.id}" class="meta-author">
                <div class="meta-author-photo">

                    <!-- Здесь в url() -->
                    <div class="author-photo adaptive-bg-img"
                    <#if post.author.photo??>
                         style="background-image: url('/load/${post.author.photo}');">
                    </#if>
                    </div>

                </div>
                <div class="ib-gr">
                    <div class="meta-author-name">
                    ${post.author.login}
                    </div>
                    <span class="b-single-post__post-date">
                    ${post.time}
                </span>
                </div>
            </a>
            <!-- ВАЖНО, ЧТОБЫ ЭТО -->
        <#if post.author.id == user.id>

            <span class="a-edit" id="e-btn"
                  onclick="posteditform.classList.toggle('hide'); singlepost.classList.toggle('hide')">
        <i class="fa fa-pencil-square-o"></i>
        </span>
        </#if>

            <!-- ПОДГРУЖАЛОСТЬ ТОЛЬКО ЕСЛИ АВТОР ПОСТА ОТКРЫЛ ЕГО, А НЕ ЛЮБОЙ ПОЛЬЗОВАТЕЛЬ -->

        </header>
    <#if post.author.id == user.id>
        <!-- ВАЖНО, ЧТОБЫ ЭТО -->
        <div id="posteditform" class="hide">
            <form method="POST" enctype="multipart/form-data" class="b-e-post-body">
                <input type="file" id="image" accept="image/*" name="photo" class="hide"
                       onchange="handleFiles(this.files) " required>
                <label for="image" class="def-btn b-e-post__inp-file_pseudo">Загрузить изображение</label>
                <div onclick="this.classList.toggle('resize-preview');this.children[0].style.height=(this.classList.contains('resize-preview')) ? '100%':'30vw'">
                    <div id="preview" class="preview adaptive-bg-img nohide"
                        <#if post.photos??>
                         style="background-image: url('/load/${post.photos[0]}')">
                        </#if>
                        <!--    -->
                    </div>
                </div>
                <textarea name="text" class="b-e-post__text" cols="1000" rows="1000"
                          placeholder="Содержимое поста...">${post.text}</textarea>

                <input type="text" class="b-e-post__tags" name="tags" placeholder="#tag1 #tag2"
                       value="${post.tagsToString()}">

                <input type="submit" class="def-btn b-e-post__submit">

            </form>
        </div>
        <script>
            "use strict";

            function handleFiles(files) {
                var imageType = /^image\//;
                if (!imageType.test(files[0].type.match)) {
                    preview.style.height = "30vw";
                    preview.classList.remove("hide");
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        preview.style.backgroundImage = "url(" + e.target.result + ")";
                    };
                    reader.readAsDataURL(files[0]);
                }
            }
        </script>
        <!-- ПОДГРУЖАЛОСТЬ ТОЛЬКО ЕСЛИ АВТОР ПОСТА ОТКРЫЛ ЕГО, А НЕ ЛЮБОЙ ПОЛЬЗОВАТЕЛЬ -->
    </#if>
    </section>

    <article class="b-single-post" id="singlepost">
        <div class="b-single-post-img ">
        <#if post.photos??>
                <img src="/load/${post.photos[0]}" alt="">
            </#if>

            <!-- В url адрес картинки -->
        </div>
        <div class="b-single-post-body">
            <p class="b-single-post-text">
            ${post.text}
            </p>

        </div>

        <footer class="b-single-post-comments">
            <div class="b-single-post-action">
                <button onclick="inc_likes(this.id)" id="likes_button" class="b-single-post-likes">
                    <span class="fa fa-heart"></span> ${post.likes}
                </button>
                <span class="delimiter">

            </span>
                <button onclick="" id="openpanel" class="b-single-post-opanel">
                    <span class="fa fa-comments"></span> ${post.comments?size}
                </button>
            </div>
            <div class="b-single-post-comments-panel">
                <div class="b-single-post-add-comment">
                <textarea class="b-single-post-new-comment" rows="3" cols="1000" placeholder="Комментарий..."
                          id="snd_comm"></textarea>
                    <button class="push-new-comment" onclick="send_comment()">
                        Добавить комментарий
                    </button>
                </div>
                <div class="b-single-post-comments-area" id="commentsarea">
                <span class="b-single-post-comments-area__title">
                    Комментарии
                </span>

                <#list post.comments as comment>
                    <div class="s-comment">
                        <h3 class="s-comment-author">
                            <a href="">${comment.author.login}</a>
                        </h3>
                        <p class="s-comment-text">
                        ${comment.text}
                        </p>
                    </div>
                </#list>
                </div>
            </div>
        </footer>
    </article>
</div>

<!--         ////////////////////////////////////////////////       -->
<script type="text/javascript">
    function inc_likes(button_idk) {
        console.log(1);
        $.ajax({
            url: "/incrementlikes",
            data: {"likes": "${post.likes}", "id": "${post.id}"},
            dataType: "json",
            success: function (result) {

                var el = document.getElementById(button_idk);
                //el.firstChild.data = "kek";
            },
            error: function (jqXHR, exception) {
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


    function send_comment() {

        console.log(1);
        $.ajax({
            url: "/add/comment",
            data: {"text": $("#snd_comm").val(), "post_id": "${post.id}"},
            dataType: "json",
            success: function (result) {
                console.log("here");
                $("#snd_comm").val("" +
                        "");
                var str = "<div class=\"s-comment\">\n" +
                        "                        <h3 class=\"s-comment-author\">\n" +
                        "                            <a href=\"\">" + result.login + "</a>\n" +
                        "                        </h3>\n" +
                        "                        <p class=\"s-comment-text\">\n" + result.text +
                        " </p>\n"+
                        "</div>";

                $("#commentsarea span:first-child").after(str);
            },
            error: function (jqXHR, exception) {
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
        console.log("2")
    }
</script>
<#include "base_footer.ftl">



