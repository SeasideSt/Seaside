rendering
renderContentOn: html

	self applicationDeployed
		ifTrue: ["Production"
			^self renderProductionContentOn: html].
	"Development"
	continuation == nil 
		ifTrue: [
			self renderHeadingOn: html.
			self renderInstructionsOn: html]
		ifFalse: [ super renderContentOn: html ]