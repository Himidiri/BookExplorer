//
//  BookViewModel.swift
//  BookExplorer
//
//  Created by Himidiri Himakanika on 2025-11-20.
//

import Foundation
import Observation

@Observable
class BookViewModel {
    var appState: AppState = .idle
    var bookResponse: BookResponse?
    var books: [Book] = []
    var errorMsg : String?
    
    // MARK: - Fetch Book
    func fetchBooks() async {
        guard appState != .loading else { return }
        
        appState = .loading
        
        let urlString = "https://gutendex.com/books/"
        
        guard let url = URL(string: urlString) else {
            errorMsg = APIError.InvalidURL.errorDescription
            appState = .failure
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse =  response as? HTTPURLResponse,(200..<300).contains(httpResponse.statusCode)else{
                errorMsg = APIError.InvalidResponse.errorDescription
                appState = .failure
                return
            }
            
            let decordedData = try JSONDecoder().decode(BookResponse.self, from: data)
            bookResponse = decordedData
            books = decordedData.results
            appState = .sucsses
        }catch {
            errorMsg = APIError.unknown.errorDescription
            appState = .failure
        }
    }
    
    // MARK: - Search
    func search(with text: String) {
        guard let allBooks = bookResponse?.results else { return }
        
        guard !text.isEmpty else {
            books = allBooks
            return
        }
        
        let lowercasedText = text.lowercased()
        
        books = allBooks.filter {
            $0.title.lowercased().contains(lowercasedText)}
    }
}
