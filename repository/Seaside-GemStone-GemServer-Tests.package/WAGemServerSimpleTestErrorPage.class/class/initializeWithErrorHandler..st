initialization
initializeWithErrorHandler: exceptionHandlerClass
  "self initialize"

  | application filter attribute |
  (application := WAAdmin register: self asApplicationAt: 'tests/gemServerError')
    preferenceAt: #'sessionClass'
    put: WASession.
  filter := WAExceptionFilter new.
  attribute := filter configuration attributeAt: #'exceptionHandler'.
  filter configuration takeValue: exceptionHandlerClass forAttribute: attribute.
  application addFilter: filter