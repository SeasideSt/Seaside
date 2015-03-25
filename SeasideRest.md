# Introduction #

Seaside-REST allows you to easily dispatch to methods based on several properties of an HTTP request. Think of pattern matching in functional programming languages for an HTTP request. This can be used to write RESTful web application.

# Loading #

Seaside-REST can be found at [Seaside 3.0 Addons](http://www.squeaksource.com/Seaside30Addons.html).

# Details #

You start by sublassing either `WARestfulHandler` or `WARestfulFilter` and putting methods there. There are several request properties that you can dispatch on:

## HTTP Method ##
Every method must have a pragma that indicates the HTTP method on which it should be invoked.
```
simpleGet
   <get>
```
```
simplePost
   <post>
```

## Request URL path ##
You can mark method to be executed only on a certain request path and bind it to method arguments.
```
getEmptyPath
    "will be executed if the request path is empty"
    <get>
```
```
getFirstPathElement: pathElement
    "Will be executed if the request path is one element long, the path element will be bound
    to the first method argument.
    Eg. if the request is for '/index.html' the value of pathElement will be 'index.html'"
    <get>
```
```
getFirstPathElement: firstPathElement secondPathElement: secondPathElement
    "Will be executed if the request path is two elements long, the first path element will be bound
    to the first method argument, the second path element will be bound to the second method argument.
    Eg. if the request is for '/mail/index.html' the value of firstPathElement will be 'firstPathElement'
    and the value of secondPathElement will be 'index.html'"
    <get>
```
You can use the `Path:` pragma to get more control over when the method should be invoked.
```
getFrontPage: applicationName
    "Will be executed if the request path is two elements long and the second element is equal to 'index.html'.
    The first path element will be bound to the first method argument, the second path element will be discarded.
    Eg. if the request is for '/mail/index.html' the value of applicationName will be 'mail'"
    <get>
    <path: '/{applicationName}/index.html'>
```
In case case the name of the placeholder (`applicationName`) must match the method argument name. The same can be achieved with:
```
getFrontPage: applicationName
    "Will be executed if the request path is two elements long and the second element is equal to 'index.html'.
    The first path element will be bound to the first method argument, the second path element will be discarded.
    Eg. if the request is for '/mail/index.html' the value of applicationName will be 'mail'"
    <get>
    <path: '/{1}/index.html'>
```
In case case the index of the placeholder (1) must match the index of the method argument. You can use this to reorder arguments.
```
getPage: pageName for: applicationName
    "Will be executed if the request path is two elements long.
    The first path element will be bound to the second method argument, the second path element will be
    bound to the second method argument.
    Eg. if the request is for '/mail/index.html' the value of pageName will be 'index.html' and the value of applicationName will be 'mail'"
    <get>
    <path: '/{2}/{1}'>
```
This can also be done with named place holder:
```
getPage: pageName for: applicationName
    "Will be executed if the request path is two elements long.
    The first path element will be bound to the second method argument, the second path element will be
    bound to the second method argument.
    Eg. if the request is for '/mail/index.html' the value of pageName will be 'index.html' and the value of applicationName will be 'mail'"
    <get>
    <path: '/{applicationName}/{pageName}'>
```
Also partial matches are supported for example
```
getHtmlPageName: pageName
    "Will be executed if the request path is one element long and ends with '.html'.
    The first path element will be bound to the path element minus '.html'.
    Eg. if the request is for '/index.html' the value of pageName will be 'index'."
    <get>
    <path: '/{pageName}.html'>
```
or
```
getIndexPage: extension
    "Will be executed if the request path is one element long and starts with 'index.'.
    The first path element will be bound to the path element minus 'index.'.
    Eg. if the request is for '/index.html' the value of pageName will be 'html'."
    <get>
    <path: '/index.{extension}'>
```
You can match different path elements with an or expression
```
getMethodsOrClasses
    "Will be executed if the request path is one element long and either 'methods.mcz' or 'classes.mcs'."
    <get>
    <path: '/[methods.mcz|classes.mcs]'>
```
Finally you can match an arbitrary number (zero or more) of path elements
```
getFile: path
    "Will be executed if the request path zero or more.
    Eg. if the request is for '/a/b/c' the value of pageName will be #('a' 'b' 'c')."
    <get>
    <path: '/*path*'>
```
You can combine this with other patterns
```
getFile: fileName at: pathTerms fromProject: projectName
    <get>
    <path: '/projects/{projectName}/*pathTerms*/{fileName}.mcz/[classes|methods]'>
```

## Query Arguments ##
You can also
```
searchFor: query
    "Will be executed if the request path is 'search' and there is a query parameter named 'q'.
    The value of the query parameter will be the value of the method argument.
    Eg. if the request is for '/search?q=Seaside' the value of query will be 'Seaside'."
    <get>
    <path: '/search?q={query}'>
```
Note that this can be combined with the patch matching techniques outlined above.

## Conent-Type ##
You can mark methods as to be invoked only on certain content types. This only makes sense for HTTP methods that have a request body like POST and PUT.
```
urlEncodedPost
    <post>
    <consumes: 'application/x-www-form-urlencoded'>
```
Note that wildcards are supported
```
postXml
    <post>
    <consumes: '*/xml'>
```
or
```
postImage
    <post>
    <consumes: 'image/*'>
```

## Accept ##
You can mark methods as to be invoked when the client accepts the response content type.
```
getPng
    <get>
    <produces: 'image/png'>
```
Note that wildcards are supported
```
getXml
    <post>
    <produces: '*/xml'>
```
or
```
getImage
    <post>
    <produces: 'image/*'>
```

## Conflict Resolution ##
Sometimes there are several methods which Seaside-REST could choose for a request, here's how it finds the "best" one.
  1. Exact path matches like '/index.html' take precedence over partial ('/index.{1}' or '{1}.html') or wildcard ones ('{1}').
  1. Partial path matches like '/index.{1}' or '{1}.html' take precedence over wildcard ones ('{1}').
  1. Partial single element matches ('{1}') take precedence over multi element matches ('**1**')
  1. Exact mime type matches like 'text/xml' take precedence over partial ('`*`/xml' or 'xml/`*`'), wildcard ('`*`/`*`') and missing ones.
  1. Partial mime type matches like '`*`/xml' or 'xml/`*`' take precedence over wildcard ones ('`*`/`*`') or missing ones.
  1. If the user agent supplies quality values for the Accept header, then that is taken into account as well.

## Registration ##
If you have a subclass of `WAPragmaBasedRestfulHandler` you can register it as:
```
WAAdmin register: MyRestHandler at: 'myapp'.
```

When you have a subclass of `WAPragmaBasedRestfulFilter` that you want to add to your application you can add it with:
```
| application |
application := WAAdmin register: MyRootComponent asApplicationAt: 'myapp'.
application addFilterFirst: MyRestFilter new.
```