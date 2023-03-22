//
//  homeVC.swift
//  Ryukoyu Yakala
//
//  Created by Mehmet Emin DERECİ on 5.08.2022.
//

import UIKit

class homeVC: UIViewController {
    
    var selectedHeroHome : String = ""

    @IBOutlet weak var imageRyuko: UIImageView!
    @IBOutlet weak var imageSatsuki: UIImageView!
    @IBOutlet weak var imageMako: UIImageView!
    @IBOutlet weak var imageNonon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageSatsuki.isUserInteractionEnabled = true
        imageRyuko.isUserInteractionEnabled = true
        imageMako.isUserInteractionEnabled = true
        imageNonon.isUserInteractionEnabled = true
        
        let ryukoRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeHeroRyuko))
        let satsukiRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeHeroSatsuki))
        let makoRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeHeroMako))
        let nononRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeHeroNonon))
        
        imageRyuko.addGestureRecognizer(ryukoRecognizer)
        imageSatsuki.addGestureRecognizer(satsukiRecognizer)
        imageMako.addGestureRecognizer(makoRecognizer)
        imageNonon.addGestureRecognizer(nononRecognizer)


        
    }


    @IBAction func readyBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "toGame", sender: nil)
    }
    
    
    
    
   
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGame"{
            let destinationVC = segue.destination as! ViewController
            destinationVC.selectedHero = self.selectedHeroHome
            
        }
    }

    @objc func changeHeroRyuko(){
       selectedHeroHome = "ryuko"
        imageRyuko.image = UIImage(named: "ryukoSelect")
        imageSatsuki.image = UIImage(named: "satsuki")
        imageMako.image = UIImage(named: "mako")
        imageNonon.image = UIImage(named: "nonon")
    }
    @objc func changeHeroSatsuki(){
       selectedHeroHome = "satsuki"
        imageRyuko.image = UIImage(named: "ryuko")
        imageSatsuki.image = UIImage(named: "satsukiSelect")
        imageMako.image = UIImage(named: "mako")
        imageNonon.image = UIImage(named: "nonon")
    }
    @objc func changeHeroMako(){
       selectedHeroHome = "mako"
        imageRyuko.image = UIImage(named: "ryuko")
        imageSatsuki.image = UIImage(named: "satsuki")
        imageMako.image = UIImage(named: "makoSelect")
        imageNonon.image = UIImage(named: "nonon")
    }
    @objc func changeHeroNonon(){
       selectedHeroHome = "nonon"
        imageRyuko.image = UIImage(named: "ryuko")
        imageSatsuki.image = UIImage(named: "satsuki")
        imageMako.image = UIImage(named: "mako")
        imageNonon.image = UIImage(named: "nononSelect")
    }
}
