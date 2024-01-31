testing
testUploadFunctionalTest

	| file |
	self selectTest: 'WAUploadFunctionalTest'.

	file := GRPlatform current newTemporaryFileReferenceNamed: 'testfile.txt'.
	GRPlatform current
		writeFileStreamOn: file pathString
		do: [ :stream | stream nextPutAll: 'blabla' ]
		binary: false.

	(driver findElementByCSSSelector: 'input[type=file]') sendKeys: file pathString.
	(driver findElementByCSSSelector: 'input[value=Load]') click.

	self assert: (driver findElementByCSSSelector: 'pre') getText equals: 'blabla'