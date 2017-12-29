<#include "base_nav.ftl">
<!--         ////////////////////////////////////////////////       -->

<section class="b-e-post" id="editpost">
    <header class="b-e-post-header">
        <a href="/" class="meta-author">
            <div class="meta-author-photo">

                <!-- Здесь в url() -->
                <div class="author-photo adaptive-bg-img"
                <#if post.author.photo??>
                     style="background-image: url('/load/${post.author.photo[0]}');">
                </#if>                </div>

            </div>
            <div class="meta-author-name">
            ${post.author.login}
            </div>
        </a>
        <span class="a-edit" id="e-btn">
            <i class="fa fa-pencil-square-o"></i>
        </span>
    </header>

    <form method="POST" enctype="multipart/form-data" class="b-e-post-body">
        <input type="file" id="image" accept="image/*" name="photo" class="hide" onchange="handleFiles(this.files)" required>
        <label for="image" class="def-btn b-e-post__inp-file_pseudo">Загрузить изображение</label>
        <div onclick="this.classList.toggle('resize-preview');this.children[0].style.height=(this.classList.contains('resize-preview')) ? '100%':'30vw'">
            <div id="preview" class="preview adaptive-bg-img hide"></div>
        </div>
        <textarea name="text" class="b-e-post__text" cols="1000" rows="1000"
                  placeholder="Содержимое поста..."></textarea>

        <input type="text" class="b-e-post__tags" name="tags" placeholder="#tag1 #tag2">

        <input type="submit" class="def-btn b-e-post__submit">

    </form>

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
</section>

<!--         ////////////////////////////////////////////////       -->
<#include "base_footer.ftl">
