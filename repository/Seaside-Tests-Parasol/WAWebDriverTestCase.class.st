Class {
	#name : 'WAWebDriverTestCase',
	#superclass : 'BPSeasideWebDriverTestCase',
	#category : 'Seaside-Tests-Parasol',
	#package : 'Seaside-Tests-Parasol'
}

{ #category : 'running' }
WAWebDriverTestCase >> desiredDriverBrowserCapabilities [
  | capabilities |
  capabilities := BPChromeOptions new.
  self isInTestDebuggingMode
    ifFalse: [ 
      capabilities setHeadless: true.
      capabilities
        addArguments:
          (#('no-sandbox' 'window-size=1920,1080')
            flag:
              'Passing a window size here has no effect, as the window size is set in #setUp?') ].	"or: [ self isRunningHeadFullOnTravis ]"
  ^ capabilities
]

{ #category : 'running' }
WAWebDriverTestCase >> isInTestDebuggingMode [

	"Note: Implemented using reflection, since otherwise we'd have to redefine TestCase>>debug and TestCase's instance variables."

	| ctx |
	ctx := GRPlatform current thisContext.
	
	50 timesRepeat: [
		ctx ifNil: [ ^ false ].
		(#(#debug #debug:) includes: ctx method selector) ifTrue: [ ^ true ].
		ctx := ctx sender.
	].
	^ false
]

{ #category : 'helpers' }
WAWebDriverTestCase >> workaroundChromeDriver [
	"Webdriver suddenly stopped waiting for the page to navigate after submitting (March 2025)
	Discussion:
		- https://issues.chromium.org/issues/402796660
		- https://groups.google.com/g/selenium-users/c/vfG6A6XVkA0/m/F351RKv5BAAJw
		- https://github.com/teamcapybara/capybara/issues/2800"

	(Delay forMilliseconds: 500) wait
]
