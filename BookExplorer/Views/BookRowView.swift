//
//  BookListView.swift
//  BookExplorer
//
//  Created by Himidiri Himakanika on 2025-11-20.
//

import SwiftUI

struct BookRowView: View {
    
    let book: Book

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            if let url = book.imageURL {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 56, height: 80)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 56, height: 80)
                            .clipped()
                            .cornerRadius(6)
                    case .failure:
                        Image(systemName: "book")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 56, height: 80)
                            .foregroundStyle(.secondary)
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Image(systemName: "book")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 56, height: 80)
                    .foregroundStyle(.secondary)
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(book.title)
                    .font(.headline)
                    .lineLimit(2)

                Text(book.authors.map(\.name).joined(separator: ", "))

                HStack {
                    Image(systemName: "arrow.down.circle")
                    Text("\(book.downloadCount)")
                }
                .font(.footnote)
                .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    BookRowView(book: Book.sample)
}
