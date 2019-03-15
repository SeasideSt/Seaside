private
addCookieRFC6265: aWACookie toStream: aStream
  aStream
    nextPutAll: 'Set-Cookie: ';
    nextPutAll: aWACookie rfc6265String;
    nextPut: Character cr;
    nextPut: Character lf