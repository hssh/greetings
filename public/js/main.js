$(function() {
    $('#card').click(function() {
        $(this).toggleClass('flipped');
    })
    $('#card a').click(function(e) {
        e.stopPropagation();
    })
})
