testing
testUploadFunctionalTest

	| filePathString |
	self selectTest: 'WAUploadFunctionalTest'.

	[ 
		filePathString := GRPlatform current newTemporaryFileNamed: 'testfile.txt'.
		GRPlatform current
			writeFileStreamOn: filePathString
			do: [ :stream | stream nextPutAll: 'blabla' ]
			binary: false.

		(driver findElementByCSSSelector: 'input[type=file]') sendKeys: filePathString.
		(driver findElementByCSSSelector: 'input[value=Load]') click.
		self workaroundChromeDriver.
		self assert: (driver findElementByCSSSelector: 'pre') getText equals: 'blabla'
	] ensure: [ GRPlatform current deleteFile: filePathString ]