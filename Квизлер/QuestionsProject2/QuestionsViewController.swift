import UIKit

class QuestionsViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Отвечает, когда пользователь нажимает кнопки Правда или Ложь, главная и единственная кнопка
    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1 {
            pickedAnswer = true
        }
            
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        
        questionNumber = questionNumber + 1
        
        updateUI()
        
    }
    
    // Апдейт всего
    func updateUI() {
        
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber)
        
        progressLabel.text = String(questionNumber) + "/13"
        
        scoreLabel.text = "Очки: " + String(score)
        
        nextQuestion()
    }
    
    
    func nextQuestion() {
        
        if questionNumber <= 12 {
            questionLabel.text = allQuestions.list[questionNumber].questionText
        }
        else {
            let alert = UIAlertController(title: "Замечательно", message: "Вопросы закончились. Твой балл \(score) Повторим?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Рестарт", style: .default, handler: { UIAlertAction in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer {
            
            ProgressHUD.showSuccess("В точку")
            
            score = score + 1
        }
        else {
            
            ProgressHUD.showError("Ошибочка")
        }
    }
    
    func startOver() {
        
        questionNumber = 0
        score = 0
        
        updateUI()
        
    }
    
    
} 
