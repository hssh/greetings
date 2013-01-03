$(function() {
    $('#card .message').hide();
    $('#card').click(function() {
        $('> div', this).toggle();
    })
})
