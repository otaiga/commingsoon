$(document).ready(function(){
        // scroll body to 0px on click
        $('#up').click(function () {
            $('body,html').animate({
                scrollTop: 0
            }, 800);
            return false;
        });
});

