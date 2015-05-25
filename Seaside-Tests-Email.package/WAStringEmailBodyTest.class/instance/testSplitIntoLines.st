tests
testSplitIntoLines
	| cr toSplit actual |
	cr := String with: Character cr.
	
	toSplit := cr, cr, 'a', cr, cr.
	actual := WAStringEmailBody splitIntoLines: toSplit.
	self assert: actual size = 5.
	#('' '' 'a' '' '') keysAndValuesDo: [ :index :expected |
		self assert: (actual at: index) = expected ].
	
	toSplit := cr, cr, 'a', cr.
	actual := WAStringEmailBody splitIntoLines: toSplit.
	self assert: actual size = 4.
	#('' '' 'a' '') keysAndValuesDo: [ :index :expected |
		self assert: (actual at: index) = expected ].
	
	toSplit := cr, cr, 'a'.
	actual := WAStringEmailBody splitIntoLines: toSplit.
	self assert: actual size = 3.
	#('' '' 'a') keysAndValuesDo: [ :index :expected |
		self assert: (actual at: index) = expected ]