import Foundation

protocol BitCoinData {
    func getBitCoinData(data : BitCoinDataCollections)
}

struct CoinManager {
    
    var delegate : BitCoinData?
    
    let apiKey = "70212123-8BDB-4C6D-A39B-5B1521275319"

    func fetchData() {
        let key = "https://rest.coinapi.io/v1/exchangerate/BTC?apikey=\(apiKey)"
        getData(key: key)
    }
    
    func getData(key : String) {
        
        let url = URL(string: key)!
        let session = URLSession(configuration: .default)
        let data = session.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error!)
                return
            }
            
            if let safeData = data {
                let result = self.parseData(data: safeData)!
                let dataCollections = BitCoinDataCollections(rate: result.rates[0].rate)
                delegate?.getBitCoinData(data: dataCollections)
            }
        }
        data.resume()
    }
    
    func parseData(data : Data) -> BitCoinDecodeData? {
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(BitCoinDecodeData.self, from: data)
            return result
        } catch {
            print(error)
            return nil
        }
    }
}
