//
//  HomePage.swift
//  TwilioSms
//
//  Created by Jade Meyer on 9/1/18.
//  Copyright © 2018 Twilio. All rights reserved.
//

import UIKit
import MessageUI

class HomePage: UIViewController, MFMessageComposeViewControllerDelegate  {
    
    @IBOutlet weak var helpLbl: UILabel!
     @IBOutlet weak var helpBtn: UIButton!
    
    @IBAction func namePressed(_ sender: Any) {
        helpLbl.isHidden = false
        helpBtn.isHidden = false
        distanceLbl.isHidden = false
        actualHelpBtn.isHidden = false
    }
    @IBOutlet weak var actualHelpBtn: UIButton!
    
    @IBOutlet weak var distanceLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helpLbl.isHidden = true
        helpBtn.isHidden = true
        distanceLbl.isHidden = true
        actualHelpBtn.isHidden = true
        // Do any additional setup after loading the view.
    }
    
   
    
    @IBAction func helpBtnPressed(_ sender: AnyObject) {
        
        self.performSegue(withIdentifier: "viewControllerSegue", sender: AnyObject.self)
        
        
        
        /* let functionURL = "https://flax-bird-4242.twil.io/alert"
         if let url = URL(string: functionURL) {
         let task = URLSession.shared.dataTask(with: url) {
         data, response, error in
         if error != nil {
         print(error!)
         } else {
         if let responseString = String(data: data!, encoding: .utf8) {
         print(responseString)
         }
         }
         }
         task.resume()
         }*/
    }
    
    @IBAction func displayMessageInterface() {
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        
        // Configure the fields of the interface.
        composeVC.recipients = ["9176352382"]
        composeVC.body = "Sent from Anna Li, 500 ft away."
        
        // Present the view controller modally.
        if MFMessageComposeViewController.canSendText() {
            self.present(composeVC, animated: true, completion: nil)
            //self.messageComposeViewController(composeVC, didFinishWith: MessageComposeResult.sent)
        } else {
            print("Can't send messages.")
        }
    }
    
    /*func messageComposeViewController(controller: MFMessageComposeViewController!, didFinishWithResult result: MessageComposeResult) {
        
        switch result {
        case .cancelled:
            NSLog("cancelled")
        case .failed:
            NSLog("cancelled")
        case .sent:
            NSLog("cancelled")
        default:
            NSLog("default...")
        }
        self.dismiss(animated: true, completion: nil)
    }*/
    
    public func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
        switch result {
        case .cancelled :
            break;
        case .sent :
            break;
        case .failed :
            break;
        }
        
        controller.dismiss(animated: true, completion: nil)
    }
    
    /*public enum MessageComposeResult : Int {
        
        case cancelled
        
        case sent
        
        case failed
    }*/
    
    @IBAction func sendMessageButtonAction(_ sender: Any) {
        displayMessageInterface()
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */
