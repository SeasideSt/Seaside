public
absoluteUrlForResource: aString
	"Answer a resource URL for aString. The URL will always be absolute (ie. it will begin
	with a / or a URL scheme like http://. If aString already looks like a URL, an instance
	of WAUrl will be returned for it. If it looks like a path, it will be appended to the
	resource base URL configured in the RenderContext if there is one."

	^ self context absoluteUrlForResource: aString