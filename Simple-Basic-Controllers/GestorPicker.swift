//
//  GestorPicker.swift
//  Simple-Basic-Controllers
//
//  Created by Máster Móviles on 01/11/2019.
//  Copyright © 2019 Máster Móviles. All rights reserved.
//

import UIKit

class GestorPicker: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    var list = ["Saturno", "M50", "Julialand", "Nebulosa nebulosada"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Fila seleccionada: \(row), dato: \(list[row])")
    }
}
