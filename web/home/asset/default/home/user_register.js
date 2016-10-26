$(document).ready(function() {
    var process = false;
    $('.block-login').hide();

    $(document).on("blur", "#form_register_phone", function() {
        var phone = $.trim($(this).val());
        var message = 'Số điện thoại ' + phone + ' đã được đăng ký. Vui lòng bấm vào đây để <a href="' + $('#user_login_url').val() + '">Đăng nhập</a> hoặc <a href="' + $('#user_forget_password_url').val() + '">Thay đổi mật khẩu</a>.';

        if (phone != "" && !process) {
            process = true;

            $.ajax({
                "url": $('#load_check_phone_ajax_url').val(),
                "type": "GET",
                "data": {"phone": phone},
                "success": function(response) {
                    if (typeof response != "undefined") {
                        if (response.status != 200) {
                            $("#form_register #error_phone").html(message).show();
                        } else {
                            $("#form_register #error_phone").text("").hide();
                        }
                    } else {
                        alert('An unknown error occurred, please try again.');
                    }
                }
            }).done(function() {
                process = false;
            });
        }
    });

    $(document).on("blur", "#form_register_email", function() {
        var email = $.trim($(this).val());

        if (email != "" && !process) {
            process = true;

            $.ajax({
                "url": $('#load_check_email_ajax_url').val(),
                "type": "GET",
                "data": {"email": email},
                "success": function(response) {
                    if (typeof response != "undefined") {
                        if (response.status != 200) {
                            $("#form_register #error_email").text(response.message).show();
                        } else {
                            $("#form_register #error_email").text("").hide();
                        }
                    } else {
                        alert('An unknown error occurred, please try again.');
                    }
                }
            }).done(function() {
                process = false;
            });
        }
    });

    $(document).on('keypress', '#form_register', function(e) {
        if (e.which == 13) {
            $('#form_register_button_submit').trigger('click');
        }
    });

    $(document).on('click', '#form_register_button_submit', function() {
        if (!process) {
            process = true;
            $('body').addClass('loading-ajax');

            $('#form_register .alert').text('').hide();
            $('#form_register .error-message').text('').hide();

            $.ajax({
                'url': $('#user_register_ajax_url').val(),
                'type': 'POST',
                'data': $('#form_register').serialize(),
                'success': function(response) {
                    if (typeof response != 'undefined') {
                        if (response.status != 200) {
                            $('#form_register_alert_message').text(response.message).show();

                            if (typeof response.result != 'undefined') {
                                $.each(response.result, function(key, value) {
                                    $('#form_register #error_' + key).text(value).show();
                                });
                            }

                            $('body, html').animate({'scrollTop': 0}, 800);
                            return false;
                        } else {
                            if (typeof response.result != 'undefined') {
                                window.location.href = response.result.referral_url;
                            }
                        }
                    } else {
                        alert('An unknown error occurred, please try again.');
                    }
                }
            }).done(function() {
                process = false;
                $('body').removeClass('loading-ajax');
            });
        }
    });
});

