writing
writeStatusOn: aStream
  aStream nextPutAll: self httpVersion.
  aStream
    nextPutAll: $  greaseString;
    nextPutAll: self status greaseString.
  self message isNil
    ifFalse: [ 
      aStream
        nextPutAll: $  greaseString;
        nextPutAll: self message ].
  aStream crlf