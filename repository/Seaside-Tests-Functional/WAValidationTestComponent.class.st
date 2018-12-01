Class {
	#name : #WAValidationTestComponent,
	#superclass : #WAComponent,
	#category : 'Seaside-Tests-Functional'
}

{ #category : #rendering }
WAValidationTestComponent >> renderContentOn: html [
	html anchor
		callback: [
			self answer: false ];
		with: 'Fail validation'.
	html break.
	html anchor
		callback: [
			self answer: true ];
		with: 'Suceed validation'
]
