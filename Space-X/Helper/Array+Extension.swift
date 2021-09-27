//
//  Array+Extension.swift
//  Space-X
//
//  Created by eyup cimen on 26.09.2021.
//  Copyright © 2021 eyup cimen. All rights reserved.
//

import Foundation

public extension Array {
    
    public struct IndexOutOfBoundsError: Error { }
    
    public func element(at index: Int) throws -> Element {
        guard index >= 0 && index < self.count else {
            throw IndexOutOfBoundsError()
        }
        return self[index]
    }
}
