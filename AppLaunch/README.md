# AppLaunch

### Key Takeaways

The main thing to take away from this chapter is that due to app launch, running tests will execute other code. If left unchecked, we could have objects doing work outside the context of test execution. For unit tests, the tests need to be in full control of their environment. To give tests full control, use a separate app delegate during test runs.
This doesn’t mean the regular app delegate is off-limits during testing. It means that if we call anything in the regular app delegate, it will be because we wrote a test to call it.