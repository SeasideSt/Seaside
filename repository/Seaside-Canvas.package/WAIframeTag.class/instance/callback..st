callbacks
callback: aNiladicValuable
	"Evaluates the given valuable when the content of the iframe is loaded.
	You probably want to switch the presenter of the switch the presenter of the session. See WAIframeFunctionalTest for an example.
	In Seaside 3.1 this may be replaced by a dedicated continuation."
	aNiladicValuable argumentCount > 0 ifTrue: [ GRInvalidArgumentCount signal: 'Iframes expect a niladic callback.' ].
	self url addField: (self storeCallback: (WAActionCallback on: aNiladicValuable))