////
////  CountryViewModel.swift
////  Lucknow Super Giants
////
////  Created by Valentine Miranda on 22/02/23.
////
//
//import UIKit
//
//class CountryPickerView: UIPickerView {
//    init(countries: [Country], didSelectCompletion: ((Country?) -> ())?) {
//        super.init(frame: .zero)
//        let countryViewmodel = CountryViewModel(countries: countries, didSelectCompletion: didSelectCompletion)
//        self.delegate = countryViewmodel
//        self.dataSource = countryViewmodel
//    }
//    
//    public required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//}
//
//class CountryViewModel: NSObject {
//    private var countries: [Country] = [Country]()
//    private var didSelectCompletion: ((Country?) -> ())?
//    
//    init(countries: [Country], didSelectCompletion: ((Country?) -> ())?) {
//        super.init()
//        self.countries = countries
//        self.didSelectCompletion = didSelectCompletion
//    }
//}
//
//extension CountryViewModel: UIPickerViewDelegate, UIPickerViewDataSource {
//    
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return countries.count
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        let country = countries[row]
//        return "(\(country.phone_code ?? 0)) \(country.name ?? "N/A")"
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        let country = countries[row]
//        didSelectCompletion?(country)
//    }
//    
//    
//}
