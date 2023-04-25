# TableView

### Key Takeaways
Testing table views is a continuation of testing delegate methods. So the same techniques from ==*Chapter 14, Testing Text Fields (and Delegate Methods), on page 169*== apply, except that table views have two delegates instead of one.

- Write a test to confirm that the table view’s dataSource and delegate aren’t nil. Remember to call methods through the appropriate delegate.
- There’s a lot of opportunity to extract test helpers for table view delegate methods. Doing so will lead to simpler test code, especially if you give the section number a default value of 0.