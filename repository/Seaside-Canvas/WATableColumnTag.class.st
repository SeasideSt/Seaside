"
WATableColumnTag elements define the alignment properties for cells in one or more columns.
"
Class {
	#name : #WATableColumnTag,
	#superclass : #WATableColumnGroupTag,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #testing }
WATableColumnTag >> isClosed [
	^ true
]

{ #category : #accessing }
WATableColumnTag >> tag [
	^ 'col'
]
