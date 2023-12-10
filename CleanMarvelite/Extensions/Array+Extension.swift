//
//  Array+Extension.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

import Foundation

extension Array {

    public subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
