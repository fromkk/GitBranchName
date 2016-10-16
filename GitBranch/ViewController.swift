//
//  ViewController.swift
//  GitBranch
//
//  Created by Ueoka Kazuya on 2016/10/16.
//  Copyright © 2016年 Fromkk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var branchNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.branchNameLabel.text = Branch.current
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

