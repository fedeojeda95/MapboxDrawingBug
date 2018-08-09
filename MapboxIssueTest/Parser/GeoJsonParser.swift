//
//  GeoJsonParser.swift
//  MapboxIssueTest
//
//  Created by Federico Ojeda on 8/9/18.
//  Copyright © 2018 Federico Ojeda. All rights reserved.
//

import Foundation
import Mapbox

class GeoJsonParser: Parser {
  
  public func parse() -> MGLShapeSource? {
    guard
      let geoJsonDictionary = getJsonFile(resource: "map", fileExtension: "geojson"),
      let geoJsonData = try? JSONSerialization.data(withJSONObject: geoJsonDictionary, options: []),
      let geoJsonFeatureCollection = try? MGLShape(data: geoJsonData, encoding: String.Encoding.utf8.rawValue) as? MGLShapeCollectionFeature
    else {
        return nil
    }
    
    let source = MGLShapeSource(identifier: StyleManager.geoJsonSourceIdentifier, shape: geoJsonFeatureCollection, options: nil)
    return source
  }
  
}
