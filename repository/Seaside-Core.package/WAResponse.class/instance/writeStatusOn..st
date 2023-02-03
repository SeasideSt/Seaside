writing
writeStatusOn: aStream
  "32 = ascii value for Character space"

  aStream nextPutAll: self httpVersion.
  aStream
    space;
    nextPutAll: self status greaseString.
  self message isNil
    ifFalse: [ 
      aStream
        space;
        nextPutAll: self message ].
  aStream crlf