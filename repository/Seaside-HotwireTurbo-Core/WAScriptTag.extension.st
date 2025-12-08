Extension { #name : 'WAScriptTag' }

{ #category : '*Seaside-HotwireTurbo-Core' }
WAScriptTag >> turboEval: aString [
	"Annotate <script> elements with data-turbo-eval=""false"" if you do not want 
	Turbo to evaluate them after rendering. 
	Note that this annotation will not prevent your browser from evaluating scripts on the initial page load."

	self dataAttributeAt: 'turbo-eval' put: aString
]
