tests
testAsFilename
	| library |
	library := WATestingFiles default.
	self assert: (library asFilename: #mainJs) = 'main.js'.
	self assert: (library asFilename: #style2Css) = 'style2.css'.
	self assert: (library asFilename: #index) = 'index'