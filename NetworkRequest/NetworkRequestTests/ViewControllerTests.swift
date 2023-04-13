@testable import NetworkRequest
import XCTest

final class ViewControllerTests: XCTestCase {
    func test_tappingButton_shouldMakeDataTaskToSearchForEBookOutFromBoneville() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut: ViewController = sb.instantiateViewController(
            identifier: String(describing: ViewController.self))
        let mockURLSession = MockURLSession()
        sut.session = mockURLSession
        sut.loadViewIfNeeded()
        tap(sut.button)
        let urlRequest = URLRequest(url: URL(string: "https://itunes.apple.com/search?media=ebook&term=out%20from%20boneville")!)
//        XCTAssertEqual(mockURLSession.dataTaskCallCount, 1, "call count")
//
//        XCTAssertEqual(
//            mockURLSession.dataTaskArgsRequest.first,
//            URLRequest(url: URL(string: "https://itunes.apple.com/search?media=ebook&term=out%20from%20boneville")!),
//            "request")
        mockURLSession.verifyDataTask(with: urlRequest)
    }
    ///We now have a test that checks the network request without starting the download.
}
