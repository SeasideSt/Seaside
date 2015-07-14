copying
copy
	| copy |
	copy := self class initialSize: keyTable size maximumSize: maximumSize maximumAbsoluteAge: maximumAbsoluteAge maximumRelativeAge: maximumRelativeAge overflowAction: overflowAction.
	self keysAndValuesDo: [ :key :value |
		copy at: key put: value ].
	^ copy