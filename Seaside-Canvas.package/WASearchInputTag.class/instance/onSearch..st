events
onSearch: aString
	"The search DOM event fires at the precise time the search should be performed and obeys the heuristic for the control, so you don't have to trap key and click events at all. You can use the onsearch attribute on the control to respond when the search happens."

	self attributes at: 'onsearch' append: aString separator: ';'