//
//  StyleManager.swift
//  MapboxIssueTest
//
//  Created by Federico Ojeda on 8/9/18.
//  Copyright © 2018 Federico Ojeda. All rights reserved.
//

import Foundation
import Mapbox

class StyleManager: NSObject {
  
  static let geoJsonSourceIdentifier = "mapElements"
  
  var mapView: MGLMapView!
  var mapStyle: MGLStyle!
  let geoJsonParser = GeoJsonParser()
  
  init(mapView: MGLMapView) {
    super.init()
    self.mapView = mapView
    mapView.delegate = self
  }
  
  func setStyle() {
    mapView.styleURL = MGLStyle.darkStyleURL
  }
  
  func setUpMap() {
    guard let shapeSource = geoJsonParser.parse() else {
      return
    }
    
    mapStyle.addSource(shapeSource)
    
    addLayers(shapeSource: shapeSource)
  }
  
  private func addLayers(shapeSource: MGLSource) {
    // Create line style layer
    let lineLayer = MGLLineStyleLayer(identifier: "boundary", source: shapeSource)
    
    // Use a predicate to only style the polygons
    lineLayer.predicate = NSPredicate(format: "toolType = 'polygons' && toolId = 2")
    lineLayer.lineColor = NSExpression(forConstantValue: UIColor.red)
    lineLayer.lineWidth = NSExpression(forConstantValue: 2)
    
    // Add style layers to the map view's style.
    mapStyle.addLayer(lineLayer)
  }
}

extension StyleManager: MGLMapViewDelegate {
  
  func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
    mapStyle = style
    setUpMap()
  }
  
}
