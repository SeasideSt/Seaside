A WARequestCookie is the cookie the user agent sent to the server.

Instance Variables
	domain:			<String>
	key:			<String>
	path:			<String>
	pathEncoded:	<String>
	ports:			<Collection<Integer>>
	value:			<String>
	version:			<Integer>

domain
	- xxxxx

key
	- xxxxx

path
	- According to https://tools.ietf.org/html/rfc6265#section-5.1.4 user-agents must use an algorithm equivalent to the following one:
  1.  Let uri-path be the path portion of the request-uri if such a
       portion exists (and empty otherwise).  For example, if the
       request-uri contains just a path (and optional query string),
       then the uri-path is that path (without the %x3F ("?") character
       or query string), and if the request-uri contains a full
       absoluteURI, the uri-path is the path component of that URI.

   2.  If the uri-path is empty or if the first character of the uri-
       path is not a %x2F ("/") character, output %x2F ("/") and skip
       the remaining steps.

   3.  If the uri-path contains no more than one %x2F ("/") character,
       output %x2F ("/") and skip the remaining step.

   4.  Output the characters of the uri-path from the first character up
       to, but not including, the right-most %x2F ("/").

ports
	- xxxxx

value
	- xxxxx

version
	- the version of the cookie specification supported, currently only 1 is known
