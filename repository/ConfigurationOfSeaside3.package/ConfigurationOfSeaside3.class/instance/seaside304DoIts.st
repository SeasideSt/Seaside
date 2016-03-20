doits
seaside304DoIts
	"see Issue 643: http://code.google.com/p/seaside/issues/detail?id=643"
	
	true ifTrue: [ ^self ].
	"When issue 643 is resolved we'll see what is really needed"
	(Smalltalk at: #WASystemConfiguration) allSubclasses do: [ :each | 
		each instance perform: #clearSearchContexts.
		each instance perform: #clearDescription ].
	"Needed for GemStone ... not clear why yet...."
	(Smalltalk at: #WAFileHandler) default: nil.
	(Smalltalk at: #WASharedConfiguration) instVarNamed: 'instances' put: nil.
	(Smalltalk at: #WASharedConfiguration) initialize.
