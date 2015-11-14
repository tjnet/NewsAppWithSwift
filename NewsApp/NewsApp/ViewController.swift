//
//  ViewController.swift
//  NewsApp
//
//  Created by TanakaJun on 2015/11/13.
//  Copyright © 2015年 edu.self. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var pageMenu : CAPSPageMenu?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // MARK: - UI Setup
        self.title = "Dev News"
        self.navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.grayColor()]
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // Array to keep track of controllers in page menu
        var controllerArray : [UIViewController] = []
        
        // Create variables for all view controllers you want to put in the
        // page menu, initialize them, and add each to the controller array.
        // (Can be any UIViewController subclass)
        // Make sure the title property of all view controllers is set
        // Example:
        var controller1 : UIViewController = UIViewController(nibName: "TableViewController", bundle: nil)
        controller1.title = "iOS"
        controllerArray.append(controller1)
        
        var controller2 : UIViewController = UIViewController(nibName: "TableViewController", bundle: nil)
        controller2.title = "Rails"
        controllerArray.append(controller2)
        
        var controller3 : UIViewController = UIViewController(nibName: "TableViewController", bundle: nil)
        controller3.title = "AWS"
        controllerArray.append(controller3)
        
        var controller4 : UIViewController = UIViewController(nibName: "TableViewController", bundle: nil)
        controller4.title = "Linux"
        controllerArray.append(controller4)
        
        // Customize page menu to your liking (optional) or use default settings by sending nil for 'options' in the init
        // Example:
        var parameters: [CAPSPageMenuOption] = [
            .ScrollMenuBackgroundColor(UIColor.whiteColor()),
            .SelectionIndicatorColor(UIColor.clearColor()),
            .ViewBackgroundColor(UIColor.whiteColor()),
            .MenuItemFont(UIFont(name: "HelveticaNeue-Bold", size: 16.0)!),
            .MenuHeight(30.0),
            .MenuMargin(0),
            .MenuItemWidth(120),
            .CenterMenuItems(true)
        ]
        
        // Initialize page menu with controller array, frame, and optional parameters
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        
        
        self.addChildViewController(pageMenu!)
        self.view.addSubview(pageMenu!.view)
        
        pageMenu!.didMoveToParentViewController(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

