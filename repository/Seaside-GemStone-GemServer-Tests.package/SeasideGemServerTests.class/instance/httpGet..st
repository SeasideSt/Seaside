http client support
httpGet: urlObject
  | client |
  client := self httpClientClass new
    beOneShot;
    yourself.
  client
    numberOfRetries: 4;
    retryDelay: 2.	"be generous with retries for tests run on loaded systems"
  ^ client
    url: urlObject;
    get;
    response