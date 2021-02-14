"
I represent a file input element (<input type=""file""). My callbacks will be evaluated with an instance of WAFile as an argument.
"
Class {
	#name : #WAFileUploadTag,
	#superclass : #WAFormInputTag,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #attributes }
WAFileUploadTag >> accept: aString [
	"This attribute specifies a comma-separated list of content types that a server processing this form will handle correctly. User agents may use this information to filter out non-conforming files when prompting a user to select files to be sent to the server"
	self attributes at: 'accept' put: aString
]

{ #category : #attributes }
WAFileUploadTag >> beMultiple [
	"The multiple attribute is a boolean attribute that indicates whether the user is to be allowed to specify more than one value."
	self attributeAt: 'multiple' put: true
]

{ #category : #callbacks }
WAFileUploadTag >> callback: aBlock [
	"Only called if a file was selected."
	self name: (self storeCallback: (WAUploadCallback on: aBlock))
]

{ #category : #callbacks }
WAFileUploadTag >> multipleValuesCallback: aBlock [
	self beMultiple.
	self name: (self storeCallback: (WAAllUploadsCallback on: aBlock))
]

{ #category : #callbacks }
WAFileUploadTag >> on: aSelector of: anObject [ 
	self callback: (GRDelayedSend 
			receiver: anObject
			selector: aSelector asMutator)
]

{ #category : #accessing }
WAFileUploadTag >> type [
	^ 'file'
]
