"
Defines a label to a control. If you click the text within the label element,  it is supposed to toggle the control.
"
Class {
	#name : #WALabelTag,
	#superclass : #WATagBrush,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #attributes }
WALabelTag >> for: aString [ 
	self attributes 
		at: 'for'
		put: aString
]

{ #category : #accessing }
WALabelTag >> tag [
	^ 'label'
]
