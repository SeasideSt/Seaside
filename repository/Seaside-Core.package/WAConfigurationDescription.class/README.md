I hold a collection of attributes and present methods to construct new methods, providing an interface a bit like WACanvas and #renderContentOn: to WASystemConfiguration>>addAttributes:.

I can use any kind of collection class and handle setting the #configuration: parameter of the attribute appropriately on addition. If my collection is a Dictionary, I will store the attributes by their keys.
