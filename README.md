# BookExplorer 📚

BookExplorer is a modern iOS app built with SwiftUI that lets users explore and discover books from the Project Gutenberg library. The app provides a clean and intuitive interface to search, browse, and view detailed information about thousands of classic books.

## Features ✨

- **Browse Books**: View a curated list of books from the Gutendex API
- **Search Functionality**: Search for books by title in real-time
- **Book Details**: View comprehensive information including:
  - Book cover images
  - Full title and author information
  - Author birth/death years
  - Book summaries
  - Download counts
- **Clean UI**: Modern SwiftUI interface with smooth navigation
- **Error Handling**: Graceful error states with user-friendly messages
- **Async/Await**: Modern Swift concurrency for smooth performance

## Technologies Used 🛠️

- **Swift**: Primary programming language
- **SwiftUI**: Modern declarative UI framework
- **Observation Framework**: State management with `@Observable`
- **URLSession**: Networking and API calls
- **AsyncImage**: Asynchronous image loading
- **Gutendex API**: Free API for Project Gutenberg books

## Architecture 🏗️

The app follows the MVVM (Model-View-ViewModel) architectural pattern:

```
BookExplorer/
├── Models/
│   └── BookResponse.swift    # Book and Author data models
├── ViewModels/
│   └── BookViewModel.swift   # Business logic and API calls
├── Views/
│   ├── BookRowView.swift     # List row component
│   └── BookDetailView.swift  # Detail view
├── Helpers/
│   ├── APIError.swift        # Error handling
│   └── AppState.swift        # App state management
├── ContentView.swift         # Main view
└── BookExplorerApp.swift     # App entry point
```

## Requirements 📋

- **iOS**: 17.0 or later
- **Xcode**: 15.0 or later
- **Swift**: 5.9 or later

## Installation 🚀

1. Clone the repository:
```bash
git clone https://github.com/Himidiri/BookExplorer.git
```

2. Open the project in Xcode:
```bash
cd BookExplorer
open BookExplorer.xcodeproj
```

3. Select your target device or simulator

4. Build and run the project (⌘ + R)

## API 🌐

This app uses the [Gutendex API](https://gutendex.com/), a free JSON API for Project Gutenberg ebook metadata.

**Endpoint**: `https://gutendex.com/books/`

No API key required! 🎉

## Screenshots 📱

<!-- Add screenshots here -->
*Screenshots coming soon...*

## Future Enhancements 🔮

- [ ] Pagination support for loading more books
- [ ] Favorites/bookmarks feature
- [ ] Filter by author, subject, or language
- [ ] Dark mode optimization
- [ ] Book reading links
- [ ] Share book information

## Author 👤

**Himidiri Himakanika**

Created on November 20, 2025

## License 📄

This project is available for educational and personal use.

## Acknowledgments 🙏

- [Project Gutenberg](https://www.gutenberg.org/) for providing free ebooks
- [Gutendex](https://gutendex.com/) for the excellent API
