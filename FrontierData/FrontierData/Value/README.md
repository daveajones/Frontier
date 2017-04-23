# Value Protocol

Frontier values all conform to the `Value` protocol. Every value has a `valueType` and a bunch of read-only properties for coercions: `asBool`, `asInt`, and so on.

(I would have preferred `boolValue` and similar, but there’s possibility of conflict with existing methods)

Not every coercion will succeed, and so they return optional values.

## How this is different from original Frontier

Values were boxed in a `tyvaluerecord` struct (a union), and there were methods such as `coercetoint` which used a big switch statement to coerce values.

This was a perfectly reasonably approach in C. But, while it was nice that you could always pass around a pointer (or Handle) to a `tyvaluerecord`, you still had to take care to unbox it to get the actual value.

In this new Swift version there is no boxing. A `bool` is a `bool` — but, since it’s been extended to conform to the `Value` protocol, you can get its `valueType` and you can easily coerce it to another value.

This gives us the best of all worlds: you can pass around `Value` types, but they’re not boxed, and you can easily do coercions.

## Rules for coercions

Some of the rules were figured out by reading the original code, and some were figured out by just testing original Frontier running on 10.6.8. See the unit tests.
