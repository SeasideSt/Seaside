rendering
renderContentOn: html

	html heading: 'CORS Test Page'.

	(WACORSResourceExample corsAdaptor isNil or: [ 
		 WACORSResourceExample corsAdaptor isRunning not ])
		ifTrue: [ 
			self renderAdaptorSetupOn: html	
			
		]
		ifFalse: [ 
			self corsFilter
				ifNil: [ self renderResourceRegistrationOn: html ]
				ifNotNil: [ self renderTestingOn: html ] ]