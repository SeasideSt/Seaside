accessing
routes
	"Answer a collection of routes for the receiver."

	^ self shouldCacheRoutes
		ifTrue: [  routes ifNil: [ routes := self createRoutes ] ]
		ifFalse: [
			"Issue 785
			even assign when they should not be cached to better support recaching"
			routes := self createRoutes ]