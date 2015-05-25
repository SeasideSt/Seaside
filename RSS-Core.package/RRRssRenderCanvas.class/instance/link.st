channel-required
link
	"---- as required subelement of channel ----
	The URL to the HTML website corresponding to the channel.
	e.g.: 'http://www.goupstate.com/'
	
	---- as required subelement of item ----
	The URL of the item.
	
	---- as required subelement of image ----
	is the URL of the site, when the channel is rendered, the image is a link to the site. (Note, in practice the image <title> and <link> should have the same value as the channel's <title> and <link>
	
	---- as required subelement of textInput ----
	The URL of the CGI script that processes text input requests."
	
	^ self tag: 'link'