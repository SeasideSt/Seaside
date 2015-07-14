configuration
libraries
	^ (self preferenceAt: #libraries) collect: [ :each | each value ]