testing
testDateSelectorFunctionalTest

	| fromDate toDate fromDateSelects toDateSelects fromTime toTime fromTimeSelects toTimeSelects deltaTime fromDateAndTime deltaDuration toDateAndTime fromDateAndTimeSelects toDateAndTimeSelects |
	self selectTest: 'WADateSelectorFunctionalTest'.

  fromDate := Date year: (Date today year - 1) month: 5 day: 11.
  toDate := fromDate addDays: 300.
	
	fromDateSelects := (((driver findElementByID: #dateForm) findElementByClassName: 'from') findElementsByTagName: 'select').
	(BPSelect on: (fromDateSelects at: 1)) selectByValue: fromDate monthIndex greaseString.
	(BPSelect on: (fromDateSelects at: 2)) selectByVisibleText: fromDate dayOfMonth greaseString.
	(BPSelect on: (fromDateSelects at: 3)) selectByVisibleText: fromDate year greaseString.

	toDateSelects := (((driver findElementByID: #dateForm) findElementByClassName: 'to') findElementsByTagName: 'select').
	(BPSelect on: (toDateSelects at: 1)) selectByValue: toDate monthIndex greaseString.
	(BPSelect on: (toDateSelects at: 2)) selectByVisibleText: toDate dayOfMonth greaseString.
	(BPSelect on: (toDateSelects at: 3)) selectByVisibleText: toDate year greaseString.

	(((driver findElementByID: #dateForm) findElementByXPath: './ancestor-or-self::form') findElementByCSSSelector: 'input[type=submit]') click.
	self workaroundChromeDriver.
	self assert: ((driver findElementByTagName:'h3') getText includesSubstring: '300 day(s)').
	(driver findElementByCSSSelector: 'input[type=submit]') click.
	self workaroundChromeDriver.
	
	fromTime := Time hour: 16 minute: 30 second: 10.
	deltaTime := Time hour: 4 minute: 30 second: 10.
	toTime := fromTime addTime: deltaTime.
	
	fromTimeSelects := (((driver findElementByID: #timeForm) findElementByClassName: 'from') findElementsByTagName: 'select').
	(BPSelect on: (fromTimeSelects at: 1)) selectByVisibleText: fromTime hour greaseString.
	(BPSelect on: (fromTimeSelects at: 2)) selectByVisibleText: fromTime minutes greaseString.
	(BPSelect on: (fromTimeSelects at: 3)) selectByVisibleText: fromTime seconds greaseString.
	
	toTimeSelects := (((driver findElementByID: #timeForm) findElementByClassName: 'to') findElementsByTagName: 'select').
	(BPSelect on: (toTimeSelects at: 1)) selectByVisibleText: toTime hour greaseString.
	(BPSelect on: (toTimeSelects at: 2)) selectByVisibleText: toTime minutes greaseString.
	(BPSelect on: (toTimeSelects at: 3)) selectByVisibleText: toTime seconds greaseString.
	
	(((driver findElementByID: #timeForm) findElementByXPath: './ancestor-or-self::form') findElementByCSSSelector: 'input[type=submit]') click.
	self workaroundChromeDriver.
	self assert: ((driver findElementByTagName:'h3') getText includesSubstring: deltaTime asSeconds greaseString,' second(s)').
	(driver findElementByCSSSelector: 'input[type=submit]') click.
	self workaroundChromeDriver.
	
	fromDateAndTime := DateAndTime now.
	deltaDuration := Duration days: 10 hours: 4 minutes: 30 seconds: 10.
	toDateAndTime := fromDateAndTime + deltaDuration.
	
	fromDateAndTimeSelects := (((driver findElementByID: #dateTimeForm) findElementByClassName: 'from') findElementsByTagName: 'select').
	(BPSelect on: (fromDateAndTimeSelects at: 1)) selectByValue: fromDateAndTime monthIndex greaseString.
	(BPSelect on: (fromDateAndTimeSelects at: 2)) selectByVisibleText: fromDateAndTime dayOfMonth greaseString.
	(BPSelect on: (fromDateAndTimeSelects at: 3)) selectByVisibleText: fromDateAndTime year greaseString.
	(BPSelect on: (fromDateAndTimeSelects at: 4)) selectByVisibleText: fromDateAndTime asTime hour greaseString.
	(BPSelect on: (fromDateAndTimeSelects at: 5)) selectByVisibleText: fromDateAndTime asTime minutes greaseString.
	(BPSelect on: (fromDateAndTimeSelects at: 6)) selectByVisibleText: fromDateAndTime asTime seconds greaseString.
	
	toDateAndTimeSelects := (((driver findElementByID: #dateTimeForm) findElementByClassName: 'to') findElementsByTagName: 'select').
	(BPSelect on: (toDateAndTimeSelects at: 1)) selectByValue: toDateAndTime monthIndex greaseString.
	(BPSelect on: (toDateAndTimeSelects at: 2)) selectByVisibleText: toDateAndTime dayOfMonth greaseString.
	(BPSelect on: (toDateAndTimeSelects at: 3)) selectByVisibleText: toDateAndTime year greaseString.
	(BPSelect on: (toDateAndTimeSelects at: 4)) selectByVisibleText: toDateAndTime asTime hour greaseString.
	(BPSelect on: (toDateAndTimeSelects at: 5)) selectByVisibleText: toDateAndTime asTime minutes greaseString.
	(BPSelect on: (toDateAndTimeSelects at: 6)) selectByVisibleText: toDateAndTime asTime seconds greaseString.