//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by ad1 on 17.05.2022.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController, UISplitViewControllerDelegate {
    @IBAction func changeTheme(_ sender: Any) {
          if let cvc = splitViewDetailConcentrationViewController {
              if let themeName = (sender as? UIButton)?.titleLabel?.text, let theme = themes[themeName] {
                  cvc.theme = theme
              }
          } else if let cvc = lastSeguedToConcentrationViewController {
              if let themeName = (sender as? UIButton)?.titleLabel?.text, let theme = themes[themeName] {
                  cvc.theme = theme
              }
              navigationController?.pushViewController(cvc, animated: true)
          } else {
              performSegue(withIdentifier: "Choose Theme", sender: sender)
          }
      }
      
      private var splitViewDetailConcentrationViewController: ViewController? {
          return splitViewController?.viewControllers.last as? ViewController
      }
      
      private var lastSeguedToConcentrationViewController: ViewController?
      
      let themes = [
          "Sports": "⚽️🏀🏈⚾️🎾🏐🏉🎱🏓⛷🎳⛳️",
          "Animals": "🐶🦆🐹🐸🐘🦍🐓🐩🐦🦋🐙🐏",
          "Faces": "😀😌😎🤓😠😤😭😰😱😳😜😇"
      ]

      // MARK: - Navigation

    override func awakeFromNib() {
           super.awakeFromNib()
           splitViewController?.delegate = self
       }
       
       
       func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
           if let cvc = secondaryViewController as? ViewController {
               if cvc.theme == nil {
                   return true
               }
           }
           return false
       }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as? UIButton)?.titleLabel?.text, let theme = themes[themeName] {
                        if let cvc = segue.destination as? ViewController {
                            cvc.theme = theme
                            lastSeguedToConcentrationViewController = cvc
                        }
                    }
                }
    }
    

}
