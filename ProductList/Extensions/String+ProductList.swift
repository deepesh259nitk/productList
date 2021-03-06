//
//  Int64+ProductList.swift
//  ProductList
//
//  Created by ITRMG on 2017-27-10.
//  Copyright © 2017 Vasthimal, Deepesh : @djrecker. All rights reserved.
//

import Foundation

extension String {
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}
