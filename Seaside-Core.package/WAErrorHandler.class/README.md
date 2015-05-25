WAErrorHandler catches Errors and Warnings and provides two methods for handling each type of exception:

handleError:
handleWarning:

If either method is not implemented, the default implementation will call #handleDefault:, which can be used to provide common behaviour for both exception types.