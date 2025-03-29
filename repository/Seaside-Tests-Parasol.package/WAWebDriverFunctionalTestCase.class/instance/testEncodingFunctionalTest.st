testing
testEncodingFunctionalTest
	| germanSentence czechSentence japaneseSentence |
	germanSentence := 'Im finſteren Jagdſchloß am offenen Felsquellwaſſer patzte der affig-flatterhafte kauzig-höf‌liche Bäcker über ſeinem verſifften kniffligen C-Xylophon.'.
	czechSentence := 'Příliš žluťoučký kůň úpěl ďábelské kódy.'.
	japaneseSentence := 'いろはにほへど　ちりぬるを'.
	self selectTest: 'WAEncodingFunctionalTest'.
	(Array with: germanSentence with: czechSentence with: japaneseSentence)
		do: [ :sentence | 
			#(urlencoded multipart get)
				do: [ :idpart | 
					| formid headingid |
					formid := idpart , 'form'.
					headingid := idpart , 'heading'.
					((driver findElementByID: formid) findElementByCSSSelector: 'input[type=text]') sendKeys: sentence.
					((driver findElementByID: formid) findElementByCSSSelector: 'input[type=submit]') click.
							"Webdriver suddenly stopped waiting for the page to navigate after submitting (March 2025)"
							"Discussion: https://groups.google.com/g/selenium-users/c/vfG6A6XVkA0/m/F351RKv5BAAJw"
							(Delay forMilliseconds: 500) wait.
					self assert: (driver findElementByID: headingid) getText equals: idpart , sentence ]
				separatedBy: [ ((driver findElementsByCSSSelector: 'input[type=submit]') detect:[ :e | (e getAttribute: 'value') = 'Restart' ]) click ] ]