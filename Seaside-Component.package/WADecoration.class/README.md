I am an abstract decoration around instances of WAComponent. I can be added to aComponent by calling #addDecoration: and I change the basic behaviour or look of a component. There are several methods that can be overriden to archive this:

- #renderContentOn: to emit xhtml around the decorated component. Call #renderOwnerOn: to let the owner emit its output.

- #handleAnswer: to intercept the answer processing.