//
//  ActivityIndicator.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/20/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import UIKit

extension UIViewController {
    func runActivityIndicator(){
        self.view.isUserInteractionEnabled = false
        let indicatorView = UIActivityIndicatorView()
        indicatorView.startAnimating()
        if #available(iOS 13.0, *) {
            indicatorView.style = .large
        } else {
            indicatorView.style = .whiteLarge
        }
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.tag = 420
        self.view.addSubview(indicatorView)
        indicatorView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        indicatorView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    func stopActivityIndicator(){
        DispatchQueue.main.async {
            self.view.isUserInteractionEnabled = true
            if let subViews = self.view.viewWithTag(420) {
                subViews.removeFromSuperview()
            }
        }
    }
}

