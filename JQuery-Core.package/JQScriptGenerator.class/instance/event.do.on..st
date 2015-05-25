public
event: aString do: anObject on: aBrush
	anObject ifNil: [ ^ self ].
	self addLoadScript: (JQueryInstance new
		id: aBrush ensureId;
		on: aString do: anObject)