//
//  ViewController.swift
//  Simple-Basic-Controllers
//
//  Created by Máster Móviles on 31/10/2019.
//  Copyright © 2019 Máster Móviles. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //MARK: Properties
    let gestorPicker = GestorPicker()
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textAppendedTasks: UITextView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var valueSlider: UILabel!
    @IBOutlet weak var stateSwitch: UISwitch!
    @IBOutlet weak var emergencyButton: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
        self.slider.minimumValue = 0
        self.slider.maximumValue = 100
        self.valueSlider.text = "\(Int(self.slider.value))"
        self.pickerView.delegate = self.gestorPicker
        self.pickerView.dataSource = self.gestorPicker
    }
    
    //MARK: Functions
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = self.textField.text {
            self.textAppendedTasks.text += text + "\n"
        }
        
        self.textField.text = ""
        
        self.textField.resignFirstResponder()
        return true
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        self.valueSlider.text = "\(Int(self.slider.value))"
    }
    
    @IBAction func showEmergencyAlert(_ sender: Any) {
        let alert = UIAlertController(title: "Emergencia", message: "Elige una opción", preferredStyle: .actionSheet)
        
        let opt1 = UIAlertAction(title: "Nave salvavidas", style: .default) {
            action in
            print("Preparando la nave salvavidas...")
        }
        let opt2 = UIAlertAction(title: "Hiperespacio", style: .default) {
            action in
            print("Lanzamiento al hiperespacio...")
        }
        let opt3 = UIAlertAction(title: "Autodestrucción", style: .destructive){
            action in
            print("Comenzando la autodestrucción de la nave...")
        }
        
        alert.addAction(opt1)
        alert.addAction(opt2)
        alert.addAction(opt3)
        
        self.present(alert, animated: true) {
            print("Quitando alert")
        }
    }
    
    @IBAction func switchClicked(_ sender: Any) {
        if self.stateSwitch.isOn {
            self.emergencyButton.isEnabled = true
        } else {
            self.emergencyButton.isEnabled = false
        }
    }
}

