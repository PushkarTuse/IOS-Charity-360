//
//  OnboardingViewController.swift
//  charity360
//
//  Created by user1 on 24/02/24.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var slides : [OnboardingSlide] = []
    
    var currentPage = 0{
        didSet{
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            }else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    override func viewDidLoad() {
            super.viewDidLoad()
            
            // Initialize slides with actual UIImage instances
            slides = [
                OnboardingSlide(title: "Title 1", description: " Description 1", image: UIImage(named: "mumbai")!),
                OnboardingSlide(title: "Title 2", description: "Description 2", image: UIImage(named: "delhi")!),
                OnboardingSlide(title: "Title 3", description: "Description 3", image: UIImage(named: "delhi")!)
                // Add more slides as needed
            ]
        }
    
    @IBAction func nextButtonClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            let tabBarController = storyboard?.instantiateViewController(identifier: "MainTabBarController") as! UITabBarController
            UIApplication.shared.windows.first?.rootViewController = tabBarController
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }

    
  
}
extension OnboardingViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath)as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: collectionView.frame.width,height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x/width)
        pageControl.currentPage = currentPage
    }
}
