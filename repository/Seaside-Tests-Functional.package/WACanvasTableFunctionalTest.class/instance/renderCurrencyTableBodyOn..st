rendering
renderCurrencyTableBodyOn: html
  html tableBody
    title: 'Table body';
    with: [ 
			| numberPrinter |
			numberPrinter := GRNumberPrinter new precision: 2.
          self exchangeRates
            do: [ :each | 
              html
                tableRow: [ 
                  html tableHeading: each first.
                  html tableData: (numberPrinter print: each second) ] ] ]