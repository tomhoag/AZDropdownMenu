//
//  AZDropdownMenuBaseCell.swift
//  Pods
//
//  Created by Chris Wu on 01/15/2016.
//  Copyright (c) 2016 Chris Wu. All rights reserved.
//

import Foundation

open class AZDropdownMenuBaseCell : UITableViewCell, AZDropdownMenuCellProtocol {
    
    open func configureData(_ data: AZDropdownMenuItemData) {

        var content:UIListContentConfiguration
        if let c = self.contentConfiguration as? UIListContentConfiguration {
            content = c
        } else {
            content = self.defaultContentConfiguration()
        }
        content.text = data.title
        self.contentConfiguration = content
    }

    func configureStyle(_ config: AZDropdownMenuConfig) {

        self.selectionStyle = .none
        self.backgroundColor = config.itemColor

        var content:UIListContentConfiguration
        if let c = self.contentConfiguration as? UIListContentConfiguration {
            content = c
        } else {
            content = self.defaultContentConfiguration()
        }

        content.textProperties.color = config.itemFontColor
        content.textProperties.font = UIFont(name: config.itemFont, size: config.itemFontSize) ?? UIFont.systemFont(ofSize: 10)
        self.contentConfiguration = content

//        switch config.itemAlignment {
//        case .left:
//            self.textLabel?.textAlignment = .left
//        case .right:
//            self.textLabel?.textAlignment = .right
//        case .center:
//            self.textLabel?.textAlignment = .center
//        }
    }
}

protocol AZDropdownMenuCellProtocol {
    func configureData(_ data: AZDropdownMenuItemData)
    func configureStyle(_ configuration:AZDropdownMenuConfig)
}

public enum AZDropdownMenuItemAlignment {
    case left, right, center
}
