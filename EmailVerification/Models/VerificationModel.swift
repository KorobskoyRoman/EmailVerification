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
    
    public func getFilteredMail(text: String) {
        filtringMails(text: text)
    }
}
