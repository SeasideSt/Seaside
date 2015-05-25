scripting
scriptSelect: aDate on: script 
	"Ajax select"
	self select: aDate.
	widgetId isNil ifTrue: [ ^ self ].
	script prototype element
		id: widgetId;
		access: 'value';
		assign: self formattedResult.
	script prototype element
		id: uid;
		remove.
	open := false