/**
 *
 * @authors Your Name (you@example.org)
 * @date    2018-11-23 20:32:48
 * @version $Id$
 */


$(document).on('mousewheel DOMMouseScroll', onMouseScroll);
var scrollRuning = true;

function onMouseScroll(e) {
    if (scrollRuning) {
        scrollRuning = false;
        e.preventDefault();
        //e.originalEvent.wheelDelta 正数向上 幅度为值/120 e.originalEvent.detail负数向上 幅度为值/3
        var wheel = e.originalEvent.wheelDelta || -e.originalEvent.detail;
        var delta = Math.max(-1, Math.min(1, wheel));
        if (delta < 0) { //向下滚动
            console.log('向下滚动');
            $("html").animate({ scrollTop: ($("html").scrollTop() + 790) + "px" }, 500, function() {
                setTimeout(function() {
                    scrollRuning = true;
                }, 100)
            });
        } else { //向上滚动
            console.log('向上滚动');
            $("html").animate({ scrollTop: ($("html").scrollTop() - 790) + "px" }, 500, function() {
                setTimeout(function() {
                    scrollRuning = true;
                }, 100)
            });
        }
    }
}
$('.label').click(function() {
    scrollRuning = false;
    $("html").animate({ scrollTop: ($("html").scrollTop() + 790) + "px" }, 500, function() {
        setTimeout(function() {
            scrollRuning = true;
        }, 100)
    });
});

function movedown() {
    $("html").animate({ scrollTop: ($("html").scrollTop() + 790) + "px" }, 500, function() {
        setTimeout(function() {
            scrollRuning = true;
        }, 100)
    });
}