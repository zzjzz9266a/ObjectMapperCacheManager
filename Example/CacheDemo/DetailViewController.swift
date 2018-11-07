//
//  DetailViewController.swift
//  CacheDemo
//
//  Created by zhangzhijie on 2018/11/7.
//  Copyright © 2018 zhangzhijie. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    static var nib: DetailViewController {
        return UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
    }
    
    static func showDetail(text: String?, from: UIViewController) {
        let detailVC = nib
        detailVC.text = text
        from.show(detailVC, sender: from)
    }
    
    var text: String?
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = text
    }
}
