helpers
workaroundChromeDriver
	"Webdriver suddenly stopped waiting for the page to navigate after submitting (March 2025)
	Discussion:
		- https://issues.chromium.org/issues/402796660
		- https://groups.google.com/g/selenium-users/c/vfG6A6XVkA0/m/F351RKv5BAAJw
		- https://github.com/teamcapybara/capybara/issues/2800"

	(Delay forMilliseconds: 500) wait