I disable a web application to be framed into other web pages. This helps preventing clickjacking attacks.
I only implement DENY and SAMEORIGIN. If you want ALLOW FROM you have to use WAFrameOptionsAllowFromFilter.

https://developer.mozilla.org/en-US/docs/HTTP/X-Frame-Options
http://www.codinghorror.com/blog/2009/06/we-done-been-framed.html