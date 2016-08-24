//
//  ViewController.swift
//  BMFullscreenPopGestureDemo
//
//  Created by ___liangdahong on 16/8/24.
//  Copyright © 2016年 https://github.com/asiosldh/. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cancelAllButton: UIButton!
    @IBOutlet weak var cancelVCButton: UIButton!

    @IBAction func cancelAll(sender: AnyObject) {
        self.navigationController?.bm_setFullscreenPop(!(self.navigationController?.bm_fullscreenPop())!)
        if self.navigationController?.bm_fullscreenPop() == true {
            self.cancelAllButton.setTitle("关闭此控制器所在的导航控制器的侧滑返回功能", forState: .Normal)
        }else{
            self.cancelAllButton.setTitle("开启此控制器所在的导航控制器的侧滑返回功能", forState: .Normal)
        }
    }

    @IBAction func cancelVC(sender: AnyObject) {
        self.bm_setFullscreen(!self.bm_fullscreen())
        if self.bm_fullscreen() == true {
            self.cancelVCButton.setTitle("开启此控制器的侧滑返回功能", forState: .Normal)
        }else{
            self.cancelVCButton.setTitle("关闭此控制器的侧滑返回功能", forState: .Normal)
        }
    }
}

