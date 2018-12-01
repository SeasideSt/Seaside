Extension { #name : #WAServerAdaptor }

{ #category : #'*seaside-gemstone-core' }
WAServerAdaptor classSide >> startGemServerOn: portInteger [
	"use this method to start adaptor in a separate gem.
	 use #startOn: if starting from development vm"

	| adaptor |
	GRPlatform current seasideLogServerStart: self class name port: portInteger.
	adaptor := self port: portInteger.
	"The method not expected to return"
	adaptor start
]
