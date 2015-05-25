private
cookieFromContext: aRequestContext ifAbsent: absentBlock
	"Answer the handler key cookie. If none is found, return the result of evaluating absentBlock.
	There can be several cookies with the correct key so we try to find the one with the most specific path."

	| candidates requestUrl |
	candidates := aRequestContext request cookiesAt: self keyCookieName.
	
	candidates isEmptyOrNil
		ifTrue: [ ^ absentBlock value ].
	candidates size = 1 
		ifTrue: [ ^ candidates first ].
		
	requestUrl := aRequestContext request url.
	candidates := candidates collect: [ :each |
		each -> (each path seasideUrl relativeTo: requestUrl) ].
	
	candidates := candidates reject: [ :each |
		| path |
		path := each value.
		path notEmpty and: [ path first = '..' ] ].

	candidates isEmpty
		ifTrue: [ ^ absentBlock value ].
		
	candidates size > 1 ifTrue: [
		candidates sort: [ :a :b |
			 a value size <= b value size ] ].
	
	^ candidates first key