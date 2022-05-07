//
//  ViewController.swift
//  CalcIMC
//
//  Created by Leonardo Henrique Barrocal on 04/05/22.
//

import UIKit

class ViewController: UIViewController {
  
  
  @IBOutlet weak var weightTextField: UITextField!
  @IBOutlet weak var heightTextField: UITextField!
  @IBOutlet weak var typeIMCLabel: UILabel!
  @IBOutlet weak var imageImageView: UIImageView!
  @IBOutlet weak var resultView: UIView!
  
  var imcResult: Double = 0
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
  }
  
  @IBAction func tappedCalculateButton(_ sender: Any) {
    
    if let weight = Double(weightTextField.text!), let height = Double(heightTextField.text!){
      imcResult = weight / pow(height, 2)
      showResult()
      
    }
  }
  
  func showResult(){
    var result: String = ""
    var imageView: String = ""
    
    switch imcResult {
      case 0..<16:
        result = "Magreza"
        imageView = "abaixo"
      case 16..<18.5:
        result = "Abaixo do peso"
        imageView = "abaixo"
      case 18.5..<25:
        result = "Peso ideal"
        imageView = "ideal"
      case 25..<30:
        result = "Sobrepeso"
        imageView = "sobre"
      default:
        result = "Obesidade"
        imageView = "obesidade"
    }
    typeIMCLabel.text = "\(imcResult.rounded()): \(result)"
    imageImageView.image = UIImage(named: imageView)
    resultView.isHidden = false
    view.endEditing(true) // forca o app a nao ter mais foco ao clica fora de campos que podem ser focados
  }
  
}


