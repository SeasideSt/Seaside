rendering
renderContentOn: html
  html heading: 'CORS Test Page'.
  self runningOnGemStone
    ifTrue: [ 
      html
        paragraph:
          'Make sure the CORS adaptor is running manually since we cannot check it when running on GemStone.' ].
  (self runningOnGemStone not
    and: [ 
      WACORSResourceExample corsAdaptor isNil
        or: [ WACORSResourceExample corsAdaptor isRunning not ] ])
    ifTrue: [ self renderAdaptorSetupOn: html ]
    ifFalse: [ 
      self corsFilter
        ifNil: [ self renderResourceRegistrationOn: html ]
        ifNotNil: [ self renderTestingOn: html ] ]