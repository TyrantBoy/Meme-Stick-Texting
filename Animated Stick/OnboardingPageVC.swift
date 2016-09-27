//
//  OnboardingPageVC.swift
//  Animated Stickers
//
//  Created by Donald Nguyen on 9/23/16.
//  Copyright © 2016 Donald Nguyen. All rights reserved.
//

import UIKit

class OnboardingPageVC: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        
        let pageController = UIPageControl.appearance()
        pageController.pageIndicatorTintColor = UIColor.lightGray
        pageController.currentPageIndicatorTintColor = UIColor.black
        //pageController.backgroundColor = UIColor.clear
        setViewControllers([getOne()], direction: .forward , animated: false, completion: nil)

    }
    
    func getOne() -> UIViewController {
        return storyboard!.instantiateViewController(withIdentifier: "one")
    }
    
    func getTwo() -> UIViewController {
        return storyboard!.instantiateViewController(withIdentifier: "two")
    }
    
    func getThree() -> UIViewController {
        return storyboard!.instantiateViewController(withIdentifier: "three")
    }
    
    func getFour() -> UIViewController {
        return storyboard!.instantiateViewController(withIdentifier: "four")
    }
    
    func getFive() -> UIViewController {
        return storyboard!.instantiateViewController(withIdentifier: "five")
    }
    
    func getSix() -> UIViewController {
        return storyboard!.instantiateViewController(withIdentifier: "six")
    }


}

extension OnboardingPageVC: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
       
        if viewController.restorationIdentifier == "six" {
           return getFive()
        } else if viewController.restorationIdentifier == "five" {
           return getFour()
        } else if viewController.restorationIdentifier == "four" {
            return getThree()
        } else if viewController.restorationIdentifier == "three" {
            return getTwo()
        } else if viewController.restorationIdentifier == "two" {
            return getOne()
        } else {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            if viewController.restorationIdentifier == "one" {
                return getTwo()
            } else if viewController.restorationIdentifier == "two" {
                return getThree()
            } else if viewController.restorationIdentifier == "three" {
                return getFour()
            } else if viewController.restorationIdentifier == "four" {
                return getFive()
            } else if viewController.restorationIdentifier == "five" {
                return getSix()
            }else {
                return nil
            }
            
        }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 6
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    //clear background
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for view in self.view.subviews {
            if view is UIScrollView {
                view.frame = UIScreen.main.bounds
            } else if view is UIPageControl {
                view.backgroundColor = UIColor.clear
            }
        }
        
    }

}

