//
//  2022] R: woy OnboardingContainerVC.swift
//  Bankfan
//
//  Created by Muhammad Arfan on 30/12/22.
//
import UIKit

protocol OnboardingContainerVCDelegate : AnyObject {
    func didFinishOnboarding()
}

class OnboardingContainerVC: UIViewController {
    
    // Controller
    let pageViewController: UIPageViewController
    var currentVC: UIViewController
    
    // Objects
    public weak var delegate : OnboardingContainerVCDelegate?
    let pages : [OnboardingVC] = [
        .init(imgName: "delorean", title: "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in the 80s."),
        .init(imgName: "world", title: "Move your money around the world quickly and securely."),
        .init(imgName: "thumbs", title: "Learn more at www.bankey.com.")
    ]
    
    // View
    let closeBtn = UIButton(type: .system)
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        currentVC = pages.first!
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
        self.style()
        self.layout()
    }
}

extension OnboardingContainerVC {
    
    private func setup () {
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        pageViewController.dataSource = self
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: false, completion: nil)
        currentVC = pages.first!
    }
    
    private func style () {
        // Self
        view.backgroundColor = .systemPurple
        
        // Close Button
        closeBtn.translatesAutoresizingMaskIntoConstraints = false
        closeBtn.setTitle("Close", for: .normal)
        closeBtn.addTarget(self, action: #selector(self.closeBtnTapped), for: .primaryActionTriggered)
        view.addSubview(closeBtn)
    }
    
    private func layout () {
        // Page View
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: pageViewController.view.topAnchor),
            view.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor),
        ])
        
        // Close Button
        NSLayoutConstraint.activate([
            closeBtn.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor , multiplier: 2),
            closeBtn.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
        ])
    }
    
}

// MARK: - Actions
extension OnboardingContainerVC  {
    @objc private func closeBtnTapped () {
        LocalState.hasOnboarded = true
        self.delegate?.didFinishOnboarding()
    }
}


// MARK: - UIPageViewControllerDataSource
extension OnboardingContainerVC : UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return getPreviousViewController(from: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return getNextViewController(from: viewController)
    }
    
    private func getPreviousViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController as! OnboardingVC), index - 1 >= 0 else { return nil }
        currentVC = pages[index - 1]
        return pages[index - 1]
    }
    
    private func getNextViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController as! OnboardingVC), index + 1 < pages.count else { return nil }
        currentVC = pages[index + 1]
        return pages[index + 1]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return pages.firstIndex(of: self.currentVC as! OnboardingVC) ?? 0
    }
}
