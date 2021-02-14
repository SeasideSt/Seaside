"
The param element allows you to specify the run-time settings for an object inserted into XHTML documents.
"
Class {
	#name : #WAParameterTag,
	#superclass : #WATagBrush,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #attributes }
WAParameterTag >> name: aString [ 
	self attributes 
		at: 'name'
		put: aString
]

{ #category : #accessing }
WAParameterTag >> tag [
	^ 'param'
]

{ #category : #attributes }
WAParameterTag >> type: aString [ 
	self attributes 
		at: 'type'
		put: aString
]

{ #category : #attributes }
WAParameterTag >> value: aString [ 
	self attributes 
		at: 'value'
		put: aString
]
