testing
assert: anObject rendersAs: aString
	| oldContext document newContext stream |
	stream := WriteStream on: String new.
	oldContext := WARenderContext new
		actionUrl: WAUrl new;
		document: (WAHtmlDocument on: stream);
		yourself.
	oldContext visitor: (WARenderingGuide client: (WARenderVisitor context: oldContext)).
	newContext := oldContext copy.
	newContext disableHalos.
	document := WAPrettyPrintedDocument context: oldContext.
	newContext document: document.
	(WARenderVisitor context: newContext) start: anObject. "from tools-web should be in dependency list"
	newContext document close.
	self assert: aString equals: stream contents