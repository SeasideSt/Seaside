This element allows the use to select one (in single selection mode) or multiple (in single selection mode) elements. Default is single selection. Multiple selection can be triggered with #beMultiple.

Single selection is in general a drop-down list, so make sure the list of options is not too big.
Multiple selection has in general crappy browser support and a list of checkboxes is in general the better option.

If in single selection mode and you want enable "no selection" see #beOptional.

If you absolutely need to you can render the options yourself with 'html option' inside #with:

Make sure to check the superclass for more methods.

See WAInputTest >> #renderSingleSelectionOn: and WAInputTest >> #renderMultiSelectionOn: for examples.