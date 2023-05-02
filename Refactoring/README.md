# Refactoring

### Key Takeaways

Stepping back from the exercise, here are the larger points you should remember:
- Refactoring means changing code in very small steps, with each step verified by tests.
- Quick feedback from automated tests makes this kind of refactoring possible.
- Use automated refactoring when possible. (AppCode makes this easier.)
- To perform manual refactoring, see ***Refactoring: Improving the Design of Existing Code, 2nd Edition [Fow18]*** for a catalog of refactorings. Follow the steps listed in the Mechanics sections.
- Whether the refactoring was automatic or manual, run the tests afterward.
- When moving code manually, don’t perform the move in a single step. Put the new code in place and verify. Then remove the old code and verify.
- With each step verified by tests, if you get a failure, it happened because of something in the last change. Try to “fix it forward” once. If that doesn’t work, go back to when the tests were passing and start over.
Here are the manual refactoring moves we introduced in this chapter:
- Extract Function
- Extract Variable
- Inline Variable
- Replace Inline Code with Function Call 
- Slide Statements