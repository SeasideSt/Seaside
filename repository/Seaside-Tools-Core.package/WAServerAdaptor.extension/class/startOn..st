*seaside-tools-core
startOn: portInteger
	"Convenience method to start a single adaptor on the specified port. If an existing
	adaptor of this type is already registered, it will be restarted on the specified port."

	| adaptor |
	adaptor := self default.
	adaptor isNil
		ifFalse: [ adaptor stop; port: portInteger ]
		ifTrue: [ adaptor := self port: portInteger ].
	adaptor start