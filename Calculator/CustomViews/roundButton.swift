//
//  roundButton.swift
//  Calculator
//
//  Created by Emmanuel Mayorga on 12/8/19.
//  Copyright © 2019 Emmanuel Mayorga. All rights reserved.
//

import UIKit

class roundButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    
    private func setupButton() {
        layer.cornerRadius  = frame.size.height/2
    }
}
