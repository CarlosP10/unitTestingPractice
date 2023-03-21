# ButtonTap

### Key Takeaways

The point of this chapter’s exercise was to show you the following:

- That unit tests can send actions to controls.

- That doing so is simple. You just have to make controls non-private so tests can talk to them.

- That test helpers can make tests more readable.
But you may be wondering why I recommend writing unit tests to verify UI behavior such as button taps. Shouldn’t we use Apple’s UI testing to test UI?

It’s helpful to know how the two testing paradigms differ. In UI testing, the tests run in a separate test runner app, sending UI events to the app under test. The app under test is a black box, revealing only the UI elements on the screen.
But in the unit testing paradigm, the tests can have full access to all code that isn’t declared private. This brings many advantages:

- Unit tests don’t have to start from your app’s initial screen and navigate to specific screens. Instead, they create whatever view controllers they want.

- Unit tests can inject different dependencies to the system under test. These dependencies can provide canned inputs, or they can record out- puts. For example, they can intercept network calls.

- Unit tests are orders of magnitude faster than UI tests.
So test behaviors (and even appearance) using unit tests as much as you can. They’ll give you fast feedback you can incorporate into your coding workflow. Reserve UI testing for anything the unit tests don’t already verify, especially end-to-end testing.