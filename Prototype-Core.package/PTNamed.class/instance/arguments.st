accessing
arguments
	^ arguments ifNil: [ Array with: self id ]