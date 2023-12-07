//
//  ViewController.swift
//  segundaTelaCadastroCurso
//
//  Created by Jefferson Alves on 29/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var cadastroLabel:
    UILabel!
    @IBOutlet weak var nomeLabel:
    UILabel!
    @IBOutlet weak var emailLabel:
    UILabel!
    @IBOutlet weak var senhaLabel:
    UILabel!
    @IBOutlet weak var nomeTextField:
    UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var cadastrarButton:
    UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nomeTextField.keyboardType = .default
        emailTextField.keyboardType = .emailAddress
        passwordTextField.isSecureTextEntry = true
        passwordTextField.keyboardType = .default
        cadastrarButton.isEnabled = false
        
        nomeTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // Para organizacao do codigo
    //IBAction sempre a baixo  da override func viewDidLoad
    
    @IBAction func tappedCadastroButton(_ sender: Any) {
        self.validateTextField()
        print(nomeTextField.text ?? "")
        print(emailTextField.text ?? "")
        print(passwordTextField.text ?? "")
        print("Button dentro dos conformes")
        
    }
    
    func validateTextField(){
        if nomeTextField.text != "" && emailTextField.text != "" && passwordTextField.text != "" {
            
            cadastrarButton.isEnabled = true
        }else{
            cadastrarButton.isEnabled = false
            print("EPPAA deu ruim hein preenche novamente")
        
        }
    }
}
extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        textField.layer.borderColor = UIColor.blue.cgColor
        textField.layer.borderWidth = 1
        self.validateTextField()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.borderWidth = 0
        self.validateTextField()
        print(#function)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        textField.resignFirstResponder()
        return true
    }
}
