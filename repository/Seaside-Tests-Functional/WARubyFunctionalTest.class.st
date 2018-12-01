"
Examples taken directly from spec:
http://www.w3.org/TR/2001/REC-ruby-20010531/

"
Class {
	#name : #WARubyFunctionalTest,
	#superclass : #WAFunctionalTest,
	#category : 'Seaside-Tests-Functional'
}

{ #category : #rendering }
WARubyFunctionalTest >> renderContentOn: html [
	self renderSimpleOn: html.
	self renderSimpleParenthesesOn: html
]

{ #category : #rendering }
WARubyFunctionalTest >> renderSimpleOn: html [
	html heading level2; with: 'Simple ruby markup'.
	html ruby: [
		html text: 'WWW'.
		html rubyText: 'World Wide Web' ]
]

{ #category : #rendering }
WARubyFunctionalTest >> renderSimpleParenthesesOn: html [
	html heading level2; with: 'Simple ruby markup with parentheses'.
	html ruby: [
		html text: 'WWW'.
		html rubyParentheses: '('.
		html rubyText: 'World Wide Web'.
		html rubyParentheses: ')' ]
]
