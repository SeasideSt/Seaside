testing
testCanvasTableFunctionalTest
  | entities entitiesTable rows currencyTable headers entityHeaders exchangeRates |
  self selectTest: 'WACanvasTableFunctionalTest'.
  entityHeaders := #(#('Character' 'Entity' 'Decimal' 'Hex' 'Rendering in Your Browser') #('Entity' 'Decimal' 'Hex')).
  entities := {#('non-breaking space' '&nbsp;' '&#160;' '&#xA0;' ' ' ' ' ' ').
  #('ampersand' '&amp;' '&#38;' '&#x26;' '&' '&' '&').
  #('less than sign' '&lt;' '&#60;' '&#x3C;' '<' '<' '<').
  #('greater than sign' '&gt;' '&#62;' '&#x3E;' '>' '>' '>').
  {'euro sign'.
  '&euro;'.
  '&#8364;'.
  '&#x20AC;'.
  (String with: (Character codePoint: 8364)).
  (String with: (Character codePoint: 8364)).
  (String with: (Character codePoint: 8364))}}.
  entitiesTable := (driver findElementsByTagName: 'table')
    detect: [ :table | (table findElementByTagName: 'caption') getText = 'HTML 4.0 entities' ].
  headers := entitiesTable findElementsByCSSSelector: 'thead tr'.
  headers
    with: entityHeaders
    do: [ :header :headerDef | 
      self
        assert: ((header findElementsByTagName: 'th') collect: #'getText')
        equals: headerDef ].
  rows := entitiesTable findElementsByCSSSelector: 'tbody tr'.
  rows
    with: entities
    do: [ :row :entityDef | 
      self
        assert: ((row findElementsByCSSSelector: 'th,td') collect: #'getText')
        equals: entityDef ].
  exchangeRates := #(#('EUR' '1.70') #('USD' '1.30') #('DKK' '23.36') #('SEK' '19.32')).
  currencyTable := (driver findElementsByTagName: 'table')
    detect: [ :table | 
      (table findElementByTagName: 'caption') getText
        = 'Currencies against Swiss Franc (CHF)' ].
  rows := currencyTable findElementsByCSSSelector: 'tbody tr'.
  rows
    with: exchangeRates
    do: [ :row :entityDef | 
      self assert: (row findElementByTagName: 'th') getText equals: entityDef first.
      self
        assert: (row findElementByTagName: 'td') getText
        equals: entityDef second ]