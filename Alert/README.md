# Alert

### Key Takeaways

To download *ViewControllerPresentationSpy* press [here](https://github.com/jonreid/ViewControllerPresentationSpy)


This particular framework will help you test alerts and is good to know about. Besides that, though, there’s a larger idea to take away from this chapter: there’s usually a way to crack open things that look “untestable.”

Parts of Apple’s frameworks are black holes: we can pass data in, but tests can’t access it to verify what we passed in. Alerts are one example of this. 
Moreover, alerts can interfere with UI testing.

Though we’re coding in Swift these days, we depend on UIKit, which is written in Objective-C. One thing calls another in Objective-C by dynamic message passing. This gives us a way to intercept messages. ViewControllerPresenta- tionSpy does this using method swizzling.

If you find a black hole that receives data with no way of getting it back out, search for helper libraries that intercept the data. For alerts, ViewController- PresentationSpy is one such solution.