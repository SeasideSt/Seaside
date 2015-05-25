channel-required
title
	"----- as required subelement of channel ----
	The name of the channel. It's how people refer to your service. If you have an HTML website that contains the same information as your RSS file, the title of your channel should be the same as the title of your website.
	e.g.: 'GoUpstate.com News Headlines'
	
	---- as required subelement of item ----
	The title of the item.
	
	---- as required subelement of image ----
	describes the image, it's used in the ALT attribute of the HTML <img> tag when the channel is rendered in HTML
	
	---- as required subelement of textInput ----
	The label of the Submit button in the text input area."
	
	^ self tag: 'title'