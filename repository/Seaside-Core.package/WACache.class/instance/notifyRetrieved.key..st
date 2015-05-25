private
notifyRetrieved: anObject key: aString
	self pluginsDo: [ :each | each retrieved: anObject key: aString ]