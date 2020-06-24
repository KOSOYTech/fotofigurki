//
//  ViewController.swift
//  FotoFigurkiRu
//
//  Created by Maxim Kosoy on 08.03.2020.
//  Copyright © 2020 Maxim Kosoy. All rights reserved.
//

// Подключаем основную библиотеку UI от Apple
import UIKit

// Подключаем библиотеку Image Picker от Hyperoslo
import ImagePicker

// Добавляем класс ImagePickerDelegate из библиотеки ImagePicker
class ViewController: UIViewController, ImagePickerDelegate {
    
    // Указываем, что необходимо сделать, когда пользователь нажмет куда-нибудь при выборе фото
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        <#code#>
    }
    
    // Указываем, что необходимо сделать, когда пользователь выбрал фото и нажал кнопку
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        <#code#>
    }
    
    // Указываем, что необходмо сделать, когда пользователь нажал кнопку выхода
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        <#code#>
    }

    // Инициализация полей ввода и кнопки отправки заказа
    @IBOutlet weak var kakObr: UITextField!
    @IBOutlet weak var kakSvyaz: UITextField!
    @IBAction func makeOrder(_ sender: UIButton) {
        
        // Отправка данных на сервер
        let url = URL(string: "https://fotofigurki.ru/appsend.php")!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        components.queryItems = [
            URLQueryItem(name: "name", value: kakObr.text!),
            URLQueryItem(name: "svyaz", value: kakSvyaz.text!)
        ]
        let query = components.url!.query
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = Data(query!.utf8)
        
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
         
                // Convert HTTP Response Data to a String
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("Response data string:\n \(dataString)")
                }
        }
        task.resume()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
 
    }


}
