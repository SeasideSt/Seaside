private
basicUrl
	| url |
	self isRoot
		ifTrue: [ url := WAUrl new ]
		ifFalse: [ 
			url := self parent url.
			self parent trackingStrategy addKey: key toUrl: url ].
	^ url