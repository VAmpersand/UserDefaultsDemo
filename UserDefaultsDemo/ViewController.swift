//
//  ViewController.swift
//  UserDefaultsDemo
//
//  Created by Viktor Prikolota on 07.03.2023.
//

import UIKit

class ViewController: UIViewController {

    private let lable = UILabel()
    private let textField = UITextField()
    private let button = UIButton()

    private let storage = StorageManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(lable)
        view.addSubview(textField)
        view.addSubview(button)

        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = storage.string(forKey: .textFiltdText) ?? "Have no data"

        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .blue.withAlphaComponent(0.2)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue.withAlphaComponent(0.5)
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        NSLayoutConstraint.activate([
            lable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lable.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),

            textField.topAnchor.constraint(equalTo: lable.bottomAnchor, constant: 20),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.widthAnchor.constraint(equalToConstant: 300),

            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
        ])
    }

    @IBAction
    func buttonAction() {
        if textField.hasText {
            print("Data saved")

            storage.set(textField.text, forKey: .textFiltdText)
            lable.text = textField.text
        }
    }
}
