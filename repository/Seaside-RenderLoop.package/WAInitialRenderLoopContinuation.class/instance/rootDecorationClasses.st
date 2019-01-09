accessing
rootDecorationClasses
	^ (self application preferenceAt: #rootDecorationClasses) collect: [ :each | each value ]