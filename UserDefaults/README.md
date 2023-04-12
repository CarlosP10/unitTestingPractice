# UserDefaults

## Notes

> Recall from Identify Difficult Dependencies, on page 75 that UserDefaults is a
> difficult dependency because it uses persistent storage. We want to isolate it
> so we can replace it. 

>What’s a test double? It’s like a stunt double in filmmaking. We temporarily replace
>the real actor with someone that looks like that actor. Or in our case, something
>that looks like the original type as far as the calling code is concerned.

### Key Takeaways
Let’s review the main things from this chapter that you should carry with you:
- Centralize direct references to a difficult dependency by putting that dependency into a property.
- You can replace a concrete type with a protocol because Swift lets us attach protocols to existing types. The protocol should have only the parts of the type’s interface that you need.
- Once you express a dependency as a protocol, you can inject anything that conforms to that protocol. This brings extra flexibility while still preserving type safety. Tests can provide test doubles in place of the real types.
- A fake object is a test double with a lighter-weight implementation. The fake object avoids the complications that make the real thing a difficult dependency. Besides FakeUserDefaults, examples include fake databases and fake web services.
- Avoid reusing the same input values across tests. Vary the input. This reduces the chances that the production code “happens to work” for some inputs but not others.