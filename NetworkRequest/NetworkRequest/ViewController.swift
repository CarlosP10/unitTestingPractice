//
//  ViewController.swift
//  NetworkRequest
//
//  Created by Carlos Paredes on 12/4/23.
//

import UIKit

protocol URLSessionProtocol {
    func dataTask(
        with request: URLRequest,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {}

struct Search: Decodable {
    let results: [SearchResult]
}


///Defining SearchResult so that it conforms to the Equatable protocol. This will make it simple to test with an XCTAssertEqual() assertion.
struct SearchResult: Decodable, Equatable {
    let artistName: String
    let trackName: String
    let averageUserRating: Float
    let genres: [String]
}

class ViewController: UIViewController {
    
    @IBOutlet private(set) var button: UIButton!
    private var dataTask: URLSessionDataTask?
    
    private(set) var results: [SearchResult] = [] {
        didSet {
            handleResults(results)
        }
    }
    
    var session: URLSessionProtocol = URLSession.shared
    var handleResults: ([SearchResult]) -> Void = {print($0)}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func buttonTapped() {
        searchForBook(terms: "out from boneville")
//        searchForBook(terms: "the great cow race")
    }
    
    private func searchForBook(terms: String) {
        guard let encodedTerms = terms.addingPercentEncoding(
            withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "https://itunes.apple.com/search?" +
                            "media=ebook&term=\(encodedTerms)") else { return }
        
        let request = URLRequest(url: url)
        
        dataTask = session.dataTask(with: request) {
            [weak self] (data: Data?, response: URLResponse?, error: Error?)
            -> Void in
            
            guard let self = self else { return }
            
            var decoded: Search?
            var errorMessage: String?
            if let error = error {
                errorMessage = error.localizedDescription
            } else if let response = response as? HTTPURLResponse,
                        response.statusCode != 200 {
                errorMessage = "Response " +
                HTTPURLResponse.localizedString(
                    forStatusCode: response.statusCode)
            } else if let data = data {
                do {
                    decoded = try JSONDecoder().decode(Search.self, from: data)
                } catch {
                    errorMessage = error.localizedDescription
                }
            }
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                if let decoded = decoded {
                    self.results = decoded.results
                }
                if let errorMessage = errorMessage {
                    self.showError(errorMessage)
                }
                self.dataTask = nil
                self.button.isEnabled = true
            }
        }
        button.isEnabled = false
        dataTask?.resume()
    }
    
    private func showError(_ message: String) {
        let tittle = "Network problem"
        print("\(title): \(message)")
        let alert = UIAlertController(
            title: tittle,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        alert.preferredAction = okAction
        present(alert, animated: true)
    }
}
