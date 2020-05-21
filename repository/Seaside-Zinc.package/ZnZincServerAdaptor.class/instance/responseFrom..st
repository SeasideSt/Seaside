converting
responseFrom: aRequestContext
	| partialHeaders cookies fullHeaders seasideResponse contents entity contentType |
	seasideResponse := aRequestContext response.
	partialHeaders := seasideResponse headers.
	cookies := seasideResponse cookies.
	fullHeaders := ZnHeaders defaultResponseHeaders.
	partialHeaders keysAndValuesDo: [ :key :value |
		fullHeaders at: key add: value greaseString ].
	cookies do: [ :each |
		fullHeaders at: 'Set-Cookie' add: each rfc6265String ].
	contentType := seasideResponse contentType greaseString.
	contents := seasideResponse contents.
	entity := (ZnEntity bytes: contents) contentType: contentType; yourself.
	^ ZnResponse new
		statusLine: (ZnStatusLine code: seasideResponse status);
		headers: fullHeaders;
		entity: entity;
		yourself