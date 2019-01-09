private
expunge: aListEntry
	"update list start"
	aListEntry == byAccessStart
		ifTrue: [ byAccessStart := aListEntry next ].
	aListEntry == byCreationStart
		ifTrue: [ byCreationStart := aListEntry next ].
	"update list end"
	aListEntry == byAccessEnd
		ifTrue: [ byAccessEnd := aListEntry previous ].
	aListEntry == byCreationEnd
		ifTrue: [ byCreationEnd := aListEntry previous ].
	"fix previous and next pointers"
	aListEntry expunge