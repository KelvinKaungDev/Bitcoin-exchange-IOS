//
//  BitCoinDecodeData.swift
//  ByteCoin
//
//  Created by Kaung Htet OO on 5/10/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct BitCoinDecodeData : Codable {
    var rates : [Rate]
}

struct Rate : Codable {
    var rate : Double
    var time : String
}
