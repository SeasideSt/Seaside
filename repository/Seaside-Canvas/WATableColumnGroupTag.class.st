"
WATableColumnGroupTag groups a set of col elements. It allows you to group several semantically related columns together.
"
Class {
	#name : #WATableColumnGroupTag,
	#superclass : #WATableCellTag,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #attributes }
WATableColumnGroupTag >> span: anInteger [
	"This attribute must be an integer > 0; the default value is 1. This specifies the number of columns in a colgroup, or specifies the number of columns spanned by the col element."
	
	self attributes at: 'span' put: anInteger
]

{ #category : #accessing }
WATableColumnGroupTag >> tag [
	^ 'colgroup'
]

{ #category : #attributes }
WATableColumnGroupTag >> width: anInteger [
	"The width attribute specifies the width of the columns"
	
	self attributes at: 'width' put: anInteger
]
