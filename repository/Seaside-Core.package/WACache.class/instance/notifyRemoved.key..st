private
notifyRemoved: anObject key: aString
	self pluginsDo: [ :each | each removed: anObject key: aString ]