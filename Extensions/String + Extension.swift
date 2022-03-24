//
//  String + Extension.swift
//  EmailVerification
//
//  Created by Roman Korobskoy on 24.03.2022.
//

import Foundation

extension String {
    func isValid() -> Bool {
        let format = "SELF MATCHES %@"
        let regEx = "[a-zA-Z0-9._]+@[a-zA-Z]+\\.[a-zA-Z]{2,3}"
        return NSPredicate(format: format, regEx).evaluate(with: self)
    }
}
