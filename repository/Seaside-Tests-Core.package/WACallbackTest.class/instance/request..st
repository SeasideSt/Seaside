utilities
request: aRequestFields
	"Processes a request with the fields given in aRequestFields."
	
	| request context |
	request := WARequest new setPostFields: aRequestFields; yourself.
	context := WARequestContext request: request response: WAResponse new.
	registry handle: context