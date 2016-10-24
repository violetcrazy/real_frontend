<div id="logup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" class="modal fade model-custom">
    <div role="document" class="modal-dialog">
        <div style="width: 650px" class="modal-content"><span aria-hidden="true" data-dismiss="modal" class="close-popup"></span>
            <div class="modal-body">
                ĐĂNG KÝ {{ province[0] }}

                <form id="form_signup" class="form-horizontal custom-from">

                        <label for="agent" class="button-esta pull-left">
                            <input type="radio" checked name="type_user" value="agent" id="agent"><span
                                    class="mark dis esta-button btn"> AGENT</span>
                        </label>
                        <span class="or">Or</span>
                        <label for="user" class="button-esta pull-right">
                            <input type="radio" name="type_user" value="user" id="user"><span
                                    class="mark dis esta-button btn"> USER</span>
                        </label>

                        <div class="clearfix"></div>

                    <div class="form-block">
                        <div class="form-group has-error">
                            <label for="frist-name" class="col-xs-2 control-label">Họ</label>

                            <div class="col-xs-10">
                                <input type="email" id="frist-name" placeholder=" * This info can't be blank"
                                       class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="frist-name" class="col-xs-2 control-label">Tên</label>

                            <div class="col-xs-10">
                                <input type="email" id="frist-name" placeholder="Last name" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="frist-name" class="col-xs-2 control-label">Mật khẩu</label>

                            <div class="col-xs-10">
                                <input type="email" id="frist-name" placeholder="Password" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="frist-name" class="col-xs-2 control-label">Ngày sinh</label>

                            <div class="col-xs-10">
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="dropdown custom-select">
                                            <input type="hidden" id="undefined" name="">
                                            <button type="button" id="" data-toggle="dropdown" aria-haspopup="true"
                                                    aria-expanded="false"
                                                    class="btn btn-default btn-block dropdown-toggle"><span
                                                        class="text">Ngày</span><span class="arrow"></span></button>
                                            <ul aria-labelledby="type-project" class="dropdown-menu">
                                                <li><a href="" data-value="0">0</a></li>
                                                <li><a href="" data-value="1">1</a></li>
                                                <li><a href="" data-value="2">2</a></li>
                                                <li><a href="" data-value="3">3</a></li>
                                                <li><a href="" data-value="4">4</a></li>
                                                <li><a href="" data-value="5">5</a></li>
                                                <li><a href="" data-value="6">6</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="dropdown custom-select">
                                            <input type="hidden" id="undefined" name="">
                                            <button type="button" id="" data-toggle="dropdown" aria-haspopup="true"
                                                    aria-expanded="false"
                                                    class="btn btn-default btn-block dropdown-toggle"><span
                                                        class="text">Tháng</span><span class="arrow"></span></button>
                                            <ul aria-labelledby="type-project" class="dropdown-menu">
                                                <li><a href="" data-value="0">0</a></li>
                                                <li><a href="" data-value="1">1</a></li>
                                                <li><a href="" data-value="2">2</a></li>
                                                <li><a href="" data-value="3">3</a></li>
                                                <li><a href="" data-value="4">4</a></li>
                                                <li><a href="" data-value="5">5</a></li>
                                                <li><a href="" data-value="6">6</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="dropdown custom-select">
                                            <input type="hidden" id="undefined" name="">
                                            <button type="button" id="" data-toggle="dropdown" aria-haspopup="true"
                                                    aria-expanded="false"
                                                    class="btn btn-default btn-block dropdown-toggle"><span
                                                        class="text">Năm</span><span class="arrow"></span></button>
                                            <ul aria-labelledby="type-project" class="dropdown-menu">
                                                <li><a href="" data-value="0">1990</a></li>
                                                <li><a href="" data-value="1">1992</a></li>
                                                <li><a href="" data-value="2">1994</a></li>
                                                <li><a href="" data-value="3">1996</a></li>
                                                <li><a href="" data-value="4">1998</a></li>
                                                <li><a href="" data-value="5">2000</a></li>
                                                <li><a href="" data-value="6">2002</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="frist-name" class="col-xs-2 control-label">Email</label>

                            <div class="col-xs-10">
                                <input type="email" id="frist-name" placeholder="Email" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="frist-name" class="col-xs-2 control-label">Email</label>

                            <div class="col-xs-10">
                                <input type="email" id="frist-name" placeholder="Email" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="frist-name" class="col-xs-2 control-label">Địa chỉ</label>

                            <div class="col-xs-10">
                                <div class="row">
                                    <div class="col-xs-6">
                                        <div class="dropdown custom-select">
                                            <input type="hidden" id="province" name="">
                                            <button type="button" id="" data-toggle="dropdown" aria-haspopup="true"
                                                    aria-expanded="false"
                                                    class="btn btn-default btn-block dropdown-toggle"><span
                                                        class="text">Thành phố</span><span class="arrow"></span></button>
                                            <ul aria-labelledby="type-project" class="dropdown-menu">
                                                <li><a href="" data-value="0">H? Ch� Minh</a></li>
                                                <li><a href="" data-value="1">H� N?i</a></li>
                                                <li><a href="" data-value="2">H?i Ph�ng</a></li>
                                                <li><a href="" data-value="3">Ninh Thu?n</a></li>
                                                <li><a href="" data-value="4">Kh�nh H�a</a></li>
                                                <li><a href="" data-value="5">B�nh Thu?n</a></li>
                                                <li><a href="" data-value="6">Ti?n Giang</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-xs-6">
                                        <div class="dropdown custom-select">
                                            <input type="hidden" id="dictricts" name="">
                                            <button type="button" id="" data-toggle="dropdown" aria-haspopup="true"
                                                    aria-expanded="false"
                                                    class="btn btn-default btn-block dropdown-toggle"><span
                                                        class="text">Quận</span><span class="arrow"></span>
                                            </button>
                                            <ul aria-labelledby="type-project" class="dropdown-menu">
                                                <li><a href="" data-value="0">0</a></li>
                                                <li><a href="" data-value="1">1</a></li>
                                                <li><a href="" data-value="2">2</a></li>
                                                <li><a href="" data-value="3">3</a></li>
                                                <li><a href="" data-value="4">4</a></li>
                                                <li><a href="" data-value="5">5</a></li>
                                                <li><a href="" data-value="6">6</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="frist-name" class="col-xs-2 control-label">Quốc gia</label>

                            <div class="col-xs-10">
                                <input type="email" id="frist-name" placeholder="Country" class="form-control">
                            </div>
                        </div>
                        <div class="form-group text-right">
                            <div class="col-xs-12">
                                <label for="company" class="custom-checkbox">
                                    <input type="radio" name="jod" id="company"><span class="mark"></span><span
                                            class="text">Company</span>
                                </label>
                                <label for="freelancer" class="custom-checkbox">
                                    <input type="radio" name="jod" id="freelancer"><span class="mark"></span><span
                                            class="text">Freelancer</span>
                                </label>
                            </div>
                        </div>
                        <div class="form-group accept-bottom">
                            <label for="frist-name" class="col-xs-2 control-label"></label>

                            <div class="col-xs-10">
                                <label for="ok" class="custom-checkbox">
                                    <input type="checkbox" name="ok" id="ok" />
                                    <span class="mark"></span>
                                    <span class="text">I accept ESTA's Terms of Use and Privacy Policy.</span>
                                </label>
                            </div>
                        </div>
                        <div class="submit-button text-center">
                            <button type="submit" class="esta-button btn medium">Đăng ký</button>
                        </div>
                    </div>
                    <input type="hidden" id="user_register_ajax_url" value="{{ url({'for': 'user_register_ajax'}) }}" />
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="{{ config.application.base_url ~ 'asset/default/js/home/user_register.min.js' }}"></script>
