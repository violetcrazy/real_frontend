{%- macro radio(name, id, value, text) %}
    <label for="{{ id }}" class="custom-checkbox">
        <input type="radio" name="{{ name }}" id="{{ id }}" value="{{ value }}">
        <span class="mark"></span>
        <span class="text">{{ text }}</span>
    </label>
{%- endmacro %}

{%- macro checkbox(name, value, text) %}
    <label for="{{ name }}" class="custom-checkbox">
        <input type="checkbox" name="{{ name }}" id="{{ name }}" value="{{ value }}" />
        <span class="mark"></span>
        <span class="text">{{ text }}</span>
    </label>
{%- endmacro %}

{%- macro customSelect(data) %}
    <div class="dropdown custom-select">
        <input type="hidden" id="{{ data['name'] }}" value="{{ data['value'] }}" />
        <button class="btn btn-default btn-block dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="text">{{ data['text_default'] }}</span>
            <span class="arrow"></span>
        </button>
        <ul class="dropdown-menu" aria-labelledby="type-project">
            {% for item in data['list'] %}
                <li class="has-sub"></li>
                <li><a href="" data-value="{{ item['value'] }}">{{ item['text'] }}</a></li>
            {% endfor %}
        </ul>
    </div>
{%- endmacro %}

{% if userSession is not defined %}
    <div id="logup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" class="modal fade model-custom">
        <div role="document" class="modal-dialog">
            <div style="width: 650px" class="modal-content">
                <span aria-hidden="true" data-dismiss="modal" class="close-popup"></span>

                <div class="modal-body">
                    <h3 class="title-model">REGISTER</h3>

                    <form action="{{ url({'for': 'user_sign_up_ajax'}) }}" id="form_signup" class="form-horizontal custom-from" method="POST" enctype="multipart/form-data">
                        <div class="row-type-register">
                            <label for="agent" class="button-esta pull-left">
                                <input type="radio" checked name="type_user" value="2" id="agent" />
                                <span class="mark dis esta-button btn">Agent</span>
                            </label>
                            <span class="user-or">Or</span>
                            <label for="user" class="button-esta pull-right">
                                <input type="radio" name="type_user" value="3" id="user" />
                                <span class="mark dis esta-button btn">User</span>
                            </label>
                            <div class="clearfix"></div>
                        </div>

                        <div class="form-block">
                            <div class="form-group">
                                <label for="frist-name" class="col-xs-2 control-label">First Name</label>
                                <div class="col-xs-10">
                                    <input type="text" name="firstname" id="frist-name" placeholder="Enter first name" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="last-name" class="col-xs-2 control-label">Last Name</label>
                                <div class="col-xs-10">
                                    <input type="text" name="lastname" id="lastname" placeholder="Enter last name" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password" class="col-xs-2 control-label">Password</label>
                                <div class="col-xs-10">
                                    <input type="password" name="password" id="password" placeholder="Enter password" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="birthday" class="col-xs-2 control-label">Birthday</label>

                                <div class="col-xs-10">
                                    <div class="row">
                                        <div class="col-xs-4">
                                            <div class="dropdown custom-select">
                                                <input type="hidden" name="day" />
                                                <button type="button" id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                                                    <span class="text">Day</span>
                                                    <span class="arrow"></span>
                                                </button>

                                                <ul aria-labelledby="type-project" class="dropdown-menu">
                                                    {% for item in 1..31 %}
                                                        {% if item < 10 %}
                                                            {% set item = '0' ~ item %}
                                                        {% endif %}
                                                        <li>
                                                            <a href="" data-value="{{ item }}">{{ item }}</a>
                                                        </li>
                                                    {% endfor %}
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="dropdown custom-select">
                                                <input type="hidden" name="month" />
                                                <button type="button" id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                                                    <span class="text">Month</span>
                                                    <span class="arrow"></span>
                                                </button>

                                                <ul aria-labelledby="type-project" class="dropdown-menu">
                                                    {% for item in 1..12 %}
                                                        {% if item < 10 %}
                                                            {% set item = '0' ~ item %}
                                                        {% endif %}
                                                        <li>
                                                            <a href="" data-value="{{ item }}">{{ item }}</a>
                                                        </li>
                                                    {% endfor %}
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="dropdown custom-select">
                                                <input type="hidden" name="year" />
                                                <button type="button" id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                                                    <span class="text">Year</span>
                                                    <span class="arrow"></span>
                                                </button>

                                                <ul aria-labelledby="type-project" class="dropdown-menu">
                                                    {% for i in date('Y', strtotime('-80 years'))..date('Y', strtotime('-10 years')) %}
                                                        <li>
                                                            <a href="" data-value="{{ i }}">{{ i }}</a>
                                                        </li>
                                                    {% endfor %}
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="email" class="col-xs-2 control-label">Email</label>
                                <div class="col-xs-10">
                                    <input type="email" name="email" id="email" placeholder="Enter your email" class="form-control">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="address" class="col-xs-2 control-label">Address</label>
                                <div class="col-xs-10">
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <div class="dropdown custom-select" id="province_id_select">
                                                <input type="hidden" id="province" name="province">
                                                <button type="button" id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                                                    <span class="text">Choose City or Province</span>
                                                    <span class="arrow"></span>
                                                </button>
                                                <ul aria-labelledby="province_select" class="dropdown-menu">
                                                    {% for item in list_province %}
                                                        <li>
                                                            <a href="" data-value="{{ item['id'] }}">{{ item['name'] }}</a>
                                                        </li>
                                                    {% endfor %}
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-xs-6">
                                            <div class="dropdown custom-select" id="district_id_select">
                                                <input type="hidden" id="dictricts" name="district">
                                                <button type="button" id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block dropdown-toggle">
                                                    <span class="text">Chossen District</span>
                                                    <span class="arrow"></span>
                                                </button>
                                                <ul aria-labelledby="type-project" class="dropdown-menu">
                                                    <li><a href="" data-value="0">Choose District</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="address" class="col-xs-2 control-label"></label>
                                <div class="col-xs-10">
                                    <input type="text" name="address" id="country" placeholder="Enter your address" class="form-control">
                                </div>
                            </div>
                            <div class="form-group text-right job-option">
                                <div class="col-xs-12">
                                    <label for="company" class="custom-checkbox">
                                        <input type="radio" name="job_type" value="1" id="company"><span class="mark"></span><span class="text">Company</span>
                                    </label>
                                    <label for="freelancer" class="custom-checkbox">
                                        <input type="radio" name="job_type" value="2" id="freelancer"><span class="mark"></span><span class="text">Freelancer</span>
                                    </label>
                                </div>
                            </div>

                            <div class="form-group accept-bottom">
                                <label for="rule" class="col-xs-2 control-label"></label>
                                <div class="col-xs-10">
                                    {{ checkbox('ok', '1', 'I agree to the terms of use and privacy policy of the Jinn.') }}
                                </div>
                            </div>

                            <div class="submit-button text-center">
                                <button type="submit" class="esta-button btn medium">Register</button>
                            </div>
                        </div>
                        <input type="hidden" id="user_register_ajax_url" value="" />
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function() {
            $('#agent').on('change', function(){
                if( $(this).is(':checked')) {
                    $('.job-option').fadeIn('fast');
                }
            });

            $('#user').on('change', function(){
                if( $(this).is(':checked')) {
                   $('.job-option').fadeOut('fast');
                }
            });

            //$('#form_signup').on('submit', function(){
             //   if( !$('#ok').is(':checked')) {
             //       /* Lam gi lam i */
             //       return false;
             //   }
            //})

            $('#province_id_select li a').click(function(event) {
                event.preventDefault();
                var province_id = $(this).data('value');
                //console.log('province_id: ', province_id);

                $.ajax({
                    url: '{{ url({ 'for' : 'get_district'}) }}',
                    type: 'get',
                    data: {'province_id': province_id},
                    success: function(data) {
                        $('#dictricts').val('').closest('.dropdown').find('ul').html(data);
                        $('#dictricts').closest('.dropdown').find('.btn .text').text('Chọn quận huyện');
                    }
                });
            });
        });
    </script>
{% endif %}