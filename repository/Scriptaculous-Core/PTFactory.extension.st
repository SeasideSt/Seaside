Extension { #name : #PTFactory }

{ #category : #'*Scriptaculous-Core-controls' }
PTFactory >> autocompleter [
	^ self create: SUAutocompleter
]

{ #category : #'*Scriptaculous-Core-creational-dragging' }
PTFactory >> draggable [
	^ self create: SUDraggable
]

{ #category : #'*Scriptaculous-Core' }
PTFactory >> droppable [
	^ self create: SUDroppable
]

{ #category : #'*Scriptaculous-Core-elements' }
PTFactory >> effect [
	^ self create: SUEffect
]

{ #category : #'*Scriptaculous-Core' }
PTFactory >> inPlaceCollectionEditor [
	^ self create: SUInPlaceCollectionEditor
]

{ #category : #'*Scriptaculous-Core' }
PTFactory >> inPlaceEditor [
	^ self create: SUInPlaceEditor
]

{ #category : #'*Scriptaculous-Core' }
PTFactory >> slider [
	^ self create: SUSlider
]

{ #category : #'*Scriptaculous-Core' }
PTFactory >> sortable [
	^ self create: SUSortable
]

{ #category : #'*Scriptaculous-Core' }
PTFactory >> sound [
	^ self create: SUSound
]
