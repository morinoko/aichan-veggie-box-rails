$(function() {
	const aboutLink = $("#about-link");
	aboutLink.click(function(e) {
		e.preventDefault();
		$([document.documentElement, document.body]).animate({
        scrollTop: $("#about").offset().top
    }, 500);
	});

	const veggiesLink = $("#veggies-link");
	veggiesLink.click(function(e) {
		e.preventDefault();
		$([document.documentElement, document.body]).animate({
        scrollTop: $("#veggies").offset().top
    }, 500);
	});

	const orderLink = $("#order-link");
	orderLink.click(function(e) {
		e.preventDefault();
		$([document.documentElement, document.body]).animate({
        scrollTop: $("#order").offset().top
    }, 500);
	});
});
