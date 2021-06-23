//
//  RequestModel.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 22/06/21.
//

import Foundation

public class RequestModel: Codable{
    
    init(){
        
    }
    
    func toJSONString() -> String? {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(self)
            return String(data: data, encoding: .utf8)
        } catch {
            return nil
        }
    }
    
    func toJSONDictionary() -> [String: Any]?{
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(self)
//            return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
            return (try? JSONSerialization.jsonObject(with: encoder.encode(self), options: .allowFragments)) as? [String: Any] ?? [:]
            
        } catch {
            return nil
        }
    }
}

