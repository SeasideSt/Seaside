Class {
	#name : #SUCarouselTest,
	#superclass : #SUFunctionalTest,
	#instVars : [
		'carousel'
	],
	#category : 'Scriptaculous-Tests-Components'
}

{ #category : #hooks }
SUCarouselTest >> children [
	^ Array with: carousel
]

{ #category : #accessing }
SUCarouselTest >> coreClass [
	^ SUNavigationCarousel
]

{ #category : #initialization }
SUCarouselTest >> initialize [
	super initialize.
	carousel := SUNavigationCarousel new.
	1 to: 10 do: [ :index |
		carousel
			add: (SUCounterTest on: index)
			label: 'Counter ', index greaseString ]


	
]
