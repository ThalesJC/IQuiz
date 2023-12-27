//
//  DesempenhoViewController.swift
//  IQuiz
//
//  Created by Thales J Colovini on 27/12/23.
//

import UIKit

class DesempenhoViewController: UIViewController {
    var pontuacao: Int?
    
    @IBOutlet weak var resultadoLabel: UILabel!
    @IBOutlet weak var percentualLabel: UILabel!
    
    @IBOutlet weak var botaoReiniciarQuiz: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configLayout()
        configDesempenho()
    }
    func configLayout() {
        navigationItem.hidesBackButton = true
        botaoReiniciarQuiz.layer.cornerRadius = 12.0
    }
    
    func configDesempenho() {
        guard let pontuacao = pontuacao else { return }
        resultadoLabel.text = "Voce acertou \(pontuacao) de \(questoes.count) questoes"
        let percentual = (pontuacao * 100) / questoes.count
        percentualLabel.text = "Percentual final: \(percentual)%"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
