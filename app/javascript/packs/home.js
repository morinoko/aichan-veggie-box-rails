function toggleMenu(e) {
	console.log("click");
	e.preventDefault();

	const menuButton = $("#menu-button");
	const menu = $("#menu");

	menuButton.toggle();
	menu.toggle();
}

$(function() {
	console.log("loaded");
	const menuButton = $("#menu-button");
	const closeButton = $("#menu-close");

	menuButton.click(toggleMenu);
	closeButton.click(toggleMenu);

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

	const orderLink = $(".order-link");
	orderLink.click(function(e) {
		e.preventDefault();
		$([document.documentElement, document.body]).animate({
        scrollTop: $("#order").offset().top
    }, 500);
	});
});
