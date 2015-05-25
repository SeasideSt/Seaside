*seaside-tools-core
stop
	"Convenience method to stop a currently running adaptor of the type of the receiver
	as long as there is only one such adaptor currently registered."

	| default |
	default := self default.
	default isNil ifFalse: [ default stop ]