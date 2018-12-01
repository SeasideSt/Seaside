Class {
	#name : #WAImageMapFunctionalTest,
	#superclass : #WAFunctionalTest,
	#category : 'Seaside-Tests-Functional'
}

{ #category : #rendering }
WAImageMapFunctionalTest >> renderContentOn: html [ 
	html heading
		level: 3;
		with: 'A byte array with server side map (ismap)'.
	html paragraph: 'Click anywhere on the Style Editor icon and you should get informed about the position where you clicked.'.
	html paragraph: [
		html map
			title: 'Click anywhere on the style editor icon';
			callback: [ :aPoint | 
				self 
					inform: 'Clicked at ' , aPoint greaseString , ' on the Style Editor Icon'
					onAnswer: [ ] ];
			with: [
				html image
					altText: 'Style Editor Icon';
					width: '40%';
					url: WATestingFiles / #samplePng ] ]
]
