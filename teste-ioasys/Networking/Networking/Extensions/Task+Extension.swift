//
//  Task+Extension.swift
//  Networking
//
//  Created by Guilherme Araujo on 21/09/20.
//  Copyright © 2020 ioasys. All rights reserved.
//

import Moya
import OxeNetworking

extension Task {

    static func requestPercentParameters(parameters: [String: Any], encoding: ParameterEncoding) -> Task {
        var requestParameters = parameters
        for parameter in requestParameters where parameter.value is String {
            guard let value = parameter.value as? String else { continue }

            let requestFormat = value.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            requestParameters[parameter.key] = requestFormat
        }
        return .requestParameters(parameters: requestParameters, encoding: encoding)
    }

    static func uploadPercentCompositeMultipart(_ formData: [MultipartFormData], urlParameters: [String: Any]) -> Task {
        var requestParameters = urlParameters
        for parameter in requestParameters where parameter.value is String {
            guard let value = parameter.value as? String else { continue }

            let requestFormat = value.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            requestParameters[parameter.key] = requestFormat
        }
        return .uploadCompositeMultipart(formData, urlParameters: requestParameters)
    }
}
