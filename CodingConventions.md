Most of our coding conventions are automatically detected by [Code Critics](http://st-www.cs.uiuc.edu/users/brant/Refactory/Lint.html) and [Slime](http://www.lukas-renggli.ch/blog/slime), a Seaside specific extension to Code Critics. We recommend that you follow [Smalltalk Best Practice Pattern](http://www.amazon.com/Smalltalk-Best-Practice-Patterns-Kent/dp/013476904X) by Kent Beck.

# Portability #

Seaside code has to work on many platforms. At the end of the day the porters will make sure the code is portable, just keep this in mind and don't make their life unnecessary hard. The following list shall serve as a guideline. When in doubt ask on the mailing-list. Tests certainly help to document your assumptions about a platform.

  * Use `#greaseString` for String conversion.
  * Do not use any of these methods, they are missing, broken or have different semantics on some platforms:
    * Object: `#ifNotNil:`, `#ifNotNilDo:`, `#in:`, ...
    * Boolean: `#and:and:and:`, `#or:or:or:`, ...
    * Collection: `#=`, `#pairsDo:`, `#with:collect:`
    * String: `#match:`
    * Stream: `#position`, `#position:`, `#isEmpty`
  * Don't assume `Symbol` to be a subtype of `String`.
  * Use `GRPlatform` sparingly and only if there is absolutely no other way.
  * Non-ASCII Strings and Characters are inherently unportable. Same goes for class look-up, compilation and IO. `Character cr` and `Character lf` are not the same on all platforms.
  * Don't use any dialect specific syntax, like byte array literals `#[ ]`, curly braces `{ }`, or pragmas `<pragma>`.
  * For portable code subclass `GRObject`. This makes sure your objects will receive an `#initialize` message upon creation, see [ObjectInitialization](ObjectInitialization.md) for details.
  * Instead of `Random` and `Semaphore` use `GRPlatform current newRandom` and `GRPlatform current semaphoreClass`.
  * Instead of `TimeStamp` use `DateAndTime`
  * Do not do non-local returns in error handler block.
  * The receiving block of #on:do: after processing the exception handler of a notification may resume the execution.
  * Do not touch the code of `WAProcessMonitor`, here be dragons.
  * Do not use the return value of `Array` `#sort` or `#sort:`.
  * Do not use string literals with NULL characters.
  * Do not assume `#value` is part of the `Object` protocol
  * Send `#daysInMonthNumber:forYear:` to `Date`. Not `#daysInMonth:forYear:` to `Month` or `Date`.
  * Use `#keysAndValuesDo:` instead of `#withIndexDo:`.
  * In Seaside 2.8 and earlier use the class side `#raiseSignal` or `#raiseSignal:` to throw exceptions.
  * In Seaside 3.0 and later use ANSI exceptions, that means instance or class side `#signal` or `#signal:` on `GRError` and `GRNotification` or subclasses. Do not use any other exception classes.
  * Do not send `#fork` to a block if you want to get a reference to the created process. Use a combination of `#newProcess` and `#resume`.
  * The second argument passed to `#on:do:` must be a one argument block.
  * Starting with Seaside 3.0 conform with the [ValuableProtocol](ValuableProtocol.md).
  * Don't send #next to a `ReadStream` that is at end. Instead send #atEnd to check if the stream is at the end.
  * starting with Seaside 3.0 use #greaseInteger to
    * convert `Number`s to `Integer`s (ANSI behavior)
    * convert `String`s to `Integer`s
    * get the code point of a `Character`
  * Use `WriteStream on: String new` instead of `String new writeStream`
  * Do not send #hash to a class (GemStone)
  * convert class names to strings using `#greaseString`
  * use `SequenceableCollection >> #beginsWithSubCollection:` instead of `SequenceableCollection >> #beginsWith:`
  * use `SequenceableCollection >> #endsWithSubCollection:` instead of `SequenceableCollection >> #endsWith:`
  * use `(String with: Character cr with: Character lf)` instead of `String crlf`
  * don't use any of those on a `Collection`
    * `#count:`
    * `#withIndexCollect:`
    * `#anyOne`
  * don't use `OrderedCollection >> #at:ifAbsentPut:`
  * don't use `1 / 0`, Smalltak/X has constant folding (evaluates this at compile time) which will raise an error during code loading
  * don't use `#canPerform:` it's not portable use `#respondsTo:`
  * use `#indexOfSubCollection:startingAt:` (ANSI) instead of `#includesSubString:`
  * use `TestCase >> #assert: false` instead of `TestCase >> #fail`
  * don't send `first` to an empty collection since the behavior is not portable (ANSI: Answer the element at index 1 in the receiver. The result is undefined if the receiver is empty.)

# Initialization and Instance Creation #

Making sure all objects are properly initialized can be complex, particularly when dealing with multiple platforms. We have adopted [ObjectInitialization](ObjectInitialization.md) in Seaside to make sure behaviour is consistent.

# Formatting #

We are picky about formatting so this gets its own section.

  * Have a look at existing code to get a feel.
  * Always use `:=` for assignments, never the non-portable `_`.
  * Always put a space before and after a binary selector.
  * Properly indent your code using tabs, not spaces.
  * No unnecessary brackets, don't bracket the receiver of a cascade if not necessary.
  * No unnecessary blank lines, expect after the method comment.
  * Do not send yourself, if you don't use the result.
  * Use `each` as an argument name of iteration blocks.
  * Add a space at the beginning and end of a temporary variable declarations and blocks.
  * Avoid unnecessary statement separators.
  * Close multiple blocks on one line.
  * The first comment of a method should state the use and the expected arguments of public methods. Keep it short, but ensure that these are valid sentences starting with an uppercase letter and end with a full stop.
  * Avoid comments within the method body.
  * Avoid using a pretty printer.

# Presentation #
  * The complete ancestry must be in the Monticello repository.
  * Commit small changes (a single method is fine), big changes make merging hard.
  * Avoid the use of `#style` and `#script` if possible.
  * Refrain from using IDs and use CSS classes instead.
  * Use your author initials as author initials, not your name.
  * Follow the [PackageNaming](PackageNaming.md).
  * If you change the package structure also update the scripts that generate the dependency graphs and Universe.