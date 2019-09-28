//
//  URLSession+Ex.swift
//  QiitaAPIKit
//
//  Created by 伊藤凌也 on 2019/09/11.
//

import Foundation

protocol URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {
}
