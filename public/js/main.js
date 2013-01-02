$(function() {
    $('#card').click(function() {
        $(this).toggleClass('flipped');
    })
    $('#card').hover(
        function() {
            $('.arrow', this).removeClass('out').addClass('hover');
        },
        function() {
            $('.arrow', this).removeClass('hover').addClass('out');
        }
    )
    $('#card a').click(function(e) {
        e.stopPropagation();
    })
})
