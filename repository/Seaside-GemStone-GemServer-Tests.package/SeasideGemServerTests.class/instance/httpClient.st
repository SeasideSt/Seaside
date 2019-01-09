accessing
httpClient
  "we'll use ZnEasy if it's available"

  ^ Smalltalk at: #'ZnEasy' ifAbsent: [  ]