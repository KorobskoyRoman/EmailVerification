//
//  NetworkDataFetch.swift
//  EmailVerification
//
//  Created by Roman Korobskoy on 28.03.2022.
//

import Foundation

class NetworkDataFetch {
    
    static let shared = NetworkDataFetch()
    private init() {}
    
    func fetchMail(mail: String, response: @escaping (MailResponseModel?, Error?) -> Void) {
        NetworkRequest.shared.requestData(mail: mail) { result in
            switch result {
            case .success(let data):
                do {
                    let mail = try JSONDecoder().decode(MailResponseModel.self, from: data)
                    response(mail, nil)
                } catch let error{
                    print("failed to decode JSON", error)
                }
            case .failure(let error):
                print("error recieved data: \(error)")
                response(nil, error)
            }
        }
    }
}
