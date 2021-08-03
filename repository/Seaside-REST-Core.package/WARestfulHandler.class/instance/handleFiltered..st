handling
handleFiltered: aRequestContext

	self executeResult:
		(self routeForContext: aRequestContext ifAbsent: [ 
			 aRequestContext request method = 'HEAD'
				 ifTrue: [ 
					 aRequestContext request setMethod: 'GET'.
					 self handleFiltered: aRequestContext ]
				 ifFalse: [ self noRouteFound: aRequestContext ] ])