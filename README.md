# Balatro Item Dumper

A utility to dump all modded additions to Balatro. Automatically dumps Jokers, Vouchers, Decks, Planets, Spectrals, Enhancements, Seals, Boosters, Tags, Blinds, and Stakes. Additionally, defines `dump_objects_to_file(set, extra, extra_header, no_cost, no_desc, obj, key_flag, f_name, f_desc)` which can dump other objects.

## dump_objects_to_file

This function can be run with e.g. DebugPlus.

- `set` (required): The set in `G.P_CENTER_POOLS` to check, and also the name of the output file.
- `extra` (default: `nil`): A function to generate extra columns from an object.
- `extra_header` (default: `nil`): A header to use if `extra` is defined.
- `no_cost` (default: `false`): Don't include a column for cost.
- `no_desc` (default: `false`): Don't include a column for the description.
- `obj` (default: none): An object to search instead of `G.P_CENTER_POOLS[set]`.
- `key_flag` (default: `false`): Search the object using `pairs` instead of `ipairs`.
- `f_name` (default: normal): A function to get the object's name.
- `f_desc` (default: normal): A function to get the object's description.
