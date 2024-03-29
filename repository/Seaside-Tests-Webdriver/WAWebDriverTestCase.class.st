Class {
	#name : 'WAWebDriverTestCase',
	#superclass : 'BPSeasideWebDriverTestCase',
	#category : 'Seaside-Tests-Webdriver',
	#package : 'Seaside-Tests-Webdriver'
}

{ #category : 'running' }
WAWebDriverTestCase >> desiredDriverBrowserCapabilities [

	^ BPDesiredCapabilities chrome
]
