"
I am a password input widget that does not display the entered text.
"
Class {
	#name : #WAPasswordInputTag,
	#superclass : #WATextInputTag,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #accessing }
WAPasswordInputTag >> type [
	^ 'password'
]
