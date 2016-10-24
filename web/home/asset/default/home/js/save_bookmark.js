$(document).ready(function(){
    $('.favorite').on('click', function(event){
        if ( $('#login').size() > 0 ) {
            $('#login').modal('show');
        }
        event.preventDefault();
        var id_post = $(this).data('id');
        $this = $(this);
        var url = user_like_aparment_ajax;
        if ($this.hasClass('active')) {
            url = user_unlike_aparment_ajax;
        }
        $.ajax({
            url: url,
            data: {id: id_post},
            dataType: 'json',
            type : 'GET',
            success: function(res){
                if( typeof res != 'undefined' && res.status == 200){
                    if ($this.hasClass('active')) {
                        $('.favorite[data-id = "'+ id_post +'"]').removeClass('active');
                    } else {
                        $('.favorite[data-id = "'+ id_post +'"]').addClass('active');
                    }
                }
            }
        })
    });
})
