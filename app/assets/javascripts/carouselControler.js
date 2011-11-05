//= require jquery
//= require_tree .


$(document).ready(function() {

    //rotation speed and timer
    var speed = 5000;
    var run = setInterval('rotate()', speed);

    //grab the width and calculate left value
    var item_width = $('#slides li.slide').outerWidth();
    var left_value = item_width * (-1);

    //move the last item before first item, just in case user click prev button
    $('#slides li.slide:first').before($('#slides li.slide:last'));

    //set the default item to the correct position
    $('#slides ul.slideList').css({'left' : left_value});

    //if user clicked on prev button
    $('#prev').click(function() {

        //get the right position
        var left_indent = parseInt($('#slides ul').css('left')) + item_width;

        //slide the item
        $('#slides ul.slideList').animate({'left' : left_indent}, 200,function(){

            //move the last item and put it as first item
            $('#slides li.slide:first').before($('#slides li.slide:last'));

            //set the default item to correct position
            $('#slides ul.slideList').css({'left' : left_value});

        });

        //cancel the link behavior
        return false;

    });


    //if user clicked on next button
    $('#next').click(function() {

        //get the right position
        var left_indent = parseInt($('#slides ul.slideList').css('left')) - item_width;

        //slide the item
        $('#slides ul.slideList').animate({'left' : left_indent}, 200, function () {

            //move the first item and put it as last item
            $('#slides li.slide:last').after($('#slides li.slide:first'));

            //set the default item to correct position
            $('#slides ul.slideList').css({'left' : left_value});

        });

        //cancel the link behavior
        return false;

    });

    //if mouse hover, pause the auto rotation, otherwise rotate it
    $('#slides').hover(

        function() {
            clearInterval(run);
        },
        function() {
            run = setInterval('rotate()', speed);
        }
    );

});

//a simple function to click next link
//a timer will call this function, and the rotation will begin :)
function rotate() {
    $('#next').click();
}