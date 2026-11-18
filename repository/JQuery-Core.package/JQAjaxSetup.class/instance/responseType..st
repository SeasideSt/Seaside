options
responseType: aString
	"Set the expected XMLHttpRequest response type."

	self optionAt: 'xhrFields' put: (Dictionary new
		at: 'responseType' put: aString;
		yourself)