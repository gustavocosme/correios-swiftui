//
//  NSRegularExpression+Extensions.swift
//  Buscador
//
//  Created by Gustavo Cosme on 26/12/21.
//

import SwiftUI

extension NSRegularExpression {
    
    public enum Regex: String {
        case parcel = "^[A-Z]{2}[0-9]{9}[A-Z]{2}$"
    }
    
    public static func match(text: String, regex: Regex) -> Bool {
        let range = NSRange(location: 0, length: text.utf16.count)
        let regex = try! NSRegularExpression(pattern: regex.rawValue)
        let match = regex.firstMatch(in: text, options: [], range: range)
        return (match != nil) ? true : false
    }
}
