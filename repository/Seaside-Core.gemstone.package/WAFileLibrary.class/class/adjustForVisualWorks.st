vw port-squeak
adjustForVisualWorks
	| newSource oldSource badCode goodCode |
	badCode := 'xxxCache := #(nil).'.
	goodCode := 'xxxCache := #(nil) beMutable.'.
	self selectors do: [ :selector |
		oldSource := self sourceCodeAt: selector.
		(oldSource indexOfSubCollection: badCode startingAt: 1) > 0 ifTrue: [
			newSource := oldSource copyReplaceAll: badCode with: goodCode.
			self compile: newSource classified: self methodCategory ] ]