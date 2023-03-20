# AppLaunch

### Key Takeaways

With experience, you’ll begin distinguishing between problem-free dependen- cies and difficult dependencies. Use the FIRE rules to ask whether a depen- dency is fast, isolated, repeatable, and easy to test.
We discussed the following techniques for isolating difficult dependencies:
- Putting a singleton backdoor on a singleton you own. Use only for legacy code, not for new designs.
- Subclass and Override Method, using a test-specific subclass. Try to limit this to legacy code.
- Injecting dependencies through initializers—constructor injection
- Injecting dependencies through properties—property injection

The first two techniques are helpful for legacy code because they minimize changes to production code. But they minimize things that we ought to change. Sometimes I use Subclass and Override Method on new code when I haven’t yet figured out how to design a replaceable dependency. But that’s a temporary step. Once I know how to represent the dependency, I switch to a better technique.
Another form of Dependency Injection described in *[Dependency Injection Principles, Practices, and Patterns [vS19]](https://awesomeopensource.com/project/elangosundar/awesome-README-templates)* is called method injection. This is where you add a new parameter to a function. It’s useful for injecting values that change with each call. For example, instead of a function that directly retrieves the current time, we can sometimes pass the current time as an additional argument to that method.
Injecting closures gives us a way to extract creation of new instances. But injecting closures may show that there is a new type trying to break free. See if you can move the closures into a new type, changing them to methods.