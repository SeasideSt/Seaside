private
notifyStored: anObject key: aString
	self pluginsDo: [ :each | each stored: anObject key: aString ]