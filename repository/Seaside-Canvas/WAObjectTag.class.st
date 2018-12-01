"
Defines an embedded object. Use this element to add multimedia to your XHTML page.
This element allows you to specify the data and parameters for objects inserted into HTML documents, and the code that can be used to display/manipulate that data.
"
Class {
	#name : #WAObjectTag,
	#superclass : #WATagBrush,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #attributes }
WAObjectTag >> archive: aUrl [ 
	self attributes 
		at: 'archive'
		put: aUrl
]

{ #category : #attributes }
WAObjectTag >> classId: aUrl [ 
	self attributes 
		at: 'classid'
		put: aUrl
]

{ #category : #attributes }
WAObjectTag >> codebase: aUrl [ 
	self attributes 
		at: 'codebase'
		put: aUrl
]

{ #category : #attributes }
WAObjectTag >> codetype: aString [ 
	self attributes 
		at: 'codetype'
		put: aString
]

{ #category : #attributes }
WAObjectTag >> declare: aBoolean [ 
	self attributes 
		at: 'declare'
		put: aBoolean
]

{ #category : #attributes }
WAObjectTag >> height: anInteger [ 
	self attributes 
		at: 'height'
		put: anInteger
]

{ #category : #attributes }
WAObjectTag >> standby: aString [ 
	self attributes 
		at: 'standby'
		put: aString
]

{ #category : #accessing }
WAObjectTag >> tag [
	^ 'object'
]

{ #category : #attributes }
WAObjectTag >> type: aString [ 
	self attributes 
		at: 'type'
		put: aString
]

{ #category : #attributes }
WAObjectTag >> url: aUrl [ 
	self attributes 
		at: 'data'
		put: aUrl
]

{ #category : #attributes }
WAObjectTag >> width: anInteger [ 
	self attributes 
		at: 'width'
		put: anInteger
]
