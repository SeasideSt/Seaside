initialization
initialize
	super initialize.
	self generator: GRPlatform current newRandom.
	self space: 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_-'