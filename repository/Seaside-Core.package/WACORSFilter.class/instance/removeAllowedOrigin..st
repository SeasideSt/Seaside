origins
removeAllowedOrigin: originUrlString

	self allowedOrigins remove: originUrlString asString ifAbsent: [ ]