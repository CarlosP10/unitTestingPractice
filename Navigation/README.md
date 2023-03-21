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
