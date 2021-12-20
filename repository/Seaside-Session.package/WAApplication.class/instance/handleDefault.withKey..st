handling
handleDefault: aRequestContext withKey: aKey
	"starts a new session with the given key
	Pay attention if the client can choose the key then you are vulnerable to session fixation attacks"
	self handle: aRequestContext registering: self newSession at: aKey