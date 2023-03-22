
import UIKit

class ViewController: UIViewController {
    
   
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var ryuko1: UIImageView!
    @IBOutlet weak var ryuko2: UIImageView!
    @IBOutlet weak var ryuko3: UIImageView!
    @IBOutlet weak var ryuko4: UIImageView!
    @IBOutlet weak var ryuko5: UIImageView!
    @IBOutlet weak var ryuko6: UIImageView!
    @IBOutlet weak var ryuko7: UIImageView!
    @IBOutlet weak var ryuko8: UIImageView!
    @IBOutlet weak var ryuko9: UIImageView!
    @IBOutlet weak var highscoreLabel: UILabel!
    
    var score = 0
    var timer = Timer()
    var counter = 0
    var ryukoArray = [UIImageView]()
    var hideTimer = Timer()
    var highScore = 0
    var selectedHero : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedHero)
        
        if selectedHero == "ryuko"{
            ryuko1.image = UIImage(named: "ryuko")
            ryuko2.image = UIImage(named: "ryuko")
            ryuko3.image = UIImage(named: "ryuko")
            ryuko4.image = UIImage(named: "ryuko")
            ryuko5.image = UIImage(named: "ryuko")
            ryuko6.image = UIImage(named: "ryuko")
            ryuko7.image = UIImage(named: "ryuko")
            ryuko8.image = UIImage(named: "ryuko")
            ryuko9.image = UIImage(named: "ryuko")
            
            
        }
        if selectedHero == "satsuki"{
            ryuko1.image = UIImage(named: "satsuki")
            ryuko2.image = UIImage(named: "satsuki")
            ryuko3.image = UIImage(named: "satsuki")
            ryuko4.image = UIImage(named: "satsuki")
            ryuko5.image = UIImage(named: "satsuki")
            ryuko6.image = UIImage(named: "satsuki")
            ryuko7.image = UIImage(named: "satsuki")
            ryuko8.image = UIImage(named: "satsuki")
            ryuko9.image = UIImage(named: "satsuki")
            
        }
        if selectedHero == "mako"{
            ryuko1.image = UIImage(named: "mako")
            ryuko2.image = UIImage(named: "mako")
            ryuko3.image = UIImage(named: "mako")
            ryuko4.image = UIImage(named: "mako")
            ryuko5.image = UIImage(named: "mako")
            ryuko6.image = UIImage(named: "mako")
            ryuko7.image = UIImage(named: "mako")
            ryuko8.image = UIImage(named: "mako")
            ryuko9.image = UIImage(named: "mako")
            
        }
        if selectedHero == "nonon"{
            ryuko1.image = UIImage(named: "nonon")
            ryuko2.image = UIImage(named: "nonon")
            ryuko3.image = UIImage(named: "nonon")
            ryuko4.image = UIImage(named: "nonon")
            ryuko5.image = UIImage(named: "nonon")
            ryuko6.image = UIImage(named: "nonon")
            ryuko7.image = UIImage(named: "nonon")
            ryuko8.image = UIImage(named: "nonon")
            ryuko9.image = UIImage(named: "nonon")
            
        }
        
        
        //highscore check
        
        let storedHighScore = UserDefaults.standard.object(forKey: "highscore")
        
        if storedHighScore == nil {
            highScore = 0
            highscoreLabel.text = "Highscore: \(highScore)"
        
        }
        if let newScore = storedHighScore as? Int{
            highScore = newScore
            highscoreLabel.text = "Highscore: \(highScore)"
        }
            
            
        scoreLabel.text = "Score: \(score)"
        
        ryuko1.isUserInteractionEnabled = true
        ryuko2.isUserInteractionEnabled = true
        ryuko3.isUserInteractionEnabled = true
        ryuko4.isUserInteractionEnabled = true
        ryuko5.isUserInteractionEnabled = true
        ryuko6.isUserInteractionEnabled = true
        ryuko7.isUserInteractionEnabled = true
        ryuko8.isUserInteractionEnabled = true
        ryuko9.isUserInteractionEnabled = true
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        ryuko1.addGestureRecognizer(recognizer1)
        ryuko2.addGestureRecognizer(recognizer2)
        ryuko3.addGestureRecognizer(recognizer3)
        ryuko4.addGestureRecognizer(recognizer4)
        ryuko5.addGestureRecognizer(recognizer5)
        ryuko6.addGestureRecognizer(recognizer6)
        ryuko7.addGestureRecognizer(recognizer7)
        ryuko8.addGestureRecognizer(recognizer8)
        ryuko9.addGestureRecognizer(recognizer9)
        
        
        ryukoArray = [ryuko1,ryuko2,ryuko3,ryuko4,ryuko5,ryuko6,ryuko7,ryuko8,ryuko9]
        
        //Timer
        
        counter = 10
        timeLabel.text = String(counter)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideRyuko), userInfo: nil, repeats: true)
        
        hideRyuko()
        
    }
    
   @objc func hideRyuko(){
        for ryuko in ryukoArray {
            ryuko.isHidden = true
            
        }
       let random = Int(arc4random_uniform(UInt32(ryukoArray.count - 1)))
        ryukoArray[random].isHidden = false
    }
    
    @objc func increaseScore(){
        score += 1
        scoreLabel.text = "Score:\(score)"
    }
    @objc func countDown(){
        counter -= 1
        timeLabel.text = String(counter)
        
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            
            for ryuko in ryukoArray {
                ryuko.isHidden = true
            }
            
            
            // Highscore Save
            
            if self.score > self.highScore{
                self.highScore = self.score
                highscoreLabel.text = "Highscore: \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highscore")            }
            
            
            let alert = UIAlertController(title: "Times up", message: "Do you wand to play again?", preferredStyle: UIAlertController.Style.alert)
            let okeyBtn = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            let replayBtn = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { [self] UIAlertAction in
                
                //replay func
                
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 10
                self.timeLabel.text = String(self.counter)
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideRyuko), userInfo: nil, repeats: true)
                
            }
            alert.addAction(okeyBtn)
            alert.addAction(replayBtn)
            
            self.present(alert, animated: true, completion: nil)
        }
        }
    }
