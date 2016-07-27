$document = $(document);
$document.ready(function(){
    $('.limit_select').on('click', function() {
        var new_limit = $('#limit').val(),
            data_limit = $('#limit').attr('data-limit');
        if (limit != new_limit) {
            //$('#limit').attr('data-limit', new_limit);
            //$('#limit').val(new_limit);
            $('#form-search').submit()
        }
    });
});