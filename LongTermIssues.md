# Long Term Issues #

The following are some long term issues that we may want to fix at some point.

## Redo Session Cache ##
  * O(1)
  * support a relative and absolute session timeouts

## Rework Configuration ##

Make the configuration framework easier to understand. See [Configurations, again…](http://lists.squeakfoundation.org/pipermail/seaside-dev/2011-July/004853.html)


## Reduce Young Space Allocation ##
Reduce young apace allocation through better buffer use.
Will probably require `#greaseStringOn:`