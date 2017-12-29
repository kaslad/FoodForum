<#include "base_nav.ftl">

<div class="b-profile">
    <form method="POST" enctype="multipart/form-data" accept-charset="UTF-8">
        <fieldset>
            <legend>
                Ваш профиль:
            </legend>
            <div class="b-profile-img" id="profimg"
                 style="background-image: url('/load/${user.photo}');">
                <!-- В url адрес картинки -->
            </div>
            <input type="file" id="image" accept="image/*" name="photo" class="hide" onchange="handleFiles(this.files)">
            <label for="image" class="def-btn b-e-post__inp-file_pseudo">Изменить аватар</label>



            <div class="input-gr">
                <label for="userlogin">
                    <span class="l-text">Логин</span>
                    <span class="fa fa-user hide"></span>
                </label>
                <input class="dis-def" type="text" id="userlogin" value="${user.login}" name="login">
            </div>

            <div class="input-gr">
                <label for="useremail">
                    <span class="l-text">E-mail</span>
                    <span class="fa fa-envelope hide"></span>
                </label>
                <input class="dis-def" type="email" id="useremail" value="${user.email}" name="email">
            </div>

            <div class="input-gr">
                <label for="userpassword">
                    <span class="l-text">Пароль</span>
                    <span class="fa fa-lock hide"></span>
                </label>
                <input class="dis-def" type="password" id="userpassword" value="${user.password}" name="password">
            </div>

            <div class="input-gr">
                <label for="usercity">
                    <span class="l-text">Город</span>
                    <span class="fa fa-building hide"></span>
                </label>
                <input class="dis-def" type="text" id="usercity" value="${user.city}" name="city">
            </div>
            <input type="submit" class="def-btn b-e-post__submit" value="Сохранить">
        </fieldset>
    </form>
    <script>
        "use strict";

        function handleFiles(files) {
            var imageType = /^image\//;
            if (!imageType.test(files[0].type.match)) {
                var reader = new FileReader();
                reader.onload = function (e) {

                    profimg.style.backgroundImage = "url(" + e.target.result + ")";
                };
                reader.readAsDataURL(files[0]);
            }
        }
    </script>
</div>
<#include "base_footer.ftl">