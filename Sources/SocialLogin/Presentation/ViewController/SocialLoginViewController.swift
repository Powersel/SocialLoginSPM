//
//  File.swift
//  
//
//  Created by Powersel on 02.09.2022.
//

import UIKit
import Foundation

public final class SocialLoginViewController: UIViewController {
    
    @IBOutlet weak var googleButton: SocialButtonView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
}

private extension SocialLoginViewController {
    func configureUI() {
        view.backgroundColor = .white
        
        googleButton.configureForLogin(with: .google)
    }
}
