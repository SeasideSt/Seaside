accessing-headers
contentType
	"The Content-Type entity-header field indicates the media type of the entity-body sent to the recipient or, in the case of the HEAD method, the media type that would have been sent had the request been a GET.
	
	Answer an instance of WAMimeType or nil."
	
	| contentType |
	contentType := self headerAt: 'content-type'.
	^ contentType isNil ifFalse: [ WAMimeType fromString: contentType ]