@testable import NetworkRequest
import XCTest

final class ViewControllerTests: XCTestCase {
    
//    private var alertVerifier: AlertVerifier!
    private var sut: ViewController!
    private var spyURLSession: SpyURLSession!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(
            identifier: String(describing: ViewController.self))
        spyURLSession = SpyURLSession()
        sut.session = spyURLSession
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        spyURLSession = nil
        sut = nil
        super.tearDown()
    }
    ///We now have a test that checks the network request without starting the download.
    func test_tappingButton_shouldMakeDataTaskToSearchForEBookOutFromBoneville() {
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
    
    
    func test_searchForBookNetworkCall_withSuccessResponse_shouldSaveDataInResults() {
        tap(sut.button)
        
        let handleResultsCalled = expectation(description: "handleResults called")
        sut.handleResults = { _ in
            handleResultsCalled.fulfill()
        }
        
        spyURLSession.dataTaskArgsCompletionHandler.first?(
            jsonData(), response(statusCode: 200), nil
        )
        
        waitForExpectations(timeout: 0.01)
        
        XCTAssertEqual(sut.results, [
            SearchResult(artistName: "Artist", trackName: "Track", averageUserRating: 2.5, genres: ["Foo", "Bar"])
        ])
        ///This would work if the closure stayed on the same thread. But run tests, and
        ///you’ll see a failure message. We need to account for multithreading.
    }
    
    func test_searchForBookNetworkCall_withSuccessBeforeAsync_shouldNotSaveDataInResults() {
        tap(sut.button)
        
        spyURLSession.dataTaskArgsCompletionHandler.first?(
            jsonData(), response(statusCode: 200), nil
        )
        
        XCTAssertEqual(sut.results, [])
    }
    
    ///We need some test JSON.
    private func jsonData() -> Data {
        """
        {
            "results": [
                {
                    "artistName": "Artist",
                    "trackName": "Track",
                    "averageUserRating": 2.5,
                    "genres": [
                        "Foo",
                        "Bar"
                    ]
                }
            ]
        }
        """.data(using: .utf8)!
    }
    
    ///we should supply an HTTPURLResponse with a status code of 200 for HTTP “OK.”
    private func response(statusCode: Int) -> HTTPURLResponse? {
        HTTPURLResponse(url: URL(string: "http://DUMYY")!,
                        statusCode: statusCode, httpVersion: nil, headerFields: nil)
    }
}
