//
//  Array+Only.swift
//  Memorize
//
//  Created by Aige Cortasa, Albert on 18/09/2020.
//  Copyright © 2020 Aige Cortasa, Albert. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
