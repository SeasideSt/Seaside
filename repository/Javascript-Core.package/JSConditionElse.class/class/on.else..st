instance creation
on: statement else: elseStatement

	^ (super on: statement)
		elseStatement: elseStatement;
		yourself