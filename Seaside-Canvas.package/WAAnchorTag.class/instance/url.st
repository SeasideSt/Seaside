accessing
url
	^ url ifNil: [ url := canvas actionUrl copy ]