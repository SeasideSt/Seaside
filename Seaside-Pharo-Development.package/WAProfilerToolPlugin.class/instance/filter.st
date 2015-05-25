accessing
filter
	^ filter ifNil: [ filter := WAProfilerFilter new ]