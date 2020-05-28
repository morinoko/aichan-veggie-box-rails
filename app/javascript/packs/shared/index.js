function toggleMenu(e) {
	e.preventDefault();

	const menuButton = document.querySelector("#menu-button");
	const menu = document.querySelector("#menu");

	if (menu.classList.contains('hidden')) {
		menu.classList.remove('hidden');
		menu.classList.add('open');
		menuButton.classList.add('hidden');
		menuButton.classList.remove('active');
	} else {
		menu.classList.remove('open');
		menu.classList.add('hidden');
		menuButton.classList.remove('hidden');
		menuButton.classList.add('active');
	}

}

document.addEventListener("turbolinks:load", function() {
	const menuButton = document.querySelector("#menu-button");
	const closeButton = document.querySelector("#menu-close");

	menuButton.addEventListener('click', toggleMenu);
	closeButton.addEventListener('click', toggleMenu);
})