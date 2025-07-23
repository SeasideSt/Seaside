accessing
filter
	^ filter ifNil: [ filter := WARequestLoggingFilter new logger: self logger ]