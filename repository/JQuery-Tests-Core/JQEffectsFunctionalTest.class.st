Class {
	#name : #JQEffectsFunctionalTest,
	#superclass : #JQFunctionalTest,
	#category : 'JQuery-Tests-Core-Functional'
}

{ #category : #rendering }
JQEffectsFunctionalTest >> renderContentOn: html [
	html paragraph class: 'actions'; with: [
		#(show: hide: toggle: slideDown: slideUp: slideToggle: fadeIn: fadeOut: fadeToggle:) do: [ :selector |
			html anchor
				onClick: ((html jQuery: #seastar) 
					perform: selector
					with: 1 seconds);
				with: selector allButLast ] ].
	self renderSeastarOn: html
]

{ #category : #accessing }
JQEffectsFunctionalTest >> selectors [
	^ #(renderContentOn: renderSeastarOn:)
]

{ #category : #accessing }
JQEffectsFunctionalTest >> title [
	^ 'Effects'
]
