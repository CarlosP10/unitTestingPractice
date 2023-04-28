//
//  TestHelpers.swift
//  RefactoringTests
//
//  Created by Carlos Paredes on 27/4/23.
//

import XCTest

///The first helper returns a Bool because we’ll use it to decide whether to make more assertions.
func verifyMethodCalledOnce(
    methodName: String,
    callCount: Int,
    describeArguments: @autoclosure () -> String,
    file: StaticString = #file,
    line: UInt = #line) -> Bool {
        if callCount == 0 {
            XCTFail("Wanted but not invoked: \(methodName)",
                    file: file, line: line)
            return false
        }
        
        if callCount > 1 {
            XCTFail("Wanted 1 time but was called \(callCount) times. " + "\(methodName) with \(describeArguments())",
                    file: file,
                    line: line)
            return false
        }
        return true
    }

///The second helper has no return type because we won’t do any more checks
func verifyMethodNeverCalled(
    methodName: String,
    callCount: Int,
    describeArguments: @autoclosure () -> String,
    file: StaticString = #file,
    line: UInt = #line) {
        let times = callCount == 1 ? "time" : "times"
        if callCount > 0 {
            XCTFail("Never wanted but was called \(callCount) \(times). " + "\(methodName) with \(describeArguments())",
                    file: file,
                    line: line)
        }
    }

///check the “System Item” setting of the Bar Button Item
///which uses value(forKey:) to ask a UIBarButtonItem for a hidden numeric property named systemItem.
///It converts that number into the UIBarButtonItem.SystemItem enumeration.
func systemItem(for barButtonItem: UIBarButtonItem) ->
UIBarButtonItem.SystemItem {
    let systemItemNumber = barButtonItem.value(forKey: "systemItem") as! Int
    return UIBarButtonItem.SystemItem(rawValue: systemItemNumber)!
}

extension UIBarButtonItem.SystemItem: CustomStringConvertible {
    public var description: String {
        switch self {
        case .done: return "done"
        case .cancel: return "cancel"
        case .edit: return "edit"
        case .save: return "save"
        case .add: return "add"
        case .flexibleSpace: return "flexibleSpace"
        case .fixedSpace: return "fixedSpace"
        case .compose: return "compose"
        case .reply: return "reply"
        case .action: return "action"
        case .organize: return "organize"
        case .bookmarks: return "bookmarks"
        case .search: return "search"
        case .refresh: return "refresh"
        case .stop: return "stop"
        case .camera: return "camera"
        case .trash: return "trash"
        case .play: return "play"
        case .pause: return "pause"
        case .rewind: return "rewind"
        case .fastForward: return "fastForward"
        case .undo: return "undo"
        case .redo: return "redo"
        case .pageCurl: return "pageCurl"
        case .close: return "close"
        @unknown default: fatalError("Unknown UIBarButtonItem.SystemItem")
        }
    }
}

//MARK: - Test Buttons
///Tapping the Cancel button should get the active text field to resign input focus so that the keyboard goes away.
///We know from Test Input Focus, on page 180 that we need to put the view controller’s view into a UIWindow.
/// We also know that we need to take extra steps to clean up this UIWindow by executing the run loop.
func tap(_ button: UIBarButtonItem) {
    _ = button.target?.perform(button.action, with: nil)
}

func putInViewHierarchy(_ vc: UIViewController) {
    let window = UIWindow()
    window.addSubview(vc.view)
}

func executeRunLoop() {
    RunLoop.current.run(until: Date())
}

func tap(_ button: UIButton) {
    button.sendActions(for: .touchUpInside)
}
