{% set img_dir = config.asset.frontend_url ~ 'desktop/version-1.0/template/html_project/asset/img/' %}

<div class="top-header">
    <div class="container">

        <div class="pull-left item-dropdown">
            <div class="dropdown custom-select menu">
                <input type="hidden" name="en"/>
                <button type="button" id="en" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                    <span class="text">ENG</span>
                    <span class="arrow"></span>
                </button>
                <ul aria-labelledby="type-project" class="dropdown-menu">
                    <li class="active" ><a>ENG</a></li>
                    <li><a href="{{ urlCurrent }}vi" data-value="vi">VI</a></li>
                </ul>
            </div>
        </div>
        {#
        <div class="pull-left item-dropdown">
            <div class="dropdown custom-select menu">
                <input type="hidden" name="vnd"/>
                <button type="button" id="vnd" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                    <span class="text">VND</span>
                    <span class="arrow"></span>
                </button>
                <ul aria-labelledby="type-project" class="dropdown-menu">
                    <li><a href="" data-value="usd">USD</a></li>
                    <li><a href="" data-value="vnd">VND</a></li>
                </ul>
            </div>
        </div>
        #}

        {% if userSession is not defined %}
            <div class="pull-right item-dropdown login">
                <a href="" data-toggle="modal" id="link-login" data-target="#login">Sign In / Sign Up</a>
            </div>
        {% endif %}

        {% if userSession is not empty %}
            {% set controllerName = router.getControllerName() %}
            {% set actionName = router.getActionName() %}

            <div class="pull-right item-dropdown user">
                <div class="dropdown custom-select menu">
                    <input type="hidden" name="name" />
                    <button type="button" id="name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                        <span class="text">{{ userSession['name'] }}</span>
                        <span class="arrow"></span>
                    </button>

                    <ul aria-labelledby="type-project" class="dropdown-menu">
                        <li>
                            <a class="{{ controllerName == user and actionName == 'profile' ? 'active' : '' }}" href="{{ url({'for' : 'user_profile'}) }}">
                                Basic Info
                            </a>
                        </li>
                        <li>
                            <a class="{{ controllerName == user and actionName == 'purchasedProperties' ? 'active' : '' }}" href="{{ url({'for' : 'user_purchased_properties'}) }}">
                                Purchased Properties
                            </a>
                        </li>
                        <li>
                            <a class="{{ controllerName == user and actionName == 'saveHome' ? 'active' : '' }}" href="{{ url({'for' : 'user_save_home'}) }}">
                                Saved Homes
                            </a>
                        </li>
                        <li>
                            <a class="{{ controllerName == user and actionName == 'saveSearch' ? 'active' : '' }}" href="{{ url({'for' : 'user_save_search'}) }}">
                                Saved Searchs
                            </a>
                        </li>
                        <li>
                            <a class="{{ controllerName == user and actionName == 'message' ? 'active' : '' }}" href="{{ url({'for' : 'user_message'}) }}">
                                Messages
                            </a>
                        </li>
                        <li>
                            <a class="{{ controllerName == user and actionName == 'edit' ? 'active' : '' }}" href="{{ url({'for' : 'user_edit'}) }}">
                                Settings
                            </a>
                        </li>
                        <li>
                            <a href="{{ url({'for': 'user_logout'}) }}">
                                Logout
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="pull-right item-dropdown">
                <a class="notify">
                    <span class="icon-notify icon"></span>
                    <span class="count">{{ countMessage }}</span>
                </a>
            </div>

            <div class="pull-right item-dropdown">
                <a class="notify">
                    <span class="icon-home icon"></span>
                    {#<span class="count">3</span>#}
                </a>
            </div>
        {% endif %}
    </div>
</div>

{% set controllerName = router.getControllerName() %}
{% set actionName = router.getActionName() %}

<div class="header header-site">
    <div class="container">
        <div class="logo pull-left">
            <a href="{{ url({'for': 'home'}) }}">
                <img src="{{ img_dir }}logo.png?{{ config.asset.version }}" alt="" />
            </a>
        </div>

        <div class="main-menu pull-right">
            <div class="wrap-menu">
                <ul class="menu">
                    <li>
                        <a href="{{ url({'for': 'project_list'}) }}" class="{{ controllerName == 'project' and actionName == 'list' ? 'active' : '' }}">
                            PROJECT
                        </a>
                    </li>

                    <li>
                        <a href="{{ url({'for': 'apartment_buy'}) }}" class="{{ controllerName == 'apartment' and actionName == 'buy' ? 'active' : '' }}">
                            BUY
                        </a>
                    </li>

                    <li>
                        <a href="{{ url({'for': 'apartment_rent'}) }}" class="{{ controllerName == 'apartment' and actionName == 'rent' ? 'active' : '' }}">
                            RENT
                        </a>
                    </li>

                    <li>
                        <a href="{{ url({'for': 'user_list_agent'}) }}" class="{{ controllerName == 'user' and actionName == 'listAgent' ? 'active' : '' }}">
                            FIND AGENT
                        </a>
                    </li>

                    <li>
                        <a href="{{ url({'for': 'article_list_news'}) }}" class="{{ controllerName == 'article' and actionName == 'listByCategory' ? 'active' : '' }}">
                            NEWS
                        </a>
                    </li>

                    <li>
                        <a href="{{ url({'for': 'contact'}) }}" class="{{ controllerName == 'contact' and actionName == 'index'  ? 'active' : '' }}">
                            CONTACT
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>

<div id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" class="modal fade model-custom">
    <div role="document" class="modal-dialog">
        <div style="width: 650px" class="modal-content">
            <span aria-hidden="true" data-dismiss="modal" class="close-popup"></span>

            <div class="modal-body">
                <h3 class="title-model">Login</h3>

                <form id="form_signin" class="form-horizontal custom-from">
                    <div class="form-block">
                        <div id="login-alert-message"></div>
                        <div class="form-group username">
                            <label for="frist-name" class="col-xs-2 control-label">Email</label>
                            <div class="col-xs-10">
                                <input type="text" name="username" id="username" placeholder="Email" class="form-control" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="frist-name" class="col-xs-2 control-label">Password</label>
                            <div class="col-xs-10">
                                <input type="password" name="password" id="password" placeholder="Password" class="form-control" />
                            </div>
                        </div>

                        <div class="form-group text-left checkbox-left">
                            <div class="col-xs-10 col-xs-push-2">
                                <label for="remember" class="custom-checkbox">
                                    <input type="radio" name="remember_me" id="remember" />
                                    <span class="mark"></span>
                                    <span class="text">Save password</span>
                                </label>
                                <a href="" data-toggle="modal" data-target="#forgot" aria-hidden="true" data-dismiss="modal" class="text-danger link-forgot-pass">
                                    Forgot password?
                                </a>
                            </div>
                        </div>

                        <div class="form-group submit-button text-center">
                            <button type="submit" class="esta-button btn medium">Login</button>
                        </div>

                        <div class="text-center">
                            Don't have an account?
                            <a href="" data-toggle="modal" data-target="#logup" aria-hidden="true" data-dismiss="modal" class="text-danger">
                                <b>Register</b>
                            </a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="forgot" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" class="modal fade model-custom">
    <div role="document" class="modal-dialog">
        <div style="width: 650px" class="modal-content">
            <span aria-hidden="true" data-dismiss="modal" class="close-popup"></span>

            <div class="modal-body">
                <form id="form_forgot" class="form-horizontal custom-from">
                    <div class="intro-form text-center">
                        <h3 class="title-center">Reset Password</h3>
                        <div class="text-intro">
                            Please enter the email address you used to register your account. We'll send you the link to activate your password.
                        </div>
                    </div>
                    <div class="form-block">
                        <div id="forgot-password-alert-message"></div>
                        <div class="form-group forgot-password">
                            <label for="email" class="col-xs-2 control-label">Email</label>
                            <div class="col-xs-10">
                                <input type="email" name="email" id="email" placeholder="Enter your email" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group submit-button text-center">
                            <button type="submit" class="esta-button btn medium">Send</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var url_signin_ajax = '{{ url({'for': 'user_sign_in_ajax'}) }}';
    var url_signup_ajax = '{{ url({'for': 'user_sign_up_ajax'}) }}';
    var url_forgot_ajax = '{{ url({'for': 'user_forgot_password_ajax'}) }}';
    var url_profile = '{{ url({'for': 'user_profile'}) }}';
    var url_home = '{{ url({'for': 'home'}) }}';
</script>

<script type="text/javascript">
    $(document).ready(function() {
        $(document).on('submit', '#form_signin', function(event) {
            event.preventDefault();
            $this = $(this);
            var data = $this.serialize();

            $.ajax({
                url: url_signin_ajax,
                data: data,
                type: 'POST',
                success: function(response) {
                    if (typeof response != "undefined") {
                        if (response.status == 200) {
                            window.location.href = response.result.referral_url;
                        } else {
                            var html = '<div class="alert alert-danger">' + response.message + '</div>';

                            $("#login-alert-message").html(html).show();
                            $this.find('.form-group').removeClass('has-error');

                            if (typeof response.result != "undefined") {
                                $.each(response.result, function(key, value){
                                    $this.find('[name="' + key + '"]').val('').attr('placeholder', value).closest('.form-group').addClass('has-error');
                                });
                            }
                        }
                    } else {
                        alert('An unknown error occurred, please try again.');
                    }
                }
            });
        });

        $(document).on('submit', '#form_signup', function(event) {
            event.preventDefault();
            $this = $(this);
            var data = $this.serialize();

            $.ajax({
                url: url_signup_ajax,
                data: data,
                type: 'POST',
                success: function(response) {
                    if (typeof response != "undefined") {
                        if (response.status == 200) {
                             $this.fadeOut('fast', function() {
                                var html = '\
                                    <div class="intro-form text-center">\
                                        <h3 class="title-center">Thank You!</h3>\
                                        <p class="text-intro">Now you can access all the services of the Jinn.</p>\
                                        <br />\
                                        <div class="form-block text-center">\
                                            <a href="' + url_home + '" class="esta-button btn">Back to Home </a>&#160 &#160\
                                            <a href="' + url_profile + '" class="esta-button btn">Back to profile</a>\
                                        </div>\
                                    </div>';

                                $this.closest('.modal-body').html(html);
                            });
                        } else {
                            $("#form_signin #error_phone").text("").hide();
                            $this.find('.form-group').removeClass('has-error');

                            $.each(response.result, function(key, value){
                                $this.find('[name="' + key + '"]').attr('placeholder', value).closest('.form-group').addClass('has-error');
                            });
                        }
                    } else {
                        alert('An unknown error occurred, please try again.');
                    }

                }
            });
        });

        $(document).on('submit', '#form_forgot', function(event) {
            event.preventDefault();
            $this = $(this);
            var data = $this.serialize();

            $.ajax({
                url: url_forgot_ajax,
                data: data,
                type: 'POST',
                success: function(response) {
                    if (typeof response != "undefined") {
                        if (response.status == 200) {
                             var html = '\
                                <div class="intro-form text-center">\
                                    <h3 class="title-center">You have successfully reset your password!</h3>\
                                    <p class="text-intro">We\'ve sent you an email. Please check your email to retrieve your password.</p>\
                                    <br />\
                                    <div className="form-block text-center">\
                                        <a href="" class="esta-button btn">Back</a>\
                                    </div>\
                                </div>';

                            $this.closest('.modal-body').html(html);
                        } else {
                            var html = '<div class="alert alert-danger">' + response.message + '</div>';
                            $("#forgot-password-alert-message").html(html).show();
                            $(".forgot-password").addClass('has-error');
                        }
                    } else {
                        alert('An unknown error occurred, please try again.');
                    }
                }
            });
        });
    });
</script>
