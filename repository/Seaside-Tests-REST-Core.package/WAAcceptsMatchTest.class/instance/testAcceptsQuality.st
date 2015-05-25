tests
testAcceptsQuality
	| pathElement routeXml routeJson acceptTextJS acceptAppJson acceptAll accepts routeContainer matchedRoute |
	pathElement := 'dontcare'.

	routeXml := WAComplexRoute
		method: 'GET'
		selector: #dontCare
		url: (WAUrl absolute: pathElement)
		arguments: #()
		produces: (WASubMimeTypeMatch sub: 'xml')
		consumes: WAWildcardMimeTypeMatch new.
		
	routeJson := WAComplexRoute
		method: 'GET'
		selector: #dontCare
		url: (WAUrl absolute: pathElement)
		arguments: #()
		produces: (WAFullMimeTypeMatch main: 'application' sub: 'json')
		consumes: WAWildcardMimeTypeMatch new.
	
	acceptTextJS := WAAccept value: (WAMimeType main: 'text' sub: 'xml') quality: 1.0.
	acceptAppJson := WAAccept value: WAMimeType applicationJson quality: 0.5.
	acceptAll := WAAccept value: (WAMimeType main: '*' sub: '*') quality: 0.01.

	"this will sort:  acceptTextJS, acceptAppJson, acceptAll"	
	accepts := Array with: acceptAll with: acceptAppJson with: acceptTextJS.
	routeContainer := WARouteContainer routes: (Array with: routeXml with: routeJson).
	
	matchedRoute := routeContainer
		routeForElements: (Array with: pathElement)
		parameters: WARequestFields new
		contentType: nil
		accept: accepts
		ifAbsent: [ nil ].
	
	self assert: matchedRoute = routeXml
	
	
	
	
	
	
	
	
