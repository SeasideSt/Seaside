WAPresenterGuides takes another WAPainterVisitor as a client. When asked to visit a Component, they will first visit its Decorations. Along the way, they will ask their client to visit each Painter they come across.

This allows us to separate the behaviour of the various Presenter-tree traversal methods from the behaviour to perform on each Presenter we visit.