testing
testFlowFunctionalTest
  | stackdepth |
  self selectTest: 'WAFlowFunctionalTest'.
  (driver findElementByPartialLinkText: 'go anchors') click.
  stackdepth := (driver findElementByPartialLinkText: '1:') getText copyAfterLast: $:.
  1 to: 5 do: [ :i | 
    self 
		assert: ((driver findElementByPartialLinkText: i greaseString , ':') getText copyAfterLast: $:)
      equals: stackdepth.
    (driver findElementByPartialLinkText: i greaseString , ':') click ].
  (driver findElementByPartialLinkText: 'go buttons') click.
  self workaroundChromeDriver.
  stackdepth := (driver findElementByTagName: 'h3') getText copyAfterLast: $:.
  1 to: 5 do: [ :i | 
    self
      assert: (driver findElementByTagName: 'h3') getText
      equals: i asString , ':' , stackdepth greaseString.
    (GRPlatform current class == (Smalltalk at: #GRGemStonePlatform ifAbsent:[ nil ]) and: [ i > 1 ])
      ifTrue: [ stackdepth := ' ' , (stackdepth asInteger + 1) greaseString ].
    ((driver findElementsByCSSSelector: 'input[type=submit]')
      detect: [ :e | (e getAttribute: 'value') = 'Ok' ]) click ]