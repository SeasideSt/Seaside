Class {
	#name : #WAPopupFunctionalTest,
	#superclass : #WAFunctionalTest,
	#category : 'Seaside-Tests-Functional'
}

{ #category : #actions }
WAPopupFunctionalTest >> batchFunctionalTestLoop [
	self session presenter
		show: WABatchFunctionalTest new
]

{ #category : #actions }
WAPopupFunctionalTest >> popupCloseTest [
	self session presenter show: WAPopupCloseTestComponent new
]

{ #category : #rendering }
WAPopupFunctionalTest >> renderContentOn: html [
	html paragraph: [ 
		html popupAnchor
			callback: [ self batchFunctionalTestLoop ];
			with: 'popup'.
		html break.
		html popupAnchor
			extent: 300 @ 300;
			callback: [ self batchFunctionalTestLoop ];
			with: 'popup with extent'.
		html break.
		html popupAnchor
			position: 100 @ 100;
			callback: [ self batchFunctionalTestLoop ];
			with: 'popup with position'.
		html break.
		html popupAnchor
			location: true;
			callback: [ self batchFunctionalTestLoop ];
			with: 'popup with location'.
		html break.
		html popupAnchor
			resizable: false;
			callback: [ self batchFunctionalTestLoop ];
			with: 'popup not resizable'.
		html break.
		html popupAnchor
			resizable: false;
			extent: 300 @ 300;
			position: 50 @ 50;
			callback: [ self popupCloseTest ];
			with: 'popup with close button' ]
]
