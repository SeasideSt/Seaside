testing
testFlowDelegationFunctionalTest
  | step1aVisiblePresenters step1bVisiblePresenters step2VisiblePresenters step1cVisiblePresenters |
  self selectTest: 'WAFlowDelegationFunctionalTest'.
  step1aVisiblePresenters := OrderedCollection new.
  step1bVisiblePresenters := OrderedCollection new.
  step2VisiblePresenters := OrderedCollection new.
  step1cVisiblePresenters := OrderedCollection new.	"1"
  self assert: (driver findElementByTagName: 'h3') getText equals: 'Step 1'.
  (driver findElementByCSSSelector: 'input[type=submit][value=Ok]') click.
  self workaroundChromeDriver.
  self assert: (driver findElementByTagName: 'h3') getText equals: 'Step 2'.
  self componentUnderTest
    visiblePresentersDo: [ :presenter | step1aVisiblePresenters add: presenter class name ].
  self
    assert:
      (step1aVisiblePresenters select: [ :p | p = #'WAAnswerHandler' ]) size
    equals: 1.	"2"
  driver goBack.
  self assert: (driver findElementByTagName: 'h3') getText equals: 'Step 1'.
  self componentUnderTest
    visiblePresentersDo: [ :presenter | step1bVisiblePresenters add: presenter class name ].
  self
    assert: (step1bVisiblePresenters select: [ :p | p = #'WAAnswerHandler' ]) size
    equals: 1.
  self assert: step1aVisiblePresenters equals: step1bVisiblePresenters.	"3"
  self assert: (driver findElementByTagName: 'h3') getText equals: 'Step 1'.
  (driver findElementByCSSSelector: 'input[type=submit][value=Ok]') click.
  self workaroundChromeDriver.
  self assert: (driver findElementByTagName: 'h3') getText equals: 'Step 2'.
  self componentUnderTest
    visiblePresentersDo: [ :presenter | step2VisiblePresenters add: presenter class name ].
  self assert: step1aVisiblePresenters equals: step2VisiblePresenters.	"4"
  (driver findElementByCSSSelector: 'input[type=submit][value=Ok]') click.
  self workaroundChromeDriver.
  self assert: (driver findElementByTagName: 'h3') getText equals: 'Step 1'.
  self componentUnderTest
    visiblePresentersDo: [ :presenter | step1cVisiblePresenters add: presenter class name ].
  self
    assert: (step1cVisiblePresenters select: [ :p | p = #'WAAnswerHandler' ]) size
    equals: 1.
  self assert: step1aVisiblePresenters equals: step1cVisiblePresenters