I track request handlers using a query field. This results in URLs looking like this:

/tests/functional?_s=de379kaie13

This is a very simple and robust approach. It is also very convenient for development. Just remove the _s and you have a new session.

However there are some drawbacks. The smallest is aesthetical, the URL in the address bar of the browser is less "clean". Second because the session id is part of the request URL it shows up in all kinds of places. For example server logs. Not only the log of the server running the application but also very web site visited from there because it shows up in the Referer HTTP header. The danger of this is that when somebody knows the session id of somebody else he can take over his session. Most of these problems can be mitigated by adding a WARemoteAddressProtectionFilter or WASessionCookieProtectionFilter to every session. 

Mind that WARemoteAddressProtectionFilter creates new problems for users with changing IPs (eg. mobile devices) and WASessionCookieProtectionFilter requires cookies.