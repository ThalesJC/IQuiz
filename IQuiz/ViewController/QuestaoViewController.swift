//
//  QuestaoViewController.swift
//  IQuiz
//
//  Created by Thales J Colovini on 20/12/23.
//

import UIKit

extension UIColor {
    static var corDeFundoVerde = UIColor(red: 11/255, green: 161/255, blue: 53/255, alpha: 1.0)
    static var corDeFundoVermelho = UIColor(red: 211/255, green: 17/255, blue: 17/255, alpha: 1.0)
}

class QuestaoViewController: UIViewController {
    var pontuacao = 0
    var numeroQuestao = 0

    @IBOutlet weak var tituloQuestaoLabel: UILabel!
    @IBOutlet var BotoesRespostas: [UIButton]!
    
    @IBAction func respostaBotaoPressionado(_ sender: UIButton) {
        let acertou = questoes[numeroQuestao].respostaCorreta == sender.tag
        if acertou {
            pontuacao += 1
            sender.backgroundColor = UIColor.corDeFundoVerde
            print("acertou")
        } else {
            sender.backgroundColor = UIColor.corDeFundoVermelho
            print("errou")
        }
        if numeroQuestao < questoes.count - 1 {
            numeroQuestao += 1
            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(configQuestao), userInfo: nil, repeats: false)
        } else {
            navegaTelaDesempenho()
        }
       
    }
    
    func navegaTelaDesempenho() {
        performSegue(withIdentifier: "navegaPraDesempenho", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configLayout()
        configQuestao()
    }
    
    func configLayout(){
        navigationItem.hidesBackButton = true
        tituloQuestaoLabel.numberOfLines = 0
        tituloQuestaoLabel.textAlignment = .center
        for botao in BotoesRespostas {
            botao.layer.cornerRadius = 12.0
        }
    }
    
    @objc func configQuestao() {
        tituloQuestaoLabel.text = questoes[numeroQuestao].titulo
        for botao in BotoesRespostas {
            let tituloBotao = questoes[numeroQuestao].respostas[botao.tag]
            botao.setTitle(tituloBotao, for: .normal)
            botao.backgroundColor = UIColor(red: 116/255, green: 50/255, blue: 255/255, alpha: 1.0)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let desempenhoVC = segue.destination as? DesempenhoViewController
        else {return}
        desempenhoVC.pontuacao = pontuacao
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
