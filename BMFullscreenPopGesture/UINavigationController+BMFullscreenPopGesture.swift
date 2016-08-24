
//
//  UINavigationController+BMFullscreenPopGesture.swift
//  SwiftDemo
//
//  Created by ___liangdahong on 16/8/24.
//  Copyright © 2016年 梁大红. All rights reserved.
//

import UIKit

private var kbm_fullscreenGestureRecognizer = 0
private var kbm_fullscreenPop = 0
private var kfullDelegate = 0
private var kbm_fullscreen = 0

extension UINavigationController {

    public func bm_fullGestureRecognizer() -> (UIGestureRecognizer) {
        var gestureRecognizer = objc_getAssociatedObject(self,  &kbm_fullscreenGestureRecognizer) as? UIGestureRecognizer
        if gestureRecognizer == nil {
            let tempGes = self.interactivePopGestureRecognizer
            tempGes?.enabled = false
            let _targets = tempGes?.valueForKey("_targets")
            let _target = _targets?.firstObject!!.valueForKey("target")
            let sel = NSSelectorFromString("handleNavigationTransition:")
            gestureRecognizer = UIPanGestureRecognizer.init(target: _target!, action: sel)
            tempGes!.view?.addGestureRecognizer(gestureRecognizer!)
            objc_setAssociatedObject(self,  &kbm_fullscreenGestureRecognizer, gestureRecognizer, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            gestureRecognizer?.delegate = self.bm_fullDelegate()
        }
        return gestureRecognizer!;
    }
    
    public func bm_fullscreenPop() -> (Bool) {
        if (objc_getAssociatedObject(self, &kbm_fullscreenPop) == nil) {
            return true;
        }
        return objc_getAssociatedObject(self, &kbm_fullscreenPop).boolValue
    }
    func bm_setFullscreenPop(fullscreenPop: Bool) -> () {
        objc_setAssociatedObject(self, &kbm_fullscreenPop, NSNumber.init(bool: fullscreenPop), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

    func bm_fullDelegate() -> (_BMFullDelegate) {
        var d = objc_getAssociatedObject(self, &kfullDelegate) as? _BMFullDelegate
        if d == nil {
            d = _BMFullDelegate();
            d?.navigationController = self;
            objc_setAssociatedObject(self, &kfullDelegate, d, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        return d!;
    }
}

extension UIViewController {

    public func bm_fullscreen() -> (Bool) {
        if (objc_getAssociatedObject(self, &kbm_fullscreen) == nil) {
            return true;
        }
        return objc_getAssociatedObject(self, &kbm_fullscreen).boolValue
    }
    func bm_setFullscreen(fullscreen: Bool) -> () {
        objc_setAssociatedObject(self, &kbm_fullscreen, NSNumber.init(bool: fullscreen), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}


class _BMFullDelegate: NSObject, UIGestureRecognizerDelegate {
    private weak var navigationController: UINavigationController?
    @objc internal func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        if self.navigationController?.bm_fullscreenPop() == false {
            return false
        }
        if self.navigationController?.viewControllers.last?.bm_fullscreen() == false {
            return false
        }
        if self.navigationController?.valueForKey("_isTransitioning")?.boolValue == true {
            return false
        }
        return true;
    }
}

extension UINavigationController {
    
    public override class func initialize() {
        struct Static {
            static var token: dispatch_once_t = 0
        }
        dispatch_once(&Static.token) {
            let m1 = class_getInstanceMethod(self, #selector(pushViewController))
            let m2 = class_getInstanceMethod(self, #selector(bm_pushViewController))
            
            let sel = class_addMethod(self, #selector(pushViewController), method_getImplementation(m2), method_getTypeEncoding(m2))
            if sel {
                class_replaceMethod(self, #selector(bm_pushViewController), method_getImplementation(m1), method_getTypeEncoding(m1))
            }else{
                method_exchangeImplementations(m1, m2)
            }
        }
    }
    @objc private func bm_pushViewController(viewController: UIViewController, animated: Bool) {
        self.bm_fullGestureRecognizer()
        if !self.viewControllers.contains(viewController) {
            self.bm_pushViewController(viewController, animated: animated)
        }
    }
}
