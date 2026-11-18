ajax
getJSON: aUrl
	"Load JSON data using an HTTP GET request for the given URL."

	| get |
	get := self getJson.
	get url: aUrl.
	^ get