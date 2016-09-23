//
//  Errors.swift
//  JenkinsiOS
//
//  Created by Robert on 23.09.16.
//  Copyright © 2016 MobiLab Solutions. All rights reserved.
//

import Foundation

enum NetworkManagerError: Error{
    case JSONParsingFailed
    case HTTPResponseNoSuccess(code: Int, message: String)
    case dataTaskError(nsError: NSError)
    case noDataFound
    
    var localizedDescription: String{
        switch self {
        case .JSONParsingFailed:
            return "JSON Parsing Failed"
        case .HTTPResponseNoSuccess(let code, let message):
            return message + "\(code)"
        case .dataTaskError(let error):
            return error.localizedDescription
        case .noDataFound:
            return "No data found"
        default:
            return "An Error in the NetworkManager occurred"
        }
    }
}

enum ParsingError: Error{
    case DataNotCorrectFormatError
    case KeyMissingError(key: String)
    
    var localizedDescription: String{
        switch self {
        case .DataNotCorrectFormatError:
            return "The data is not in a correct format"
        case .KeyMissingError(let key):
            return "The key \(key) is missing in the JSON"
        default:
            return "An error occurred while parsing"
        }
    }
}
