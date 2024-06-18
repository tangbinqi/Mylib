//
//  ViewController.swift
//  Mylib
//
//  Created by tangbinqi on 06/17/2024.
//  Copyright (c) 2024 tangbinqi. All rights reserved.
//

import UIKit
import Mylib

class ViewController: UIViewController {

    lazy var QRCodeImageView: UIImageView = {
        var QRCodeImageView = UIImageView(frame: .zero)
        return QRCodeImageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(QRCodeImageView)
        QRCodeImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            QRCodeImageView.widthAnchor.constraint(equalToConstant: 200),
            QRCodeImageView.heightAnchor.constraint(equalToConstant: 200),
            QRCodeImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            QRCodeImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1) { [self] in
            self.QRCodeImageView.image = MyQRCode.generateQRCode(message: "中国文化博大精深", size: QRCodeImageView.bounds.size.width)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    
}

