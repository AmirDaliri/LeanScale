//
//  ActivityIndicator.swift
//  LeanScale
//
//  Created by Amir Daliri on 6/20/20.
//  Copyright © 2020 Amir Daliri. All rights reserved.
//

import UIKit

// MARK: - Loading
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
    
    func showAlert(title: String, message: String, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func exitAppAlert() {

        let alert = UIAlertController(title: "Ops!", message: Strings.notNet, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { (action) in
            UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
            // terminaing app in background
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                exit(EXIT_SUCCESS)
            })
        }))
        self.present(alert, animated: true, completion: nil)
    }
}


// MARK: - HTML Label
extension UILabel {
    func set(html: String) {
        if let htmlData = html.data(using: .unicode) {
            do {
                self.attributedText = try NSAttributedString(data: htmlData,
                                                             options: [.documentType: NSAttributedString.DocumentType.html],
                                                             documentAttributes: nil)
                self.textColor = Style.Colors.label
            } catch let e as NSError {
                print("Couldn't parse \(html): \(e.localizedDescription)")
            }
        }
    }
}

// MARK: - Color Method

public enum DefaultStyle {

    public enum Colors {

        public static let label: UIColor = {
            if #available(iOS 13.0, *) {
                return UIColor.label
            } else {
                return .black
            }
        }()
    }
}
public let Style = DefaultStyle.self

