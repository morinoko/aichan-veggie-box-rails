function toggleMenu(e) {
	e.preventDefault();

	const menuButton = $("#menu-button");
	const menu = $("#menu");

	menuButton.toggle();
	menu.toggle();
}

document.addEventListener("turbolinks:load", function() {
	const menuButton = $("#menu-button");
	const closeButton = $("#menu-close");

	menuButton.click(toggleMenu);
	closeButton.click(toggleMenu);
})