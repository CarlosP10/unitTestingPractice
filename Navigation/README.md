# Navigation

### Errors

*In addition to the good answers above to set the navigation view controller on top of your screen on your app, you can add it to your AppDelegate.swift file inside the block as follows*

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

    window = UIWindow()
    window?.makeKeyAndVisible()
    window?.rootViewController = UINavigationController(rootViewController: LoginViewController())
    return true
    
}
```

### Key Takeaways
Sometimes tests need to downcast an object to a more specific type so it can query its properties. A force-cast as! is simple but will crash the test run if the type is wrong. Use the softer conditional cast as? with a guard let. If the guard fails, use an XCTFail() to report the desired type and the actual object.
“Execute the run loop” is a good trick to keep in your pocket. When things work in manual testing but not in unit testing, see if the trick works. Some- times it gives UIKit that extra kick it needs.
To test code-based push navigation, follow these steps:
- Put the view controller inside a UINavigationController.
- Execute the run loop before any assertions. Then query the navigation controller.
To test code-based modal navigation, follow these steps:
- Add the ViewControllerPresentationSpy framework to your test target.
Instantiate a PresentationVerifier.
- Call the PresentationVerifier’s verify() method.
To test segue-based push navigation, follow these steps:
- Add the ViewControllerPresentationSpy framework to your test target.
Instantiate a PresentationVerifier.
- Load the view controller into a visible UIWindow. You may wish to use
putInWindow(_) for this.
- Call the PresentationVerifier’s verify() method.
- Execute the run loop one more time at the end of tearDown() to clean everything up.
To test segue-based modal navigation, follow these steps:
- Add the ViewControllerPresentationSpy framework to your test target.
Instantiate a PresentationVerifier.
- Call the PresentationVerifier’s verify() method.
- Recognize that both the presenting view controller and the presented view controller will live on. Check both to see if this will leave any side effects, such as observing notifications or running a timer. If so, provide a back- door cleanup method and call it from the test code.