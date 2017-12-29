<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Creat Post</title>
    <link rel="stylesheet" href="css/create_post.css">

</head>
<body>
<#include "base_nav.ftl">
<!--         ////////////////////////////////////////////////       -->

<section class="be-post" id="epost">
    <header class="be-post-header">
        <a href="/" class="meta-author">
            <div class="meta-author-ava">
                <img src="https://media.vanityfair.com/photos/589b6a2b1fce8b83738d9c5f/master/pass/t-reese-witherspoon-daughter-ava-big-little-lies-premiere.jpg"
                     alt="user avatar" class="ava">
            </div>
            <div class="meta-author-name">
                ${post.author.login}
            </div>
        </a>
        <span class="a-edit"><i class="fa fa-pencil-square-o" id="edit-button"></i></span>
    </header>
    <div class="be-post-body">
        <form method="POST" enctype="multipart/form-data">

            <div class="fileload">
                <input type="file" id="image"  multiple accept="image/*" name="photo" class="hid" onchange="handleFiles(this.files)" >
                <label for="image">Загрузить изображение</label>
            </div>

        <div id="preview">

        </div>
            <table class="ep-table" align="center">
                <tr>
                    <td>
                        <textarea name="text" id="eptext" cols="1000" rows="1000" placeholder="Содержимое поста..."></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" id="eptags" name="tags" placeholder="#tag1 #tag2">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" class="ep-submit" >
                    </td>
                </tr>

            </table>
        </form>
    </div>

    <script>
        "use strict";
        function handleFiles(files) {
            var imageType = /^image\//;
            var file = files[0];
            if (!imageType.test(file.type.match)) {
                var img = document.createElement("img");
                img.classList.add("obj");
                img.file = file;
                preview.style.height="17.5vw";
                preview.appendChild(img); // Assuming that "preview" is the div output where the content will be displayed.

                var reader = new FileReader();
                reader.onload = (function (aImg) {
                    return function (e) {
                        aImg.src = e.target.result;
                    };
                })(img);
                reader.readAsDataURL(file);
            }
        }
    </script>
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
        searching.addEventListener("click", do_search);

    </script>
</section>

<!--         ////////////////////////////////////////////////       -->
<#include "base_footer.ftl">

</body>
</html>