

$(document).ready(function() {
    
    $('#flip-container').quickFlip();

    $('#flip-navigation li a').each(function() {
        $(this).click(function() {
            $('#flip-navigation li').each(function() {
                $(this).removeClass('selected');
            });
            $(this).parent().addClass('selected');
            var flipid = $(this).attr('id').substr(4);
            $('#flip-container').quickFlipper({}, flipid, 1);

            return false;
        });
        
    }
    );
});