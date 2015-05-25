I am a subclass of WAComponent, specialized for defining workflow.  The difference between a task and a component is the following:

Both of them are reusable, embeddable, callable pieces of user interface. A component has state (instance variables), behavior (it may change its state, and it may also choose to display other components with #call:), and appearance (it renders HTML). A Task has only the first two - it doesn't render any HTML directly, but only through the components it calls. This is useful when what you want to encapsulate/embed/call is purely a process (show this component, then this one, then this one).

The key method for WATask is #go - as soon as a task is displayed, this method will get invoked, and will presumably #call: other components.

In terms of implementation, you can think of a WATask in the following way: it is a component which renders two things:
- a link whose callback invokes the #go method
- a header that immediately redirects to the URL of that link

Subclasses must not implement #renderContentOn:

An example can be found in WAFlowConvenienceFunctionalTest.
