jQuery.extend({
    form_search: false,
    serializedString: false,
    url_action: false,
    auto_submit: false,
    builderQuerySearch: function(option) {
        if (!option.form_search) {
            var _mess = 'Form element is required';
            //console.log(_mess);
            return _mess;
        }
        this.form_search = option.form_search;

        if (option.serializedString) {
            this.serializedString = option.serializedString;
        } else {
            this.serializedString = $(this.form_search).serialize();
        }

        if (option.url_action) {
            this.url_action = option.url_action;
        } else {
            this.getLinkSubmit();
        }

        if (option.auto_submit) {
            this.auto_submit = option.auto_submit;
        }

        this.url_action += '?' +  this.unserializeForm();

        if (this.auto_submit) {
            window.location.href = this.url_action;
        } else {
            return this.url_action;
        }
    },
    getLinkSubmit: function() {
        this.url_action = $(this.form_search).attr('action') ? $(this.form_search).attr('action') : window.location.protocol + '//' + window.location.hostname + window.location.pathname;
    },
    unserializeForm: function() {
        var str = decodeURI(this.serializedString);
        var pairs = str.split('&');
        var p, idx, val, url = '';

        for (var i = 0, n = pairs.length; i < n; i++) {
            p = pairs[i].split('=');

            idx = p[0];
            if (idx.indexOf("[]") == (idx.length - 2)) {
                var ind = idx.substring(0, idx.length-2);
                url += ind + '[]=' +  p[1] + '&';
            } else {
                if (p[1] != '' && p[1] != null) {
                    url += idx + '=' +  p[1] + '&';
                }
            }
        }
        return url;
    }
});