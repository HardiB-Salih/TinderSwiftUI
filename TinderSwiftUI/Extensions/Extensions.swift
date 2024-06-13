//
//  Extensions.swift
//  TinderSwiftUI
//
//  Created by HardiB.Salih on 6/13/24.
//

import UIKit


//MARK: - STRING
extension String {
    var isNotEmpty: Bool { return !self.isEmpty }
    var isNotEmptyAndWhiteSpace: Bool {
        return !self.isEmpty && !self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    var isEmptyAndWhiteSpace: Bool {
        return self.isEmpty && !self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    func toInt() -> Int { return Int(self) ?? 0 }
    func toDouble() -> Double { return Double(self) ?? 0 }
    func toFloat() -> Float { return Float(self) ?? 0 }
    func toBool() -> Bool { return Bool(self) ?? false }
    
    func toDate(format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}

//MARK: - INT
extension Int {
    func toString() -> String { return String(self) }
    func toDouble() -> Double { return Double(self) }
    func toFloat() -> Float { return Float(self) }
    func toInt32() -> Int32 { return Int32(self) }
    func toInt64() -> Int64 { return Int64(self) }
    func toCGFloat() -> CGFloat { return CGFloat(self) }
}

//MARK: - Int32
extension Int32 {
    func toString() -> String { return String(self) }
    func toDouble() -> Double { return Double(self) }
    func toFloat() -> Float { return Float(self) }
    func toInt() -> Int { return Int(self) }
    func toInt64() -> Int64 { return Int64(self) }
    func toCGFloat() -> CGFloat { return CGFloat(self) }
}

//MARK: - Int64
extension Int64 {
    func toString() -> String { return String(self) }
    func toDouble() -> Double { return Double(self) }
    func toFloat() -> Float { return Float(self) }
    func toInt() -> Int { return Int(self) }
    func toInt32() -> Int32 { return Int32(self) }
    func toCGFloat() -> CGFloat { return CGFloat(self) }
}

//MARK: - Double
extension Double {
    func toString() -> String { return String(self) }
    func toInt() -> Int { return Int(self) }
    func toFloat() -> Float { return Float(self) }
    func toInt32() -> Int32 { return Int32(self) }
    func toInt64() -> Int64 { return Int64(self) }
    func toCGFloat() -> CGFloat { return CGFloat(self) }
}

//MARK: - Float
extension Float {
    func toString() -> String { return String(self) }
    func toInt() -> Int { return Int(self) }
    func toDouble() -> Double { return Double(self) }
    func toInt32() -> Int32 { return Int32(self) }
    func toInt64() -> Int64 { return Int64(self) }
    func toCGFloat() -> CGFloat { return CGFloat(self) }

}

//MARK: - CGFloat
extension CGFloat {
    func toInt() -> Int { return Int(self) }
    func toInt32() -> Int32 { return Int32(self) }
    func toInt64() -> Int64 { return Int64(self) }
    func toDouble() -> Double { return Double(self) }
    func toFloat() -> Float { return Float(self) }
    func toAbs() -> any SignedNumeric { return abs(self) }
}



//MARK: - Bool
extension Bool {
    func toString() -> String { return String(self) }
}

//MARK: - Date
extension Date {
    func toString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

//MARK: - Array
extension Array {
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
}
