authentication
verifyPassword: password forUser: username 
	"This method is called by WAAuthMain to verify the username provided
	in the HTTP request. The default implementation compares them against
	the configuration values provided by WAAuthConfiguration. WAAuthMain
	can also be used by itself if you implement this method in your
	own Application subclass to do something different."
	| loginPreference hashPreference |
	loginPreference := self preferenceAt: #login.
	hashPreference := self preferenceAt: #passwordHash.
	loginPreference isNil ifTrue: [
		self authConfigurationError: 'Login not defined. The default authentication method requires a WAAuthConfiguration' ].
	hashPreference isNil ifTrue: [
		self authConfigurationError: 'Password not defined. The default authentication method requires a WAAuthConfiguration' ].
	^ username isEmptyOrNil not
		and: [ password isEmptyOrNil not
		and: [ loginPreference = username
		and: [ hashPreference = (GRPlatform current secureHashFor: password) ] ] ]