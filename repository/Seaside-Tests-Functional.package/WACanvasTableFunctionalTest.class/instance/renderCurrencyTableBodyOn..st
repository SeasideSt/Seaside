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
                  html tableHeading: each first.	"https://bugzilla.mozilla.org/show_bug.cgi?id=2212
					https://bugzilla.mozilla.org/show_bug.cgi?id=915"
                  html tableData
                    align: 'char';
                    character: $.;
                    with: (numberPrinter print: each second) ] ] ]