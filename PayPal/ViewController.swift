//
//  ViewController.swift
//  PayPal
//
//  Created by Harsha Vardhan Sannareddy on 28/01/20.
//  Copyright © 2020 Harsha Vardhan Sannareddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height+400)
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.backgroundColor = UIColor.rgb(red: 238, green: 238, blue: 238)
        view.frame = self.view.bounds
        view.contentSize = contentViewSize
        view.autoresizingMask = .flexibleHeight
        view.showsHorizontalScrollIndicator = true
        view.bounces = true
        return view
    }()
    
    lazy var containerView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 238, green: 238, blue: 238)
        view.frame.size = contentViewSize
        
        view.addSubview(balanceView)
        balanceView.anchor(top: view.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: .init(top: 45, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: 150))
        
        view.addSubview(activityLabel)
        activityLabel.anchor(top: balanceView.bottomAnchor, leading: balanceView.leadingAnchor, trailing: balanceView.trailingAnchor, padding: .init(top: 30, left: 0, bottom: 0, right: 0))
        
        view.addSubview(backgroundView)
        backgroundView.anchor(top: activityLabel.topAnchor, leading: activityLabel.leadingAnchor, trailing: balanceView.trailingAnchor, padding: .init(top: 30, left: 0, bottom: 0, right: 0), size: .init(width:0, height:220))
        
        view.addSubview(stackView)
        stackView.anchor(top: activityLabel.topAnchor, leading: activityLabel.leadingAnchor, trailing: balanceView.trailingAnchor, padding: .init(top: 30, left: 0, bottom: 0, right: 0), size: .init(width:0, height:220))
        
        view.addSubview(infoLabel)
        infoLabel.anchor(top: stackView.bottomAnchor, leading: activityLabel.leadingAnchor, padding: .init(top: 30, left: 0, bottom: 0, right: 0))
        
        view.addSubview(infoView)
        infoView.anchor(top: infoLabel.bottomAnchor, leading: infoLabel.leadingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0), size: .init(width: view.frame.width * 0.6, height: 270))
        
        return view
    }()
    
    
    lazy var balanceView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = CGFloat(5.0)
        view.layer.shadowOpacity = Float(0.2)
        view.layer.shadowOffset = CGSize(width: 2, height: 1)
        view.layer.shadowRadius = CGFloat(2)
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, padding: .init(top: 15, left: 30, bottom: 0, right: 0))
        
        view.addSubview(moreButton)
        moreButton.anchor(top: view.topAnchor, trailing: view.trailingAnchor, padding: .init(top: 15, left: 0, bottom: 0, right: 30))
        

        view.addSubview(balanceLabel)
        balanceLabel.anchor(top: titleLabel.topAnchor, leading: view.leadingAnchor, padding: .init(top: 35, left: 30, bottom: 0, right: 0))
        
        
        view.addSubview(indicatorLabel)
        indicatorLabel.anchor(top: balanceLabel.topAnchor, leading: view.leadingAnchor, padding: .init(top: 50, left: 30, bottom: 0, right: 0))
        
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "PayPal Balance"
        label.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        return label
    }()
    
    let moreButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "moreicon"), for: .normal)
        button.layer.cornerRadius = CGFloat(5.0)
        return button
    }()
    
    let balanceLabel: UILabel = {
        let label = UILabel()
        label.text = "$40.21"
        label.font = UIFont.systemFont(ofSize: 38, weight: .light)
        return label
    }()
    
    let indicatorLabel: UILabel = {
        let label = UILabel()
        label.text = "Available"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 17, weight: .light)
        return label
    }()
    
    let activityLabel: UILabel = {
        let label = UILabel()
        label.text = "Your Activity"
        label.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        return label
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Get the most out of PayPal"
        label.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        return label
    }()
    
    lazy var sendRecieveView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        
        view.addSubview(sendRecieveStackView)
        sendRecieveStackView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        
        return view
    }()
    
    lazy var sendRecieveStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [sendView, receiveView])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy var sendView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        view.addSubview(sendImage)
        sendImage.anchor(top: view.topAnchor, padding: .init(top: 12, left: 0, bottom: 0, right: 0), size: .init(width: 50, height: 50))
        sendImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(sendLabel)
        sendLabel.anchor(top: sendImage.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: .init(top: 5, left: 10, bottom: 0, right: 10))
        
        return view
    }()
    
    let sendImage: UIImageView = {
       let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "sendicon")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let sendLabel: UILabel = {
       let label = UILabel()
        label.text = "Send"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        return label
    }()
    
    lazy var receiveView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        view.addSubview(recieveImage)
        recieveImage.anchor(top: view.topAnchor, padding: .init(top: 12, left: 0, bottom: 0, right: 0), size: .init(width: 50, height: 50))
        recieveImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(recieveLabel)
        recieveLabel.anchor(top: recieveImage.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: .init(top: 5, left: 10, bottom: 0, right: 10))
        
        return view
    }()
    
    let recieveImage: UIImageView = {
       let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "requesticon")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let recieveLabel: UILabel = {
       let label = UILabel()
        label.text = "Request"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        return label
    }()
    
    lazy var infoView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 59, green: 116, blue: 225)
        
        view.addSubview(infoImage)
        infoImage.anchor(top: view.topAnchor, leading: view.leadingAnchor, padding: .init(top: 30, left: 15, bottom: 0, right: 0))
        
        view.addSubview(infoSubLabel)
        infoSubLabel.anchor(top: infoImage.bottomAnchor, leading: infoImage.leadingAnchor, trailing: view.trailingAnchor, padding: .init(top: 12, left: 0, bottom: 0, right: 15))
        
        view.addSubview(infoSubLabel2)
        infoSubLabel2.anchor(top: infoSubLabel.bottomAnchor, leading: infoSubLabel.leadingAnchor, trailing: view.trailingAnchor, padding: .init(top: 12, left: 0, bottom: 0, right: 15))
        
        return view
    }()
    
    let infoImage: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "phonesecurityicon")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let infoSubLabel: UILabel = {
       let label = UILabel()
        label.text = "Add extra security to your account"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 2
       return label
    }()
    
    let infoSubLabel2: UILabel = {
       let label = UILabel()
        label.text = "Confirm your mobile phone to make it easier to recover your password"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
       return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstView, secondView, thirdView])
        stackView.axis = .vertical
        stackView.spacing = 10
        /*
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        */
        stackView.distribution = .fillEqually
        
        
        return stackView
    }()
    
     lazy var backgroundView: UIView = {
      let view = UIView()
        view.backgroundColor =  UIColor.rgb(red: 238, green: 238, blue: 238)
      return view
    }()
    
    lazy var firstView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        view.addSubview(firstImageView)
        firstImageView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, padding: .init(top: 10, left: 20, bottom: 10, right: 0))

        view.addSubview(firstLabel)
        firstLabel.anchor(top: view.topAnchor, leading: firstImageView.trailingAnchor, padding: .init(top: 18, left: 20, bottom: 0, right: 0))
        
        view.addSubview(firstMoneyLabel)
        firstMoneyLabel.anchor(top: view.topAnchor, trailing: view.trailingAnchor, padding: .init(top: 18, left: 0, bottom: 0, right: 10))
        
        view.addSubview(firstStatusLabel)
        firstStatusLabel.anchor(top: firstLabel.bottomAnchor, leading: firstImageView.trailingAnchor, padding: .init(top: 6, left: 20, bottom: 0, right: 0))
        
        return view
    }()
    
    lazy var secondView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        view.addSubview(secondImageView)
        secondImageView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, padding: .init(top: 10, left: 20, bottom: 10, right: 0))

        view.addSubview(secondLabel)
        secondLabel.anchor(top: view.topAnchor, leading: secondImageView.trailingAnchor, padding: .init(top: 18, left: 20, bottom: 0, right: 0))
        
        view.addSubview(secondMoneyLabel)
        secondMoneyLabel.anchor(top: view.topAnchor, trailing: view.trailingAnchor, padding: .init(top: 18, left: 0, bottom: 0, right: 10))
        
        view.addSubview(secondStatusLabel)
        secondStatusLabel.anchor(top: secondLabel.bottomAnchor, leading: secondImageView.trailingAnchor, padding: .init(top: 6, left: 20, bottom: 0, right: 0))
        
        return view
    }()
    
    lazy var thirdView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        view.addSubview(thirdImageView)
        thirdImageView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, padding: .init(top: 10, left: 20, bottom: 10, right: 0))

        view.addSubview(thirdLabel)
        thirdLabel.anchor(top: view.topAnchor, leading: thirdImageView.trailingAnchor, padding: .init(top: 18, left: 20, bottom: 0, right: 0))
        
        view.addSubview(thirdMoneyLabel)
        thirdMoneyLabel.anchor(top: view.topAnchor, trailing: view.trailingAnchor, padding: .init(top: 18, left: 0, bottom: 0, right: 10))
        
        view.addSubview(thirdStatusLabel)
        thirdStatusLabel.anchor(top: thirdLabel.bottomAnchor, leading: thirdImageView.trailingAnchor, padding: .init(top: 6, left: 20, bottom: 0, right: 0))
        
        return view
    }()
    
    let firstImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "shopicon")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let firstLabel: UILabel = {
       let label = UILabel()
        label.text = "John McCarthy"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let firstMoneyLabel: UILabel = {
        let label = UILabel()
        label.text = "+$20.15"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let firstStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "Money Received"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let secondImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "shopicon")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let secondLabel: UILabel = {
       let label = UILabel()
        label.text = "Dennis Ritchie"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let secondMoneyLabel: UILabel = {
        let label = UILabel()
        label.text = "+$10.10"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let secondStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "Money Received"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let thirdImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "shopicon")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let thirdLabel: UILabel = {
       let label = UILabel()
        label.text = "Linus Torvalds"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let thirdMoneyLabel: UILabel = {
        let label = UILabel()
        label.text = "+$9.80"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let thirdStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "Money Received"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.rgb(red: 238, green: 238, blue: 238)
        
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        navigationController?.navigationBar.isTranslucent = true
        
        var rightBarItemImage  = UIImage(named: "settingsicon")
        rightBarItemImage = rightBarItemImage?.withRenderingMode(.alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightBarItemImage, style: .plain, target: nil, action: nil)
        
        let profileImageView = UIImageView(image: UIImage(named: "profileimage"))
        navigationItem.titleView = profileImageView
        
        var leftBarItemImage  = UIImage(named: "notificationsicon")
        leftBarItemImage = leftBarItemImage?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: leftBarItemImage, style: .plain, target: nil, action: nil)
        
        view.addSubview(sendRecieveView)
        sendRecieveView.anchor(leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, size: .init(width: 0, height: 90))
        
    }
}

