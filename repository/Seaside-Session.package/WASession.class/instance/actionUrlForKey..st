accessing
actionUrlForKey: aString
  | url |
  url := self url.
  url addField: self actionField value: aString.
  self requestContext request isSafeToStream
    ifTrue: [ url addField: '_f' ].
  ^ url