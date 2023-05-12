import UIKit

class ViewController: UIViewController {

    @IBOutlet var userPick: UIPickerView!
    @IBOutlet var exchangeRate: UILabel!
    @IBOutlet var exchangeUnit: UILabel!
        
    var bitCoin = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bitCoin.delegate = self
        userPick.dataSource = self
        userPick.delegate = self
    }
}

//Mark : UIPicker

extension ViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bitCoin.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return bitCoin.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        bitCoin.fetchData(for: bitCoin.currencyArray[row])
    }
}

//Mark : CoinManager

extension ViewController : BitCoinData {
    func getBitCoinData(data: BitCoinDataCollections) {
        DispatchQueue.main.async {
            let i = data.exchange()
            
            self.exchangeRate.text = String(format: "%.1f", data.rate[i].rate)
            self.exchangeUnit.text = data.currency
        }
    }
}

