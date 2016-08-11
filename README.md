# hledger-flags

> Parses hledger flags

```js
> parse('-f ledger.journal bal -M')
{
  command: 'balance',
  file: 'ledger.journal',
  query: [],
  monthly: true
}
```

Parses flags for [hledger][]. Knows most of hledger's flag aliases and other quirks.

[![Status](https://travis-ci.org/rstacruz/hledger-flags.svg?branch=master)](https://travis-ci.org/rstacruz/hledger-flags "See test builds")

[hledger]: http://hledger.org/

## API

<!--api-->

### OPTIONS

Options for `rminimist`.

```js
> OPTIONS.boolean
[ 'ignore-assertions', 'cleared', 'pending', ... ]

> OPTIONS.string
[ 'file', 'begin', 'end', ... ]

> OPTIONS.alias
{ f: 'file', b: 'begin', e: 'end', ... }
```

### parse

> `parse(string)`

Parses a string into a Ledger Flags object.

```js
> parse('-f ledger.journal bal -M')
{
  command: 'balance',
  file: 'ledger.journal',
  query: [],
  monthly: true
}
```

The return value is an object that always has the following fields:

- `command` (String) - the command to be executed
- `query` (Array) - query to run

All other attributes are derived from the flags.

### normalizeCommand

> `normalizeCommand(cmd)`

Normalizes a command based on aliases.

```js
> normalizeCommand('reg')
'register'

> normalizeCommand('bal')
'balance'
```

### toString

> `toString(flags)`

Converts Ledger Flags back into string.

```js
> args = parse('bal -f ledger.journal -M');
> toString(args)
'balance --file ledger.journal --monthly'
```

### parseMany

> `parseMany(strings...)`

Parses many arguments.

```js
> args = parseMany('-f ledger.journal', 'bal -M');
> toString(args)
'balance --file ledger.journal --monthly'
```
<!--api:end-->

## See also

- [hledger.js](https://www.npmjs.com/package/hledger) - Node.js API for hledger.
- [hledger-vis](https://github.com/rstacruz/hledger-vis) - hledger web UI built in Node.js.

## Thanks

**hledger-flags** © 2016+, Rico Sta. Cruz. Released under the [MIT] License.<br>
Authored and maintained by Rico Sta. Cruz with help from contributors ([list][contributors]).

> [ricostacruz.com](http://ricostacruz.com) &nbsp;&middot;&nbsp;
> GitHub [@rstacruz](https://github.com/rstacruz) &nbsp;&middot;&nbsp;
> Twitter [@rstacruz](https://twitter.com/rstacruz)

[MIT]: http://mit-license.org/
[contributors]: http://github.com/rstacruz/hledger-flags/contributors
