attributes
url
	^ url ifNil: [ url := canvas actionUrl copy ]