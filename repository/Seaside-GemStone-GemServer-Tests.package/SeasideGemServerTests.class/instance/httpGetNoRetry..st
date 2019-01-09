http client support
httpGetNoRetry: urlObject
  | client |
  client := self httpClientClass new
    beOneShot;
    yourself.
  ^ client
    url: urlObject;
    get;
    response