# Refactoring MVVM

### Key Takeaways

Starting with a well-tested view controller in MVC, we were able to evolve it toward MVVM using refactoring. The following was our overall refactoring strategy:
- Set up infrastructure for the new thing.
- Lay down the new code without changing the old code. 
- Change the old code so it uses the new code.
This was a smooth process most of the way. But sometimes a refactoring doesn’t work out and you end up with failing tests. Rather than “fixing for- ward,” a pure refactoring approach sticks to the safety of keeping tests passing:
- Try a change that causes tests to fail.
- Revert the code back to where tests were passing.

- Refactor the thing that caused the test failures. (In our case, we needed to refactor the test code.)
- Try again with the original change you wanted.
We were able to gradually shift to MVVM with these steps:
- Move string literals into the view model.
- Choose a way to do data binding from the view model to the views. In our
example, we did this using Swift’s ability to define didSet observers.
- If your view controller loads IBOutlets from a storyboard or XIB, start the
observer with a check that short-circuits if the outlets aren’t ready:
```swift
    guard isViewLoaded else { return }
```
- Find ways to model the user interface ideas separate from UIKit.
- Move view state changes into the didSet observer. Replace occurrences of the code with changes to the view model.
- Move conditionals that use view state into the view model. You’ll need to choose a way to do data binding from the views back to the view model. Replace the original code with queries to the view model.