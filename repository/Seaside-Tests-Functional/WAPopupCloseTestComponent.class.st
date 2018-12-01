Class {
	#name : #WAPopupCloseTestComponent,
	#superclass : #WAComponent,
	#category : 'Seaside-Tests-Functional'
}

{ #category : #rendering }
WAPopupCloseTestComponent >> renderContentOn: html [
	html anchor
		callback: [ self requestContext closeThisPopup ];
		with: 'Close me'.
	html break.
	html anchor
		callback: [ self requestContext closeThisPopupAndReloadOpener ];
		with: 'Close me and reload opener'
]
