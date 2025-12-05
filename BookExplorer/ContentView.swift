//
//  ContentView.swift
//  BookExplorer
//
//  Created by Himidiri Himakanika on 2025-11-20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var viewModel = BookViewModel()
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                switch viewModel.appState {
                case .idle:
                    EmptyView()
                case .loading:
                    ProgressView()
                case .sucsses:
                    List(viewModel.books) { book in
                        NavigationLink(destination: BookDetailsView(book: book)) {
                            BookRowView(book: book)
                        }
                    }
                    .listStyle(.plain)
                case .failure:
                    Text(viewModel.errorMsg ?? "Something went wrong. Try again later.")
                }
            }
            .task {
                await viewModel.fetchBooks()
            }
            .navigationBarTitle("Book Explorer").navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .automatic), prompt: "Search Books")
            .onChange(of: searchText) { oldValue,newValue in
                
                viewModel.search(with: newValue)
            }
        }
    }
}

#Preview {
    ContentView()
}
