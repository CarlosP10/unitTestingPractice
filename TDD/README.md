# TDD

### Key Takeaways

Test-driven development combines unit testing and refactoring into a discipline for creating new functionality:
- TDD emphasizes moving in small steps.
- The main steps are red, green, refactor: Create a single failing test. Get it to pass. Clean up code.
- Creating a failing test includes creating bare-bones production code that does nothing useful.
- Try to move from red to green quickly. The code can be ugly, because you’ll clean it up in the refactor step.
- Refactoring includes cleaning up test code as well as production code. Try to change one or the other. Keep the tests passing while refactoring. Keep cleaning until you’re satisfied.
- Create test helpers so your tests express what is important while hiding what is unimportant.
- It’s okay for the production code to use hard-coded values. Such code isn’t wrong; it’s just incomplete. The feeling that it’s wrong is telling you to write more tests.
- It’s okay to add non-TDD-passing tests if they help demonstrate require- ments. There’s nothing wrong with extra reassurance that you didn’t miss a particular edge case. (But remember to force an unwanted change in production code to make sure the test fails as desired.)
- After you’ve fleshed out a piece of functionality, take a step back. Expand your focus to look at the whole method or the whole type. Ask yourself how easy it will be to maintain when changes are requested. Refactor to make it easier to change.
- Making code more similar reveals further opportunities for refactoring.

This particular example demonstrates one more thing about TDD. The test input supplies both hour and minute to create instances of Date, so that we can see how the tests map to the requirements. But curiously, the production code only needs to pay attention to the hour. We didn’t need to examine the minutes at all. This is an example of how code written with TDD can be simpler than code written without it.