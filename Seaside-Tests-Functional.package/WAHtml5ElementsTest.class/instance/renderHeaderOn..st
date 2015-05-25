rendering
renderHeaderOn: html
	html heading level2; with: '<header>'.
	
	html header: [
		html paragraph: 'Welcome to...'.
		html heading level1; with: 'Voidwars!' ]