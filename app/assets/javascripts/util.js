function listen_enter() {
    $('.disable-enter').keydown(function (e) {
        if (e.keyCode == 13 && is_submit_btn_able()) {
            e.preventDefault();
        }
    });

    function is_submit_btn_able() {
        return $(".disable-enter").parents("form").find('input[type=submit]').prop('disabled');
    }
}
$(document).ready(function () {
    listen_enter();
});

