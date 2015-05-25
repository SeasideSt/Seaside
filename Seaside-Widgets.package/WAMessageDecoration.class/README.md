I add a string message on top of the WAComponent I decorate. For example if change WACounter>>initialize as below the text "Counter Example" will appear on above the counter when rendered.

WACounter>>initialize
	super initialize.
	self count: 0.
	self addMessage: 'Counter Example'	"added line"

