"
I am a single line text input widget. See WAInputTest >> #renderTextInputWithExampleOn: for examples.
"
Class {
	#name : #WATextInputTag,
	#superclass : #WAAbstractTextAreaTag,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #attributes }
WATextInputTag >> maxLength: aNumber [ 
	"This attribute specifies the maximum number of characters the user may enter. This number may exceed the specified #size:, in which case the user agent should offer a scrolling mechanism. The default value for this attribute is an unlimited number."
	self attributes 
		at: 'maxlength'
		put: aNumber
]

{ #category : #accessing }
WATextInputTag >> type [
	^ 'text'
]

{ #category : #public }
WATextInputTag >> with: anObject [ 
	anObject isNil ifFalse: [ self value: anObject greaseString ].
	super with: nil
]
