options
requestHeaders: aDictionary
	"Prototype automatically provides a set of default headers, that this option can override and augment: X-Requested-With, X-Prototype-Version, Accept, and Content-type."

	self optionAt: 'requestHeaders' put: aDictionary