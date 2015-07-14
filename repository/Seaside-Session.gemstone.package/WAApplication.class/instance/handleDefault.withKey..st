handling
handleDefault: aRequestContext withKey: aKey
	self handle: aRequestContext registering: self newSession at: aKey