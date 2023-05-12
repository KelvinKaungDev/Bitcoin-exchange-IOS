
import Foundation

struct BitCoinDataCollections {
    var rate : [Rate]
    var currency : String
    
    func exchange() -> Int {
        let result = rate.map{$0.asset_id_quote}
        return result.firstIndex(of: currency)!
    }
}
