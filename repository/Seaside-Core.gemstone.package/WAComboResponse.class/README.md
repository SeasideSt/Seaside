WAComboResponse is a combination of a buffered and a streaming response. By default, WAComboResponse will buffer the entire response to be sent at the end of the request processing cycle. If streaming is desired, the response can be flushed by sending it the #flush message. Flushing a response will sent all previously buffered data using chunked transfer-encoding (which preserves persistent connections). Clients can flush the response as often as they want at appropriate points in their response generation; everything buffered up to that point will be sent. For example, a search results page might use something like:

renderContentOn: aCanvas
	"Render the search page"

	self renderSearchLabelOn: aCanvas.
	aCanvas flush. "flush before starting search to give immediate feedback"

	self searchResultsDo:[:aResult|
		self renderSearchResultOn: aCanvas.
		aCanvas flush. "flush after each search result"
	].

After a response has been flushed once, header modifications are no longer possible and will raise a WAIllegalStateException.

Server adaptors need to be aware that a committed response must be closed, when complete. An uncommitted response should be handled as usual by the server adapter.