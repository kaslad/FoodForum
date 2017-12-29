<!--     Начало footer tfl      -->
</main>
<!--
    Насчет фуутера отпиши че тут должно быть
 -->
<footer class="b-footer">
    <a href="https://vk.com/foodstr" title="Чья-то группа в Вконтакте">
        <span class="fa fa-vk"></span>
    </a>
    <p class="dev-team">
        Лучше поздно, чем никогда! © DEV TEAM "ПОЛЮБАС УСПЕЕМ"
    </p>

</footer>
<script type="text/javascript">
    console.log(1);

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

    function eventFire(el, etype) {
        if (el.fireEvent) {
            el.fireEvent('on' + etype);
        } else {
            var evObj = document.createEvent('Events');
            evObj.initEvent(etype, true, false);
            el.dispatchEvent(evObj);
        }
        console.log("dec");
    }

   // eventFire(document.getElementById('#btnsearch'), 'click');

    do_search();
    searching.addEventListener("click", do_search);

    //$('#btnsearch2').trigger("click")



    //
    //
    // searching.addEventListener("click", do_search);


</script>
<script>
    <!-- Тут уж сам смотри с чем сравнивать href -->
    window.onload = function (event) {
        for (let i = 0; i < navigataion.children.length; i++)
            if (navigataion.children[i].children[0].getAttribute('href') == '')
                navigataion.children[i].children[0].classList.add('active-item');
    }
</script>
</body>
</html>