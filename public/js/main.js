Modernizr.load({
  test: Modernizr.csstransforms3d,
  yep : '/js/flip-card.js',
  nope: '/js/replace-card.js'
});

$(function() {
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
