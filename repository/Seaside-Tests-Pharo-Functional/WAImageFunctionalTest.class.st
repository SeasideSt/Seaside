Class {
	#name : #WAImageFunctionalTest,
	#superclass : #WAFunctionalTest,
	#category : 'Seaside-Tests-Pharo-Functional'
}

{ #category : #accessing }
WAImageFunctionalTest >> formClass [
	^ Smalltalk classNamed: #Form
]

{ #category : #accessing }
WAImageFunctionalTest >> haloDebugForm [
	^ self formClass
		extent: 16 @ 16
		depth: 1
		fromArray: #(0 0 0 50331648 25165824 12582912 281018368 415236096 264241152 132120576 7340032 3670016 1572864 0 0 0)
		offset: 0 @ 0
]

{ #category : #accessing }
WAImageFunctionalTest >> haloPaintForm [
	^ self formClass
		extent: 16 @ 16
		depth: 1
		fromArray: #(0 0 0 402653184 503316480 192937984 213909504 73400320 103809024 51904512 25690112 14155776 7340032 0 0 0)
		offset: 0 @ 0
]

{ #category : #accessing }
WAImageFunctionalTest >> haloViewForm [
	^ self formClass
		extent: 16 @ 16
		depth: 1
		fromArray: #(0 0 0 0 132120576 486014976 770965504 1341259776 669253632 467140608 132120576 0 0 0 0 0)
		offset: 0 @ 0
]

{ #category : #testing }
WAImageFunctionalTest >> isSupported [
	^ self formClass notNil
]

{ #category : #accessing }
WAImageFunctionalTest >> label [
	^ 'Image'
]

{ #category : #rendering }
WAImageFunctionalTest >> renderContentOn: html [
	self isSupported
		ifTrue: [ self renderImagesOn: html ]
		ifFalse: [ self renderNotSupportedOn: html ]
]

{ #category : #rendering }
WAImageFunctionalTest >> renderImagesOn: html [
	html form: [
		html div: [
			html text: 'This one is clickable: '.
			html imageButton
				callback: [ self inform: 'ok' onAnswer: [ ] ];
				form: self haloDebugForm ] ].
		
	html paragraph: [
		html image
			form: self haloViewForm;
			altText: 'Halo-View'.
		html space.
		html image
			document: self haloPaintForm
			mimeType: 'image/png'
			fileName: 'Paint.png';
			altText: 'Halo-Paint' ]
]

{ #category : #rendering }
WAImageFunctionalTest >> renderNotSupportedOn: html [
	html heading: 'Your image doesn''t have the Form class'
]
