# TextField

## Notes
> Be careful when using XCTAssertEqual with types declared in Objec- tive-C. Introduce
> an error to check the failure message. Where needed, add an extension to make the
> type conform to the Custom- StringConvertible protocol.

### Key Takeaways

- To test delegate methods, don’t directly call the object that implements it. That would lock down that particular class as the delegate. Instead, request the delegate (whatever it is) and call through it. This allows the delegate to move in future refactoring without breaking tests.
- Getting an object’s delegate and passing that same object as an argument makes for clumsy test code. You’ve seen how extracting helper functions (sometimes with default arguments) can go a long way to making test code easy to write and easy to read.
- Some types written in Objective-C need help describing themselves, especially enumerations. Add extensions so these types conform to the CustomStringConvertible protocol. And you’ve learned that to assert against a Bool? value, you can use XCTAssertEqual(_:_:).
- To test the first responder, the view needs to be in a view hierarchy for input focus to take effect.
- If you add anything to a temporary UIWindow, execute the run loop in tearDown() so that UIKit releases the window. This avoids memory leaks.