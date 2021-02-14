"
The WATableHeadingTag defines a table header cell in a table. The text within the th element usually renders in bold.
"
Class {
	#name : #WATableHeadingTag,
	#superclass : #WATableDataTag,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #accessing }
WATableHeadingTag >> tag [
	^ 'th'
]
