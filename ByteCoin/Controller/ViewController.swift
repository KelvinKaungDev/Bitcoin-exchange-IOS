import UIKit

class ViewController: UIViewController {

    @IBOutlet var userPick: UIPickerView!
    @IBOutlet var exchangeRate: UILabel!
    @IBOutlet var exchangeUnit: UILabel!
    
    let currencyArray = ["AUD","BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
        
    var bitCoin = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bitCoin.delegate = self
        userPick.delegate = self
        bitCoin.fetchData()
    }
}

//Mark : UIPicker

extension ViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyArray[row]
    }
}

//Mark : CoinManager

extension ViewController : BitCoinData {
    func getBitCoinData(data: BitCoinDataCollections) {
        DispatchQueue.main.async {
            self.exchangeRate.text = String(format: "%.1f", data.rate)
        }
    }
}

