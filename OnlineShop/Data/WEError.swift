//
//  WEError.swift
//  Weather_Visor
//
//  Created by  on 29/1/24.
//

import Foundation

enum WEError: Error{
    case invalidURL(String)
    case invalidData
    case invalidResponse
    case unableToComplete
}
