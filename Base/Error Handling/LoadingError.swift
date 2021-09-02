//
//  LoadingError.swift
//  LoadingError
//
//  Created by finebel on 30.08.21.
//

import Foundation

enum LoadingError: Error, LocalizedError {
    case decodingError
    case invalidURL
    case invalidResponse(responseCode: Int?)
    case unknownError
    
    var errorDescription: String? {
        switch self {
        case .decodingError:
            return NSLocalizedString("Response couldn't be decoded.", comment: "")
            
        case .invalidURL:
            return NSLocalizedString("Trying to request an invalid url.", comment: "")
            
        case .invalidResponse(let responseCode):
            if let responseCode = responseCode {
                return NSLocalizedString("Getting an unexpected server response.\n Response Code: \(responseCode)", comment: "")
            } else {
                return NSLocalizedString("Getting an unexpected server response.", comment: "")
            }
            
        case .unknownError:
            return NSLocalizedString("An unknown error occured.", comment: "")
        }
    }
}

struct LoadingErrorType: Identifiable {
    let id = UUID()
    let error: LoadingError
}
