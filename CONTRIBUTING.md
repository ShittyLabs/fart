# Getting Started

You can follow the official dart getting started guide [here](https://dart.dev/tutorials/server/get-started).

Here are some of the ways you can contribute to `fart`.


## Implementing an extension method

- You'll need to know how [extension methods](https://dart.dev/guides/language/extension-methods) and [generics](https://www.tutorialspoint.com/dart_programming/dart_programming_generics.htm) work in dart. Don't worry, it's pretty much like C#.

- It's not necessary that the functions chain into a final lazily-evaluated iterator.

- It's not necessary that the functions are performant. Although, bonus points if you manage that, I guess?

- If a method already exists in the standard dart library for doing something `LINQ`-y, you're not allowed to use it in your implementation.

## Writing tests for an extension method

- One assertion allowed per unit test.

- You can try to use the [Arrange/Act/Assert](http://wiki.c2.com/?ArrangeActAssert) paradigm for your unit tests (this is not a rule but it will make me happy).

### PR Rules

- No more than one implementation per PR
- No more than one unit test per PR
- An implementation and a unit test can be in the same PR
- Multiple PRs for the same method are welcome, as long as the implementation is different.

