I represent a cookie, a piece of information that is stored on the client and read and writable by the server. I am basically a key/value pair of strings.
You can never trust information in a cookie, the client is free to edit it.
I model only a part of the full cookie specification.

Browser support:
http://www.mnot.net/blog/2006/10/27/cookie_fun

Netscape spec
http://cgi.netscape.com/newsref/std/cookie_spec.html

Cookie spec
http://tools.ietf.org/html/rfc2109

Cookie 2 spec
http://tools.ietf.org/html/rfc2965

HttpOnly
http://msdn2.microsoft.com/en-us/library/ms533046.aspx
https://bugzilla.mozilla.org/show_bug.cgi?id=178993

Compared to WARequestCookie I represent the information that is sent to the user agent.