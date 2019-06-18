//
//  ViewController.swift
//  StretchySnack
//
//  Created by Frances ZiyiFan on 6/13/19.
//  Copyright © 2019 Ray Kang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var menu: UIView!
    var expanded : Bool!
    @IBOutlet weak var plusButton: UIButton!
    var stackView : UIStackView!
    var imageViews : [UIImageView]!
    var imageView1 : UIImageView!
    var imageView2 : UIImageView!
    var imageView3 : UIImageView!
    var imageView4 : UIImageView!
    var imageView5 : UIImageView!
    
    var stackBotConstraint : NSLayoutConstraint!
    var stackLeadConstraint : NSLayoutConstraint!
    var stackTrailConstraint : NSLayoutConstraint!
    var stackHeightConstraint : NSLayoutConstraint!
    var stackTopConstraint : NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        expanded = false
        
        imageView1 = UIImageView()
        imageView2 = UIImageView()
        imageView3 = UIImageView()
        imageView4 = UIImageView()
        imageView5 = UIImageView()
        imageView1.image = UIImage(named: "oreos.png")
        imageView2.image = UIImage(named: "pizza_pockets.png")
        imageView3.image = UIImage(named: "pop_tarts.png")
        imageView4.image = UIImage(named: "popsicle.png")
        imageView5.image = UIImage(named: "ramen.png")
        
        imageViews = [imageView1, imageView2, imageView3, imageView4, imageView5]
        for image in imageViews {
            image.contentMode = .scaleAspectFit
            image.translatesAutoresizingMaskIntoConstraints = false
            image.clipsToBounds = true
        }
        stackView = UIStackView(arrangedSubviews: imageViews)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        //        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.menu.addSubview(stackView)
        //        NSLayoutConstraint.activate([
        stackBotConstraint = stackView.bottomAnchor.constraint(equalTo: menu.bottomAnchor)
        stackLeadConstraint = stackView.leadingAnchor.constraint(equalTo: menu.leadingAnchor)
        stackTrailConstraint = stackView.trailingAnchor.constraint(equalTo: menu.trailingAnchor)
//        stackHeightConstraint = stackView.heightAnchor.constraint(equalToConstant: 50)
        stackTopConstraint = stackView.topAnchor.constraint(equalTo: menu.topAnchor, constant: 100)
        //            ])
        NSLayoutConstraint.activate([self.stackBotConstraint, self.stackLeadConstraint, self.stackTrailConstraint, self.stackTopConstraint])
        stackView.isHidden = true
    }
    
    @IBAction func plusIconPressed(_ sender: Any) {
        
        if(!expanded){
            
            self.stackView.isHidden = false
            UIView.animate(withDuration: 1,delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.3, options: [], animations: {
                
                self.menu.frame.size.height = 200
                //                NSLayoutConstraint.activate([self.stackBotConstraint, self.stackLeadConstraint, self.stackTrailConstraint, self.stackHeightConstraint])
                
                self.menu.layoutIfNeeded()
                self.plusButton.transform = self.plusButton.transform.rotated(by: CGFloat.pi/4)
                
            })
            
            self.expanded = true
            
        }else{
            
            
            UIView.animate(withDuration: 1,delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.3, options: [], animations: {
                
                self.menu.frame.size.height = 66
                self.plusButton.transform = self.plusButton.transform.rotated(by: -CGFloat.pi/4)
                self.stackView.isHidden = true
            })
            
            self.expanded = false
            
        }
    }
    
//    func addStackView(){
//        self.menu.addSubview(stackView)
//        NSLayoutConstraint.activate([
//            stackView.bottomAnchor.constraint(equalTo: menu.bottomAnchor),
//            stackView.leadingAnchor.constraint(equalTo: menu.leadingAnchor),
//            stackView.trailingAnchor.constraint(equalTo: menu.trailingAnchor),
//            stackView.heightAnchor.constraint(equalToConstant: 50)
//            ])
//                stackView.isHidden = true
//    }
    
}

