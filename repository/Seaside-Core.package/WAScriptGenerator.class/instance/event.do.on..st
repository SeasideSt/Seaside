public
event: aString do: anObject on: aBrush
	"Attaches the Javscript anObject to the event aString of aBrush. This default implementation simply inlines the Javascript code into the brush; subclasses might override this to do something more meaningful."
	
	aBrush attributes at: 'on' , aString append: anObject separator: ';'