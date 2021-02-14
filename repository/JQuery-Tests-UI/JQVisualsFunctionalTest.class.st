Class {
	#name : #JQVisualsFunctionalTest,
	#superclass : #JQUiFunctionalTest,
	#category : 'JQuery-Tests-UI-Functional'
}

{ #category : #rendering }
JQVisualsFunctionalTest >> renderContentOn: html [
	self renderHighlightOn: html.
	self renderErrorOn: html
]

{ #category : #rendering }
JQVisualsFunctionalTest >> renderErrorOn: html [
	html div class: 'ui-corner-all ui-state-error'; with: [
		html paragraph: [ 
			html span class: 'ui-icon ui-icon-alert'.
			html strong: 'Error: '.
			html text: 'Sample ui-state-error style.' ] ]
]

{ #category : #rendering }
JQVisualsFunctionalTest >> renderHighlightOn: html [
	html div class: 'ui-corner-all ui-state-highlight'; with: [
		html paragraph: [ 
			html span class: 'ui-icon ui-icon-info'.
			html strong: 'Hey! '.
			html text: 'Sample ui-state-highlight style.' ] ]
]

{ #category : #accessing }
JQVisualsFunctionalTest >> selectors [
	^ #(renderHighlightOn: renderErrorOn:)
]

{ #category : #hooks }
JQVisualsFunctionalTest >> style [
	^ '.ui-corner-all { padding: 0.1em 0.5em; margin: 1em auto; width: 500px; }
.ui-corner-all .ui-icon { float: left; margin-right: 0.3em; }'
]

{ #category : #accessing }
JQVisualsFunctionalTest >> title [
	^ 'Visual Theming'
]

{ #category : #accessing }
JQVisualsFunctionalTest >> url [
	^ 'http://docs.jquery.com/UI/Theming/API'
]
