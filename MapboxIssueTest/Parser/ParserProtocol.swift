//
//  ParserProtocol.swift
//  MapboxIssueTest
//
//  Created by Federico Ojeda on 8/9/18.
//  Copyright © 2018 Federico Ojeda. All rights reserved.
//

import Foundation
import Mapbox

protocol Parser {
  func parse() -> MGLShapeSource?
}

extension Parser {
  
  // MARK: - Helpers
  
  func getJsonFile(resource: String, fileExtension: String) -> [String: Any]? {
    guard
      let path = Bundle.main.url(forResource: resource, withExtension: fileExtension),
      let data = try? Data(contentsOf: path),
      let object = try? JSONSerialization.jsonObject(with: data),
      let dictionary = object as? [String: Any]
      else {
        return nil
    }
    
    return dictionary
  }
}
