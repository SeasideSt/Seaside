accessing
filter
	^ filter ifNil: [ filter := WAObjectsReadFilter new ]