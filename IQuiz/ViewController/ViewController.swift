//
//  ViewController.swift
//  IQuiz
//
//  Created by Thales J Colovini on 20/12/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ButtonPlay: UIButton!

    @IBAction func ButtonPressed(_ sender: Any) {
        print("Botao pressionado")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configLayout()
    }

    func configLayout() {
        navigationItem.hidesBackButton = true
        ButtonPlay.layer.cornerRadius = 12.0
    }
}

