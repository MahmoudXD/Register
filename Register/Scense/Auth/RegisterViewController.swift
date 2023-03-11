//
//  RegisterViewController.swift
//  Register
//
//  Created by Mahmoud Sherbeny on 11/03/2023.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtFullname: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtCountry: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var lblTerm: UILabel!
    @IBOutlet weak var btnChangeLanguage: UIButton!
    
    var toolBar = UIToolbar()
    var picker  = UIPickerView()
    let viewModel = RegisterViewModel()
    var isCountry = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    @IBAction func didTappedCountry(_ sender: UIButton) {
        isCountry = true
        picker = UIPickerView.init()
        picker.delegate = self
        picker.dataSource = self
        picker.backgroundColor = DesignSystem.Colors.primary.color
        picker.setValue(DesignSystem.Colors.white.color, forKey: "textColor")
        picker.autoresizingMask = .flexibleWidth
        picker.contentMode = .center
        picker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(picker)
        
        toolBar = UIToolbar.init(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        toolBar.barStyle = .default
        toolBar.items = [UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(onDoneButtonTapped))]
        self.view.addSubview(toolBar)
    }
    
    @IBAction func didTappedCity(_ sender: UIButton) {
        isCountry = false
        self.viewModel.fetchCities()
        if self.viewModel.countryId != -1 {
            self.view.addSubview(picker)
            
            toolBar = UIToolbar.init(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
            toolBar.barStyle = .default
            toolBar.items = [UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(onDoneButtonTapped))]
            self.view.addSubview(toolBar)
            self.picker.reloadAllComponents()
        }
    }
    
    @IBAction func didTappedChnageLang(_ sender: UIButton) {
        Language.shared.set(language: "lang".localized == "en" ? .ar : .en)
        kSharedAppDelegate?.setupIntialVC()
    }
    
}

extension RegisterViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func setup() {
        self.setupUI()
        self.viewModel.viewDidLoad()
    }
    
    private func setupUI() {
        self.lblTitle.text = "REGISTER".localized
        self.txtFullname.placeholder = "Full Name".localized
        self.txtPassword.placeholder = "Password".localized
        self.txtEmail.placeholder = "Email".localized
        self.txtCountry.placeholder = "Country".localized
        self.txtCity.placeholder = "City".localized
        self.lblTerm.text = "By clicking register you agree to Terms and Conditions".localized
        self.btnChangeLanguage.setTitle("Change Lanquage".localized, for: .normal)
        self.lblTerm.setActivePart(orignalText: "By clicking register you agree to Terms and Conditions".localized, hyberText: ["Terms and Conditions".localized], hyberTextColor: [DesignSystem.Colors.primary.color], hyberTextFont: [DesignSystem.TypoGraphy.subTitle.font])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTappedTerms))
        self.lblTerm.addGestureRecognizer(tap)
    }
    
    @objc
    func didTappedTerms() {
        let webViewController = WebViewController()
        self.present(webViewController, animated: true)
    }
    
    @objc func onDoneButtonTapped() {
        toolBar.removeFromSuperview()
        picker.removeFromSuperview()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return isCountry ? self.viewModel.numberOfCountry : self.viewModel.numberOfCities
    }
        
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let title = self.viewModel.getTitle(raw: row, isCountry: isCountry)
        return title
    }
        
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let title = self.viewModel.didTapped(row: row, isCountry: isCountry)
        if isCountry {
            self.txtCountry.text = title
            self.txtCity.text?.removeAll()
        } else {
            self.txtCity.text = title
        }
    }
}
