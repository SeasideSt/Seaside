"
Authors may create controls that are not rendered but whose values are submitted with a form. Authors generally use this control type to store information between client/server exchanges that would otherwise be lost due to the stateless nature of HTTP (see [RFC2616]). The INPUT element is used to create a hidden control.
"
Class {
	#name : #WAHiddenInputTag,
	#superclass : #WAFormInputTag,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #accessing }
WAHiddenInputTag >> type [
	^ 'hidden'
]
