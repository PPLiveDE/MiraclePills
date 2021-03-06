//
//  ViewController.swift
//  MiraclePills
//
//  Created by Ertugrul Altun on 23.02.17.
//  Copyright © 2017 Ertugrul Altun. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var statePickerBtn: UIButton!
    @IBOutlet weak var buyBtn: UIButton!
    @IBOutlet weak var succesView: UIImageView!
    @IBOutlet weak var blankView: UIView!
    
    let states = ["Alaska", "Arkansas", "Alabama", "California", "Maine", "New York"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func stateBtnPressed(_ sender: Any) {
        statePicker.isHidden = false
        buyBtn.isHidden = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePickerBtn.setTitle(states[row], for: UIControlState.normal)
        statePicker.isHidden = true
        buyBtn.isHidden = false
    }
    
    @IBAction func buyBtnPressed(_ sender: Any) {
        blankView.isHidden = false
        succesView.isHidden = false
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) {_ in
            self.blankView.isHidden = true
            self.succesView.isHidden = true
        }
    }
    

    
}

