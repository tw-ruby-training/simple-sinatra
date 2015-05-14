$('.buttons').on('click', 'li', function(e){
    $('form').removeClass('active')
    if ($(e.currentTarget).hasClass('sign-up-button')){
        $('.sign-up').addClass('active');
    }else {
        $('.sign-in').addClass('active');
    };
});
