actions
updateDatesCache
	| date |
	(startDate isNil or: [ endDate isNil ])
		ifTrue: [ ^ self ].
	datesCache := OrderedCollection new.
	date := startDate.
	[ date > endDate ] whileFalse: [ 
		datesCache add: date.
		date := date next ]