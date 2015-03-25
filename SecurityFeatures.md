Unlike some low level frameworks Seaside offers built in protection against many common web application vulnerabilities.

# Attacks #

This is how Seaside protects you against common attacks against your web application.

## Session Fixation ##
Further information:
  * http://www.owasp.org/index.php/Session_fixation

Not possible because client supplied session ids are ignored when no matching session is found. Review the implementors of `#noHandlerFoundForKey:in:context:`.

## Cross-site Scripting (XSS) ##
The Seaside templating engine—the render canvas—escapes all output by default. It therefore adopts a safe by default policy. Special effort has to be taken to render values without escaping. Such places can easily be found and audited by looking at all the senders of #html:.

Further information:
  * http://www.owasp.org/index.php/XSS
  * http://en.wikipedia.org/wiki/Cross-site_scripting
  * http://wonko.com/post/html-escaping

## Cross-Site Request Forgery (CSRF) ##
Further information:
  * http://www.owasp.org/index.php/Cross-Site_Request_Forgery_(CSRF)

## Response Splitting ##
HTTP response splitting is an attack that allows an attacker to control response headers and the body by injecting a header with a CR or LF value. Seaside does not allow CR or LF values in headers which are also not allowed by HTTP.

Further information:
  * http://www.owasp.org/index.php/Response_Splitting
  * http://en.wikipedia.org/wiki/HTTP_response_splitting
  * http://nealpoole.com/blog/2011/01/http-response-splitting-on-reddit-com/

## Malicious File Execution ##
Further information:
  * http://www.owasp.org/index.php/Top_10_2007-A3

# Features #
In addition to the protections against the attacks above Seaside offers the following security related features.

## Capabilities ##

## Strict Transport Security (STS) ##

## DoS ##
  * hash collisions
  * request headers (body size)

## Arbitrary Code Execution ##
`Boolean readFrom:`

# Further Information #
  * [Open Web Application Security Project (OWASP)](http://www.owasp.org/)
  * [Ruby On Rails Security Guide](http://guides.rubyonrails.org/security.html)
  * http://ibuildings.nl/blog/2013/03/4-http-security-headers-you-should-always-be-using