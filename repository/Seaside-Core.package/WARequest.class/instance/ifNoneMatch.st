accessing-headers
ifNoneMatch
	"The If-None-Match HTTP request header makes the request conditional."

	^ self headerAt: 'if-none-match' ifAbsent: [ nil ]