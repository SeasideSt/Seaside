"
This element works with the <ruby> element. 
The text following <rt> appears as a note to the base text displayed by the 
<ruby> element.
"
Class {
	#name : #WARubyTextTag,
	#superclass : #WATagBrush,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #attributes }
WARubyTextTag >> span: anInteger [ 
	self attributes 
		at: 'rbspan'
		put: anInteger
]

{ #category : #accessing }
WARubyTextTag >> tag [
	^ 'rt'
]
