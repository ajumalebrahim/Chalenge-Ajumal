//
//  DeliveryDetailViewController.swift
//  Challenge-Ajumal
//
//  Created by Ajumal Ebrahim on 9/20/18.
//  Copyright © 2018 Ajumal Ebrahim. All rights reserved.
//

import UIKit
import MapKit
import SDWebImage

class DeliveryDetailViewController: UIViewController, MKMapViewDelegate {
    
    var mapView: MKMapView?
    var deliveryData: DeliverySevice?
    let imgVwDelvry = UIImageView()
    let lblDelvryTitle = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        title = "Delivery Details"
        updateUI()
        
    }
    
    private func updateUI() {
        let mapView = MKMapView()
        mapView.delegate = self
        let leftMargin:CGFloat = 0
        let topMargin:CGFloat = 0
        let mapWidth:CGFloat = view.frame.size.width
        let mapHeight:CGFloat = view.frame.size.height * 0.75
        
        mapView.frame = CGRect(x: leftMargin, y: topMargin, width: mapWidth, height: mapHeight)
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        view.addSubview(mapView)
        
        let vw = UIView.init(frame: CGRect(x: 0, y: mapHeight, width: mapWidth, height: view.frame.size.height - mapHeight))
        vw.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        imgVwDelvry.translatesAutoresizingMaskIntoConstraints = false
        lblDelvryTitle.translatesAutoresizingMaskIntoConstraints = false
        
        lblDelvryTitle.text = deliveryData?.description
        if let imageUrl = deliveryData?.imageUrl {
            imgVwDelvry.sd_setImage(with: URL(string: imageUrl), placeholderImage: #imageLiteral(resourceName: "NoImage"))
        } else {
            imgVwDelvry.image = #imageLiteral(resourceName: "NoImage")
        }
        
        vw.addSubview(imgVwDelvry)
        vw.addSubview(lblDelvryTitle)
        
        let views: [String: Any] = [
            "image": imgVwDelvry,
            "Label": lblDelvryTitle]
        var allConstraints: [NSLayoutConstraint] = []
        let iconVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-15-[image(50)]",
            metrics: nil,
            views: views)
        allConstraints += iconVerticalConstraints
        
        let nameLabelVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-15-[Label]",
            metrics: nil,
            views: views)
        allConstraints += nameLabelVerticalConstraints
        
        let iconHConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-15-[image(50)]",
            metrics: nil,
            views: views)
        allConstraints += iconHConstraints
        
        let topRowHorizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-15-[image(50)]-[Label]-15-|",
            metrics: nil,
            views: views)
        allConstraints += topRowHorizontalConstraints
        NSLayoutConstraint.activate(allConstraints)
        
        view.addSubview(vw)
    }
    
    func updateAnnotation() {
        
        guard let address = deliveryData?.loc.address else {
            return
        }
        guard let lat = deliveryData?.loc.lat else {
            return
        }
        guard let lng = deliveryData?.loc.lng else {
            return
        }
        
        let pin = Pin(title: address,
                              coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lng))
        mapView?.addAnnotation(pin)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }
        
        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }
        
        return annotationView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
