channel-optional
textInput
	"Specifies a text input box that can be displayed with the channel.
	The purpose of the <textInput> element is something of a mystery. You can use it to specify a search engine box. Or to allow a reader to provide feedback. Most aggregators ignore it.
	
	It has the following required subelements:
		title
		description
		name
		link"
	^ self tag: 'textInput'