Extension { #name : #WAPresenter }

{ #category : #'*seaside-development' }
WAPresenter >> canHaveHalo [
	"Answer true if the presenter should display a halo."

	^ self haloClass notNil
]

{ #category : #'*seaside-development' }
WAPresenter >> haloClass [
	"Answer the halo class to be used to wrap this component."

	^ WAHalo
]
