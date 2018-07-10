//
//  FiltersViewController.swift
//  AnotherGetGoing
//
//  Created by Alla Bondarenko on 2018-06-27.
//  Copyright © 2018 Alla Bondarenko. All rights reserved.
//

import UIKit

enum RankBy {
    case prominence
    case distance
    
    func description() -> String {
        switch self {
        case .prominence: return "Prominence"
        case .distance: return "Distance"
        }
    }
}

struct FilterOptions {
    var switchIsOn: Bool?
    var radiusSelected: Float?
    var rankOption: String?
    var isChanged: Bool?
}

class FiltersViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
 

    @IBOutlet weak var openNowSwitch: UISwitch!
    
    @IBOutlet weak var rankByPicker: UIPickerView!
    
    @IBOutlet weak var rankByLabel: UILabel!
    
    
    @IBOutlet weak var radiusSlider: UISlider!
    
    var rankByDictionary: [RankBy] = [.prominence , .distance]
    var rankSelected: RankBy = .prominence
    
    var radiusSelected: Float?
    
    var filtersChanged: Bool? = false
    var filtersObject: FilterOptions?
    var delegate: FiltersServiceDelegate?
    var rankOptionSelected: String?
    var switchIsOpen: Bool?




    
    override func viewDidLoad() {
        super.viewDidLoad()

        rankByPicker.isHidden = true
        
        rankByLabel.text = rankSelected.description()
        rankByPicker.dataSource = self
        rankByPicker.delegate = self
        
        rankByLabel.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(togglePickerView))
        gestureRecognizer.numberOfTapsRequired = 2
        rankByLabel.addGestureRecognizer(gestureRecognizer)
        
        radiusSelected = radiusSlider.value
        switchIsOpen = openNowSwitch.isOn
        rankOptionSelected = rankByLabel.text
        
        filtersObject = FilterOptions(switchIsOn: switchIsOpen, radiusSelected: radiusSelected, rankOption: rankOptionSelected, isChanged: filtersChanged)

        
//        if filtersObject != nil {
//            radiusSlider.value = (filtersObject?.radiusSelected!)!
//            openNowSwitch.isOn = (filtersObject?.switchIsOn!)!
//            rankByLabel.text = (filtersObject?.rankOption!)!
//        }
        
        
    }
    
    @objc func togglePickerView(){
        rankByPicker.isHidden = !rankByPicker.isHidden
    }


    //MARK: - Button Actions
    
    @IBAction func cancelButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func applyButtonAction(_ sender: UIBarButtonItem) {
        if delegate != nil {
            filtersChanged = true
            filtersObject?.isChanged = filtersChanged
            delegate?.retrieveFilterParameters(controller: self, filters: filtersObject)
        } else {
            print("delegate is nil")
        }

    }
    
    
    @IBAction func openNowSelectionChange(_ sender: UISwitch) {
        print("switch is \(sender.isOn)")
        filtersObject?.switchIsOn = sender.isOn

    }
    
    @IBAction func radiusChanged(_ sender: UISlider) {
        print("radius is \(sender.value)")
        filtersObject?.radiusSelected = sender.value
    }
    
    
    @IBAction func resetButtonClicked(_ sender: UIButton) {
        resetFilters()
        delegate?.retrieveFilterParameters(controller: self, filters: filtersObject)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: - UIPickerView Data Source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return rankByDictionary.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return rankByDictionary[row].description()
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        rankSelected = rankByDictionary[row]
        rankByLabel.text = rankSelected.description()
    }
    
    func resetFilters() {
        radiusSlider.value = (radiusSelected as Float?)!
        openNowSwitch.isOn = (switchIsOpen as Bool?)!
        rankByLabel.text = rankOptionSelected as String?
        filtersChanged = false
        rankByPicker.isHidden = false
        
        filtersObject = FilterOptions(switchIsOn: switchIsOpen, radiusSelected: radiusSelected, rankOption: rankOptionSelected, isChanged: filtersChanged)
        delegate?.retrieveFilterParameters(controller: self, filters: filtersObject)
    }
    

}
