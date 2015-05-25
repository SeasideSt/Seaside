attributes
rules: aString
	"rules = none|groups|rows|cols|all [CI]
    This attribute specifies which rules will appear between cells within a table. The rendering of rules is user agent dependent. Possible values:

        * none: No rules. This is the default value.
        * groups: Rules will appear between row groups (see THEAD, TFOOT, and TBODY) and column groups (see COLGROUP and COL) only.
        * rows: Rules will appear between rows only.
        * cols: Rules will appear between columns only.
        * all: Rules will appear between all rows and columns."
	self attributes at: 'rules' put: aString