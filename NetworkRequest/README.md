# NetworkRequest

## Notes
> Isolated unit tests aren’t the only automated testing game in town, though. Another
> way to handle network calls is to fake the entire networking layer. 
> *[OHHTTPStubs2](https://github.com/AliSoftware/OHHTTPStubs)* is an example of a
>library that does this, letting you provide fake network data. This is quite useful
>when doing automated UI testing. A fake network makes UI tests faster and more
>reliable.

> Any time you call an XCTest assertion from a helper function, get the file name and
> line number in arguments. Pass them on to any assertions. This way, test failures
> will report the calling line in the test, not the helper.

### Key Takeaways
As we finish this chapter, here are the main things you should hold on to:
- A test spy records the method calls it receives. This lets us test that the system under test called it as expected. It lets us verify the communication between components.
- Don’t use a Boolean flag to record when the test spy receives a call. That’s throwing away information about the communication. Instead, increment a call count so you can tell how many times a method was called.
- A mock object is a test spy that does its own assertions. This simplifies test code. It also gives us opportunities to improve failure reporting.
- Helper methods can call the XCTest assertions. Get the file name and line number of the call site as function arguments. Pass them along to the assertions.
- Tests should be sensitive to things that matter and insensitive to things that don’t. For data where the order doesn’t matter, avoid using equality assertions. Otherwise tests can reject valid results, giving you false negatives.