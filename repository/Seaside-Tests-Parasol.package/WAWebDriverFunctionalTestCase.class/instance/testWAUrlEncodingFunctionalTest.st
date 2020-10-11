testing
testWAUrlEncodingFunctionalTest
	| checkAction |
	self selectTest: 'WAUrlEncodingFunctionalTest'.
	
	checkAction := [ :text | 
		(driver findElementByID: 'input') clear; sendKeys: text.
		((driver findElementByID: 'input') findElementByXPath: '../input[@type="submit"]') click.
		self assert: (driver findElementByID: 'inputresult') getText equals: text.
		self assert: (driver findElementByID: 'parameterresult') getText equals: text.
		self assert: (driver findElementByID: 'pathresult') getText equals: text ].

	checkAction value: 'kācaṃ śaknomyattum; nopahinasti mām'.
	checkAction value: 'Mohu jíst sklo, neublíží mi'.
	checkAction value: 'Les naïfs ægithales hâtifs pondant à Noël où il gèle sont sûrs d''être déçus en voyant leurs drôles d''œufs abîmés'.
	checkAction value: 'Im finſteren Jagdſchloß am offenen Felsquellwaſſer patzte der affig-flatterhafte kauzig-höf‌liche Bäcker über ſeinem verſifften kniffligen C-Xylophon'.