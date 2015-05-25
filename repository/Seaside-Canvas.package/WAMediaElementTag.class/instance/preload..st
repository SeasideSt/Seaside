attributes
preload: aString
	"The preload attribute is intended to provide a hint to the user agent about what the author thinks will lead to the best user experience.
	See: http://www.w3.org/TR/html5/video.html#attr-media-preload
	
	The preload attribute can have one of three values: 'none', 'metadata', 'auto'.
	Providing an empty string defaults the value of the attribute to be 'auto'."
	self attributeAt: 'preload' put: aString