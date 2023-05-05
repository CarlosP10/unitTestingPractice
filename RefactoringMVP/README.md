# Refactoring MVP

### Key Takeaways

Starting with a well-tested view controller, we were able to change it to the MVP pattern. First, we set up the relationships:
- Create an initially empty protocol to house the View Commands.
- Conform the view controller to the protocol.
- Create a presenter with an unowned reference to the protocol.
- Create a lazy view controller property to the presenter, passing itself as
the implementor of the protocol. Then we followed this approach:
- Extract functions to manipulate the views. Make these functions available through the View Commands protocol. These commands call the views but should avoid using UIKit types in their function signatures.
- Move functions that call View Commands into the presenter. Pass anything else these functions need to the presenter but nothing that uses UIKit.
- View controller actions should extract information from inputs, then call a presenter method, nothing more.
We did all this with disciplined refactoring, relying on a thorough set of unit tests. The tests check the end result we want, but are ignorant of the UI pat- tern we use. This allowed us to change from MVC to MVVM to MVP, with only minor changes in test code. In other words, the tests check the behavior, not the implementation.
Here are the manual refactoring moves we discussed in this chapter:
- *Change Function Declaration*
- *Extract Class*
- *Inline Function*
- *Move Field*
- *Move Function*