Class {
	#name : #JQAnimateFunctionalTest,
	#superclass : #JQFunctionalTest,
	#category : 'JQuery-Tests-Core-Functional'
}

{ #category : #rendering }
JQAnimateFunctionalTest >> renderAbsoluteOn: html [
	html anchor
		onClick: ((html jQuery: #seastar) animate opacity: 0.0);
		with: 'Opacity 0%'.
	html anchor
		onClick: ((html jQuery: #seastar) animate opacity: 0.5);
		with: 'Opacity 50%'.
	html anchor
		onClick: ((html jQuery: #seastar) animate opacity: 1.0);
		with: 'Opacity 100%'
]

{ #category : #rendering }
JQAnimateFunctionalTest >> renderContentOn: html [
	html paragraph class: 'actions'; with: [
		self renderRelativeOn: html.
		self renderAbsoluteOn: html.
		self renderToggleOn: html ].
	self renderSeastarOn: html
]

{ #category : #rendering }
JQAnimateFunctionalTest >> renderRelativeOn: html [
	html anchor
		onClick: ((html jQuery: #seastar) animate left: '-=100px');
		with: 'Move Left'.
	html anchor
		onClick: ((html jQuery: #seastar) animate left: '+=100px');
		with: 'Move Right'
]

{ #category : #rendering }
JQAnimateFunctionalTest >> renderToggleOn: html [
	html anchor
		onClick: ((html jQuery: #seastar) animate width: 'toggle');
		with: 'Toggle Width'.
	html anchor
		onClick: ((html jQuery: #seastar) animate height: 'toggle');
		with: 'Toggle Height'
]

{ #category : #accessing }
JQAnimateFunctionalTest >> selectors [
	^ #(renderContentOn: renderRelativeOn: renderAbsoluteOn: renderToggleOn: renderSeastarOn:)
]

{ #category : #accessing }
JQAnimateFunctionalTest >> title [
	^ 'Animations'
]
