I disable a web application to be framed into other web pages. This helps preventing clickjacking attacks.
I only implement ALLOW FROM. If you want DENY or SAMEORIGIN you have to use WAFrameOptionsFilter.

https://developer.mozilla.org/en-US/docs/HTTP/X-Frame-Options
http://www.codinghorror.com/blog/2009/06/we-done-been-framed.html