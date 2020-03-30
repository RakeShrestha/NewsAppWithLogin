//
//  MainPageViewController.swift
//  NewsDemoApp
//
//  Created by RakeSanzzy Shrestha on 3/29/20.
//  Copyright © 2020 SelfProject. All rights reserved.
//

import UIKit

class MainPageViewController: UIPageViewController, UIPageViewControllerDelegate {

    
    var orderedViewControllers: [UIViewController] = [UIViewController]()
    
    var pagesToShow: [PagesToShow] = PagesToShow.pagesToShow()
    
    var currentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
        dataSource = nil
        
       
        
        for pageToShow in pagesToShow {
            
            let page = newViewController(pageToShow: pageToShow)
            
            orderedViewControllers.append(page)
            
        }
        
        if let firstViewController = orderedViewControllers.first {
            
            setViewControllers([firstViewController], direction: UIPageViewController.NavigationDirection.forward, animated: true, completion: nil)
            
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(MainPageViewController.newPage(notification:)), name: NSNotification.Name(rawValue: "newPage"), object: nil)
        
    }
    
  
    
    @objc func newPage(notification: NSNotification) {
        
        if let recievedObject = notification.object as? PagesToShow {
            
            showViewController(index: recievedObject.rawValue)
            
        }
        
    }
    
    private func newViewController(pageToShow: PagesToShow) -> UIViewController {
        
        var viewController: UIViewController!
        
        let newRegisterLoginStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        switch pageToShow {
            
        case .login:
            
            viewController = newRegisterLoginStoryboard.instantiateViewController(withIdentifier: pageToShow.identifier) as! LoginViewController
            
        case .register:
            
            viewController = newRegisterLoginStoryboard.instantiateViewController(withIdentifier: pageToShow.identifier) as! RegisterViewController
            
        }
        
        return viewController
        
    }

    
    func showViewController(index: Int){
        
        if currentIndex > index{
            
            setViewControllers([orderedViewControllers[index]], direction: UIPageViewController.NavigationDirection.reverse, animated: true, completion: nil)
            
        }
        
        else if currentIndex < index{
            
             setViewControllers([orderedViewControllers[index]], direction: UIPageViewController.NavigationDirection.forward, animated: true, completion: nil)
            
        }
        
        currentIndex = index
        
    }

    deinit {
        
        NotificationCenter.default.removeObserver(self)
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "newPage"), object: nil)
        
    }
    
}

extension MainPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            
            return nil
            
        }
        
        guard orderedViewControllersCount > nextIndex else {
            
            return nil
            
        }
        
        return orderedViewControllers[nextIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else { return nil }
        
        return orderedViewControllers[previousIndex]
        
    }
    
}
