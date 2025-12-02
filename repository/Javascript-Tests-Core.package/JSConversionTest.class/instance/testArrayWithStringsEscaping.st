tests
testArrayWithStringsEscaping

	self assert: #('<script>' '<scri' 'pt>') equals: '["\x3Cscript>","<scri","pt>"]'.
	self assert: #(< <=) equals: '["<","<="]'