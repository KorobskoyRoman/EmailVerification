//
//  VerificationModel.swift
//  EmailVerification
//
//  Created by Roman Korobskoy on 23.03.2022.
//

import Foundation

class VerificationModel {
    
    private let mailsArray = ["@gmail.com", "@yandex.ru", "@mail.ru"]
    
    public var nameMail = String()
    public var filteredMailArray = [String]()
    
    private func filtringMails(text: String) {
        var domainMail = String()
        filteredMailArray = []
        
        guard let fistIndex = text.firstIndex(of: "@") else { return }
        let endIndex = text.index(before: text.endIndex)
        let range = text[fistIndex...endIndex]
        domainMail = String(range)
        
        mailsArray.forEach { mail in
            if mail.contains(domainMail) {
                if !filteredMailArray.contains(mail) {
                    filteredMailArray.append(mail)
                }
            }
        }
    }
    
    private func deriveNameMail(text: String) {
        guard let atStymbolIndex = text.firstIndex(of: "@") else { return }
        let endIndex = text.index(before: atStymbolIndex)
        let firstIndex = text.startIndex
        let range = text[firstIndex...endIndex]
        nameMail = String(range)
    }
    
    public func getFilteredMail(text: String) {
        filtringMails(text: text)
    }
    
    public func getMailName(text: String) {
        deriveNameMail(text: text)
    }
}
