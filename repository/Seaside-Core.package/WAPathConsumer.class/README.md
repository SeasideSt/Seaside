A WAPathConsumer keeps track of the unconsumed path elements in request handling.

Image the following request path:
/start/middle/end
and a dispatcher mapped at 'start' and an application mapped at 'middle'.
First nothing at all would be consumed so the unconsumed path would be #('start' 'middle' 'end').
Then the dispatcher consumes 'start' and delegates to the application so the unconsumed path would be #('middle' 'end').
Then the application consumes 'middle' so the unconsumed path would be #('end').
In that case
self requestContext consumer peek
inside an #initialRequest: should answer 'end'.

Instance Variables
	path:		<Collection<String>>

path
	- the collection of unconsumed path elements
