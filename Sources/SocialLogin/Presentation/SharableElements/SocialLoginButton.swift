//
//  File.swift
//  
//
//  Created by Sergiy Shevchuk on 27.08.2022.
//

import UIKit

final class SocialLoginButton: UIView {
    private let titleLabel = UILabel()
    private var thumbnailImage = UIImageView()
    
    private let type: SocialButtonType
    
    init(type: SocialButtonType) {
        self.type = type
        
        super.init(frame: CGRect.zero)
        
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        
    }
}
