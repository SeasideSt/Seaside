Making sure all objects are properly initialized can be complex, particularly when dealing with multiple platforms. We have adopted the following initialization and instance creation conventions in Seaside to make sure behaviour is consistent. If possible, make sure classes inherit from `GRObject`; This will ensure that the class has an `#initialize` method and that it gets called when an object is created with `#new`.

# Initialization #

  * Each class **must** have _one_ (and _only_ one) primary initialization method ("designated initializer") which accepts all _required_ initialization parameters. By default this designated initializer is #initialize.
  * There are two options for a class to perform its initialization:
    * If a class _does not_ add new required parameters, it should override the designated initializer of its superclass. It might also choose to override another inherited initialization method but, in either case, it **must** call the overridden version with `super`.
    * If a class _does_ add required initialization parameters, it should define a new designated initializer (e.g. `#initializeWithFoo:bar:`). This method **must** call the designated initializer of its superclass with `self` (_not_ `super`). For example:

```
initializeWithFoo: aNumber bar: aString
	self initialize.
	foo := aNumber.
	bar := aString
```

# Instance Creation #

  * Each class **should** have one primary instance creation method ("designated constructor") that uses `#basicNew` and then the designated initializer. You **must not** use `#new` instead of `#basicNew` as this would result in the designated constructor of the superclass being called twice. For example:

```
foo: aNumber bar: aString
	^ self basicNew
		initializeWithFoo: aNumber bar: aString;
		yourself
```

  * Initialization methods **should** always return `self` but don't count on it; you **must** return using `#yourself`.
  * You **may** have alternate instance creation methods that just call the designated constructor with different parameters or perform additional actions. It is _technically_ possible to have multiple constructors using `#basicNew` but this should be avoided because it requires all of these methods to be overridden by subclasses (see below). In any case, all instance creation methods **must** result in the designated initializer being called.
  * If a class defines a new designated initializer it:
    * **must** provide a new designated contructor using the pattern above; and
    * **must** override the designated constructor(s) of the superclass to something appropriate (either call the new designated constructor with appropriate defaults or error of there are no defaults).

# Optional Initialization Parameters #

  * If a class has initialization parameters that are _not_ required but should _only_ be set during instance creation, a setter method should be implemented of the form `#setFoo:` and placed in the `initialization` method category. These methods can be used by the instance creation methods in various combinations as necessary.

# Example #

```
GRObject>>initialize
	"default designated initializer"

GRObject class>>new
	"designated constructor"
	^ self basicNew
		initialize;
		yourself

GRObject subclass: #WARectangle
	instanceVariableNames: 'width height'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Example'

WARectangle>>initializeWithWidth: wInteger height: hInteger
	"height and width are required, so we need a new
	designated initializer."
	width := wInteger.
	height := hInteger.
	"Now we need to call the designated initializer of
	our superclass."
	self initialize

WARectangle class>>width: wInteger height: hInteger
	"A new designated constructor that calls our designated
	initializer"
	^ self basicNew
		initializeWithWidth: wInteger height: hInteger;
		yourself

WARectangle class>>new
	"We need to override the designated constructor of our superclass
	because it doesn't result in our designated initializer being called."
	^ self width: 1 height: 1

WARectangle subclass: #WABox
	instanceVariableNames: 'depth'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Example'

WABox>>initializeWithWidth: wInteger height: hInteger depth: dInteger
	depth := dInteger
	"Again, we need to make sure to call our superclass' designated
	initializer"
	self initializeWithWidth: wInteger height: hInteger.

WABox class>>width: wInteger height: hInteger depth: dInteger
	"Our new designated constructor"
	^ self basicNew
		initializeWithWidth: wInteger height: hInteger depth: dInteger;
		yourself

WABox class>>width: wInteger height: hInteger
	"We override our superclass' designated constructor and call
	our own with a default for depth."
	^ self width: wInteger height: hInteger depth: 1
```

Note that we do not need to provide an implementation of `#new` but calling any of `#new`, `#width:height:`, or `#width:height:depth:` on `WABox` will result in the designated initializers of all three classes being called.

```
WABox subclass: #WAColoredBox
	instanceVariableNames: 'color'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Example'

WAColoredBox>>initializeWithWidth: wInteger height: hInteger depth: dInteger
	"color is not a required parameter so we don't need to change the
	designated initializer."
	color := nil.
	"But we still need to call super."
	super initializeWithWidth: wInteger height: hInteger depth: dInteger

WAColoredBox>>setColor: aColor
	"By not providing #color:, we indicate that this instance variable
	should not normally be modified externally once the object is created."
	color := aColor

WAColoredBox class>>cubeOfLength: anInteger color: aColor
	"An example of an instance creation method that calls the designated
	constructor and a setter method to initialize a non-required parameter."
	^ (self width: anInteger height: anInteger depth: anInteger)
		setColor: aColor;
		yourself
```

# Requirements #

Reverse-engineered after the fact, here are (roughly) what I think the requirements were that generated this set of conventions. We'll add to these as people point out alternative conventions and we remember why they didn't work.

  1. Each object must be initialized once and only once.
  1. During initialization, all initialization methods must be called in a predictable order. If my subclass has already overridden my superclass' initialization method, it should still be called. This means a method should never call super with a selector other than its own.
  1. All inherited instance creation methods must result in a completely initialized object.
  1. The conventions must be consistently applicable in all cases.
  1. It should be very clear to users of the class what parameters are required for initialization.
  1. It is more important to minimize the complexity and effort for users of the framework than for developers of the framework.
  1. Without sacrificing the above points, we should not have to write or override more code than necessary (we don't want to have to override every instance creation method each time we subclass, for example).

# Notes #
The conventions presented above are subtly different to those used by [Apple in Objective-C](http://developer.apple.com/library/ios/#documentation/general/conceptual/CocoaEncyclopedia/Initialization/Initialization.html). In Objective-C an initializer method can call super with a selector other than it's own, when it is redefining the designated initializer in a sub-class.