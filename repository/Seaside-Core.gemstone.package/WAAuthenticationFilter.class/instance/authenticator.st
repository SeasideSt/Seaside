accessing
authenticator
	"Answer the object used for authentication. Defaults to the owning handler."

	^ authenticator ifNil: [ self handler ]