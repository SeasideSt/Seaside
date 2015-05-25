registration
register: aComponentClass asApplicationAt: aString user: user password: password 
	"Like #register:asApplicationAt: but additionally adds password protection."
	| application |
	application := self 
		register: aComponentClass
		asApplicationAt: aString.
	application configuration addParent: WAAuthConfiguration instance.
	application 
		preferenceAt: #login
		put: user.
	application 
		preferenceAt: #passwordHash
		put: (GRPlatform current secureHashFor: password).
	application addFilter: WAAuthenticationFilter new.
	^ application