//
//  ViewController.swift
//  MapboxIssueTest
//
//  Created by Federico Ojeda on 8/8/18.
//  Copyright © 2018 Federico Ojeda. All rights reserved.
//

import UIKit
import Mapbox

class ViewController: UIViewController {

  var styleManager: StyleManager!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let mapView = MGLMapView(frame: view.bounds)
    
    styleManager = StyleManager(mapView: mapView)
    styleManager.setStyle()
    
    mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    mapView.setCenter(CLLocationCoordinate2D(latitude: 29.4241, longitude: -98.4936), zoomLevel: 9, animated: false)
    view.addSubview(mapView)
  }
  
}

