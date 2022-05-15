running
desiredDriverBrowserCapabilities

	| capabilities |

	capabilities := BPChromeOptions new.

	(self isInTestDebuggingMode) ifFalse: [
		capabilities setHeadless: true.
		capabilities addArguments: (#('no-sandbox' 'window-size=1920,1080') flag: 'Passing a window size here has no effect, as the window size is set in #setUp?') ].
		
	^ capabilities