//
//  BookDetailsView.swift
//  BookExplorer
//
//  Created by Himidiri Himakanika on 2025-11-20.
//

import SwiftUI

struct BookDetailsView: View {
    let book: Book
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                if let url = book.imageURL {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            ZStack {
                                Rectangle().fill(Color.secondary.opacity(0.1))
                                ProgressView()
                            }
                            .frame(height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        case .failure:
                            Image(systemName: "book")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 100)
                                .foregroundStyle(.secondary)
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
                
                Text(book.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                ForEach(book.authors) { author in
                    Text(author.name)
                        .font(.title2)
                        .foregroundColor(.secondary)
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text("Summary")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    ForEach(book.summaries, id: \.self) { line in
                        Text(line)
                            .font(.body)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            }
            .padding()
        }
        .navigationTitle("Book Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    BookDetailsView(book: Book.sample)
}
