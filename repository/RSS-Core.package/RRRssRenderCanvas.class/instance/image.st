channel-optional
image
	"Specifies a GIF, JPEG or PNG image that can be displayed with the channel.
	the following subelements are required:
		url
		title
		link
	the following subelements are optional:
		width
		height
		description
	"
	^ self tag: 'image'