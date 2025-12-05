//
//  APIError.swift
//  BookExplorer
//
//  Created by Himidiri Himakanika on 2025-11-20.
//

import Foundation

enum APIError:Error, LocalizedError {
    case InvalidURL
    case InvalidResponse
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .InvalidURL:
            return "Invalid URL"
        case .InvalidResponse:
            return "Invalid Response"
        case .unknown:
            return "Unknown Error"
        }
    }
}


































