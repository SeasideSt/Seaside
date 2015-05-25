private
registerForUrl: aBoolean
	| url |
	url := self session actionUrlForContinuation: self.
	aBoolean ifTrue: [ self updateUrl: url ].
	^ url