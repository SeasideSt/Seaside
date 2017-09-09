I implement a session tracking strategy that emulates common JavaEE application servers (Tomcat, WildFly AS). I am similar to WACookieIfSupportedSessionTrackingStrategy.

I will do the following
- add a cookie named JSESSIONID
- add a path parameter named jsessionid until we see a cookie, eg. /;jsessionid=1234?_k=5678