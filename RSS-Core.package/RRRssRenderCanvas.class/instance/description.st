channel-required
description
	"
	---- as required subelement of channel ----
	Phrase or sentence describing the channel.
	e.g.: 'The latest news from GoUpstate.com, a Spartanburg Herald-Journal Web site.'
	
	---- a required subelement of item ----
	The item synopsis.
	
	---- as required subelement of textInput ----
	Explains the text input area.
	
	----  as an optional subelement of image ----
	contains text that is included in the TITLE attribute of the link formed around the image in the HTML rendering."
	^ self tag: 'description'