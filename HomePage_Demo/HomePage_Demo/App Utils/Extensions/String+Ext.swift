//
//  String+Ext.swift
//  KKR App
//
//  Created by Ajinkya Sonar on 07/01/23.
//

import Foundation
import UIKit

extension String {
    static let blank = ""
    static let notApplicable = "N/A"
    
    func before(first delimiter: Character) -> String {
            if let index = firstIndex(of: delimiter) {
                let before = prefix(upTo: index)
                return String(before)
            }
        return .blank
        }
        
        func after(first delimiter: Character) -> String {
            if let index = firstIndex(of: delimiter) {
                let after = suffix(from: index).dropFirst()
                return String(after)
            }
            return .blank
        }
    
    var isNumber : Bool {
        {
            return !self.isEmpty && self.rangeOfCharacter(from: NSCharacterSet.decimalDigits.inverted) == nil
        }()
    }
    
    func isValidPassword() -> Bool {
        let password = self.trimmingCharacters(in: CharacterSet.whitespaces)
        let passwordRegx = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{5,}$"
        //let passwordRegx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%.,^&*])(?=.{8,})"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
        return passwordCheck.evaluate(with: password)
    }
    
    public func validateEmailAddress() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate.init(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }

    func validatePhoneNumberLength() -> Bool {
        return (self.count >= 5 && self.count <= 15)
    }
    func validatePhoneNumberLengthForIndia() -> Bool {
        return (self.count == 10)
    }

    var html2AttributedString: NSAttributedString? {
        Data(utf8).html2AttributedString
    }
    var html2String: String {
        html2AttributedString?.string ?? ""
    }
    
    
    func convertToDate(dateFormat: LSGDateFormats = .fixtures) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat.rawValue
//        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = .current
        return dateFormatter.date(from: self)
    }
    
    func convertDateFormat(sourceDateFormat : String, destinationFormat : String) -> String{

        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = sourceDateFormat;

        if let date = dateFormatter.date(from: self){
            dateFormatter.dateFormat = destinationFormat;
            return dateFormatter.string(from: date)
        }else{
            return ""
        }
    }
    
    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

extension Data {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String { html2AttributedString?.string ?? "" }
}

extension UITextField{
       
       @IBInspectable var doneAccessory: Bool{
           get{
               return self.doneAccessory
           }
           set (hasDone) {
               if hasDone{
                   addDoneButtonOnKeyboard()
               }
           }
       }
       
       func addDoneButtonOnKeyboard()
       {
           let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
           doneToolbar.barStyle = .default
           
           let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
           let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
           
           let items = [flexSpace, done]
           doneToolbar.items = items
           doneToolbar.sizeToFit()
           
           self.inputAccessoryView = doneToolbar
       }
       
       @objc func doneButtonAction() {
           self.resignFirstResponder()
       }
       
   }
