Extension { #name : #PTFactory }

{ #category : #'*scriptaculous-core-controls' }
PTFactory >> autocompleter [
	^ self create: SUAutocompleter
]

{ #category : #'*scriptaculous-core-creational-dragging' }
PTFactory >> draggable [
	^ self create: SUDraggable
]

{ #category : #'*scriptaculous-core-creational-dragging' }
PTFactory >> droppable [
	^ self create: SUDroppable
]

{ #category : #'*scriptaculous-core-elements' }
PTFactory >> effect [
	^ self create: SUEffect
]

{ #category : #'*scriptaculous-core-controls' }
PTFactory >> inPlaceCollectionEditor [
	^ self create: SUInPlaceCollectionEditor
]

{ #category : #'*scriptaculous-core-controls' }
PTFactory >> inPlaceEditor [
	^ self create: SUInPlaceEditor
]

{ #category : #'*scriptaculous-core-controls' }
PTFactory >> slider [
	^ self create: SUSlider
]

{ #category : #'*scriptaculous-core-creational-dragging' }
PTFactory >> sortable [
	^ self create: SUSortable
]

{ #category : #'*scriptaculous-core-elements' }
PTFactory >> sound [
	^ self create: SUSound
]
