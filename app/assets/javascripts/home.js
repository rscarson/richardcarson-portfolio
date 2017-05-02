function contact_popover() {
  $("[name='contact']").popover('show');
}

function scrollTo(selector) {
    $('html, body').animate({
        scrollTop: $(selector).offset().top
    }, 500);
    return false;
}