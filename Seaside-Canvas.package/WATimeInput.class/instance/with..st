public
with: anObject
	super with: anObject.
	value isNil
		ifTrue: [ value := Time now ].
	hours := value hour.
	minutes := value minute.
	seconds := value second.
	self renderHours.
	canvas
		space;
		text: ':';
		space.
	self renderMinutes.
	withSeconds
		ifTrue: [ 
			canvas
				space;
				text: ':';
				space.
			self renderSeconds ]
		ifFalse: [ seconds := 0 ].
	self addCallback