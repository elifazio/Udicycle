//
//  NewCyclingActivityViewController.swift
//  Udicycle
//
//  Created by Elifazio Bernardes da Silva on 01/12/2017.
//  Copyright © 2017 Elifazio Bernardes da Silva. All rights reserved.
//

import UIKit

class NewCyclingActivityViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var activityDatePicker: UIDatePicker!
    @IBOutlet weak var distanceTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func closeKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func distanceStepper(_ sender: UIStepper) {
        if !(self.distanceTextField.text?.isEmpty)! {
            self.distanceTextField.text = "0"
        }
        
        self.distanceTextField.text = String(sender.value)
    }
    
    @IBAction func saveActivityTouch(_ sender: Any) {
        guard !(self.titleTextField.text?.isEmpty)! else {
            showAlertMessage(message: "O campo título é obrigatório")
            return
        }
        guard self.activityDatePicker.date < Date()
        else {
            showAlertMessage(message: "A data deve ser menor que a data atual")
            return
        }
        guard !self.distanceTextField.text!.isEmpty else {
            showAlertMessage(message: "A distância é obrigatória")
            return
        }
        
        let newAcitivity = CyclingActivity(title: self.titleTextField.text!, date: self.activityDatePicker.date, distance: Double(self.distanceTextField.text!)!, photoUrl: Randoms.randomImageUrl())
        
        UdicycleModel().saveActivity(newAcitivity)
        self.showAlertMessage(message: "Trilha incluída com sucesso!", title: "")
        self.titleTextField.text = String()
        self.activityDatePicker.date = Date()
        self.distanceTextField.text = String(0)
    }
    
    func showAlertMessage(message msg: String, title titl: String = "Algo de errado não está certo")  {
        let alert = UIAlertController(title: titl, message: msg, preferredStyle: .alert)
        
        let 🤮Action = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        let 👍Action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(👍Action)
        alert.addAction(🤮Action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
