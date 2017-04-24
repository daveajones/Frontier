# Frontier Verbs

This framework implements Frontier’s standard verbs, such as clock.now and file.open, which live in system.verbs.builtins.

## How to add a new verb table

Create a new AnyNameVerbs struct in the Verb Tables folder.

The “AnyName” part should match the name of the corresponding table in Frontier. (With one difference: the first letter must be capitalized, since object names are capitalized in Cocoa.)

The class must conform to the `VerbTable` protocol. The easy way to get started: copy from an existing verb table.

Last thing: add to `VerbRunner.VerbImplementors` and add a case to the switch statement in the `run` function.

You’ll also have to add a corresponding table to the database, but that’s a whole separate thing.

## How to add a new verb

We’ll use FileVerbs as an example, but the process is the same for all of the verb tables.

1. Add the verb to `FileVerbs.Verbs` enum. Its value must be all lowercase.

2. Add to the switch statement in the `evaluate` function.

3. Add the actual implementation as a function in `private extension FileVerbs`.

You also have to add a corresponding object to the database. But you’ve done the kernel housekeeping bits.

## Not-Implemented and No-Longer-Implemented

Any verb not *yet* implemented, but that will be, should throw `LangError.unimplementedVerb`.

Any verb that was implemented in a previous version of Frontier, but is no longer implemented, should probably return something that doesn’t break existing scripts — such as true or false. However, for cases where an error is truly needed, use `LangError.noLongerImplemented`.
