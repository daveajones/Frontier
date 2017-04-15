# Frontier Verbs

This framework implements Frontier’s standard verbs, such as clock.now and file.open, which live in system.verbs.builtins.

Adding verb tables and verbs is designed to be easy. (It was kind of a pain in Old Frontier.)

## How to add a new verb table

Create a new AnyNameVerbs class in the Builtins folder.

The “AnyName” part should match the name of the corresponding table in Frontier. (With one difference: the first letter must be capitalized, since object names are capitalized in Cocoa.)

The class must conform to the VerbTable protocol: it should return 1) its table name (should be lowercase) and 2) an array of supported verbs.

Last thing: add the table to VerbRunner.verbTables. (This way VerbRunner can see your table.)

## How to add a new verb

We’ll use FileVerbs as an example, but the process is the same for all of the verb tables.

1. Add the canonical name of the verb to FileVerbs.supportedVerbs. (At the end is fine: order doesn’t matter.)

2. Add a dynamic function that has the name of the verb as it appears in FileVerbs.supportedVerbs. It must have the exact same capitalization. (Even though capitalization doesn’t matter in Frontier scripts, it matters here.) That function takes VerbParameters and returns a VerbResult.

That’s it. Well, you have to actually implement the function. And add a corresponding object to the database. But you’ve done the kernel housekeeping bits.

## Stubs

At this writing, VerbParameters, Parameter, and VerbResult are all just temporary. Once UserTalk.framework is filled, we’ll switch to using types defined in the language.
