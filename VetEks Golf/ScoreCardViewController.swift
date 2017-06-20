//
//  ScoreCardViewController.swift
//  VetEks Golf
//
//  Created by Duane Jordaan on 2017/06/19.
//  Copyright © 2017 Duane Jordaan. All rights reserved.
//

import UIKit

class ScoreCardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            super.viewDidLoad()
            
            //do any additional setup after loading the view
            ScoreCardImageView.image = UIImage(named: scorecard.image)
            title = scorecard.name
        
            

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    @IBOutlet var ScoreCardImageView:UIImageView!
    //var scoreCardImage = ""
    
    var scorecard:Scorecard!

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
