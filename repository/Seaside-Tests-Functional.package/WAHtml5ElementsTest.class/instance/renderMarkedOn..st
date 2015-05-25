rendering
renderMarkedOn: html
	html heading level2; with: '<mark> (kitten)'.
	
	html paragraph: [
		html text: 'I also have some '.
		html marked: 'kitten'.
		html text: 's who are visiting me these days. They''re really cute. I think they like my garden!' ]