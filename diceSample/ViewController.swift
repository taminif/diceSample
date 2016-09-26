//
//  ViewController.swift
//  diceSample
//
//  Created by 大島 on 2016/09/04.
//  Copyright © 2016年 taminif. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainImage: UIImageView!
    @IBOutlet var mainButton: UIButton!

    var isAnimationExec: Bool = false
    //var calcTime: UInt64 = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        var imageListArray :Array<UIImage> = []
        imageListArray.append(UIImage(named: "first")!)
        imageListArray.append(UIImage(named: "second")!)
        imageListArray.append(UIImage(named: "third")!)
        imageListArray.append(UIImage(named: "fourth")!)
        imageListArray.append(UIImage(named: "fifth")!)
        imageListArray.append(UIImage(named: "sixth")!)
        mainImage.animationImages = imageListArray
        // 0.24秒間隔
        mainImage.animationDuration = 0.24
        // 無限
        mainImage.animationRepeatCount = 0
        mainImage.image = UIImage(named: "one")

        mainButton.setTitle("Start!", for: UIControlState())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func mainButtonTapped(_ sender: AnyObject) {
        if isAnimationExec {
            // アニメーションを停止
            let random = arc4random_uniform(6)
            let diceValue = random + 1
            mainButton.setTitle("Start!", for: UIControlState())
            mainImage.stopAnimating()
            switch diceValue {
            case 1:
                mainImage.image = UIImage(named: "one")
            case 2:
                mainImage.image = UIImage(named: "two")
            case 3:
                mainImage.image = UIImage(named: "three")
            case 4:
                mainImage.image = UIImage(named: "four")
            case 5:
                mainImage.image = UIImage(named: "five")
            case 6:
                mainImage.image = UIImage(named: "six")
            default:
                mainImage.image = UIImage(named: "one")
            }
            isAnimationExec = false
        } else {
            // アニメーションを開始
            mainButton.setTitle("Stop!", for: UIControlState())
            mainImage.startAnimating()
            isAnimationExec = true
        }
    }

}

