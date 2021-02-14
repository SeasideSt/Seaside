Class {
	#name : #JQEffectFunctionalTest,
	#superclass : #JQUiFunctionalTest,
	#category : 'JQuery-Tests-UI-Functional'
}

{ #category : #effects }
JQEffectFunctionalTest >> bounce: anEffect [
	^ anEffect bounce; easing: 'linear'; times: 2
]

{ #category : #effects }
JQEffectFunctionalTest >> highlight: anEffect [
	^ anEffect highlight; color: '#f00'
]

{ #category : #effects }
JQEffectFunctionalTest >> pulsate: anEffect [
	^ anEffect pulsate times: 2
]

{ #category : #rendering }
JQEffectFunctionalTest >> renderContentOn: html [
	html paragraph class: 'actions'; with: [
		#( bounce highlight pulsate shake size transfer ) do: [ :each | 
			html anchor
				onClick: (self
					perform: each asMutator
					with: (html jQuery: '.box') effect);
				with: each ] ].
	self renderBoxOn: html
]

{ #category : #accessing }
JQEffectFunctionalTest >> selectors [
	^ #(renderContentOn: bounce: highlight: pulsate: shake: size: transfer:)
]

{ #category : #effects }
JQEffectFunctionalTest >> shake: anEffect [
	^ anEffect shake; distance: 10; times: 2

]

{ #category : #effects }
JQEffectFunctionalTest >> size: anEffect [
	^ anEffect effect; size; toWidth: 50; toHeight: 25

]

{ #category : #hooks }
JQEffectFunctionalTest >> style [
	^ '.ui-effects-transfer { border: 2px dashed black; }'
]

{ #category : #accessing }
JQEffectFunctionalTest >> title [
	^ 'Basic Effects'
]

{ #category : #effects }
JQEffectFunctionalTest >> transfer: anEffect [
	^ anEffect transfer; to: 'h1.logo a'; slow
]

{ #category : #accessing }
JQEffectFunctionalTest >> url [
	^ 'http://docs.jquery.com/UI/Effects'
]
