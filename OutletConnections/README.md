# OutletConnections

### Key Takeaways

There are several things you should take away from this chapter:
- Add tests to confirm outlet connections. Why bother if many things will fail without those outlets? Because the failures will be widespread and hard to diagnose. Writing outlet tests is quick, so they provide an early warning system for little cost. You’ll still have a bunch of test failures, but the list of failure cases will include test_outlets_shouldBeConnected(), which will tell you the root cause.

- When a test case has more than one assertion, add short, descriptive messages to the assertions. The messages will help you identify the problem, even without clicking through to see the test code.

- You may need to relax access control so the test code can see a type’s properties. For var properties, change them to private(set) so the getter is available, but the setter is still private. For let properties, just remove the private modifier.

- Always see a test case fail, even if you’re adding tests to cover existing code. It helps you design the failure to be easy to understand.

- You can test your tests by deliberately breaking the production code.