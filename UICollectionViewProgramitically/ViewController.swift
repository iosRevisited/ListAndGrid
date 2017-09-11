//
//  ViewController.swift
//  Sample
//
//  Created by Sai Sandeep on 04/09/17.
//  Copyright © 2017 iosRevisited. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    let cellIdentifier = "ImageCell"
    let listCellIdentifier = "ListCell"
    
    var isListView = false
    
    var toggleButton = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(CustomCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView?.register(ListCell.self, forCellWithReuseIdentifier: listCellIdentifier)
        
        toggleButton = UIBarButtonItem(title: "List", style: .plain, target: self, action: #selector(butonTapped(sender:)))
        self.navigationItem.setRightBarButton(toggleButton, animated: true)
        
    }
    
    @objc func butonTapped(sender: UIBarButtonItem) {
        if isListView {
            toggleButton = UIBarButtonItem(title: "List", style: .plain, target: self, action: #selector(butonTapped(sender:)))
            isListView = false
        }else {
            toggleButton = UIBarButtonItem(title: "Grid", style: .plain, target: self, action: #selector(butonTapped(sender:)))
            isListView = true
        }
        self.navigationItem.setRightBarButton(toggleButton, animated: true)
        self.collectionView?.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if isListView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: listCellIdentifier, for: indexPath) as! ListCell
            cell.titleLabel.text = "Ferrari 812 Superfast"
            cell.descriptionLabel.text = "The car has a larger 6.5-liter V12 engine compared to the 6.3-liter used in the F12berlinetta. The engine produces 800 PS (588 kW, 789 bhp) at 8,500 rpm and 718 N·m (530 lbf·ft) of torque at 7,000 rpm. The 812 Superfast's V12 engine is, in 2017, the most powerful naturally aspirated production car engine ever made."
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CustomCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        if isListView {
            return CGSize(width: width, height: 120)
        }else {
            return CGSize(width: (width - 15)/2, height: (width - 15)/2)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


class CustomCell: UICollectionViewCell{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.red
        addSubview(imgView)
        imgView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imgView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imgView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imgView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imgView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "car.jpg")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
}

class ListCell : UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imgView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "car.jpg")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.title2)
        
        return label
    }()
    
    let descriptionLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        return label
    }()
    
    func setUpViews() {
        backgroundColor = UIColor.init(red: 245.0/255.0, green: 245.0/255.0, blue: 245.0/255.0, alpha: 1.0)
        addSubview(imgView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        imgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        imgView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        imgView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: frame.height).isActive = true
        
        titleLabel.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 8).isActive = true
        titleLabel.topAnchor.constraint(equalTo: imgView.topAnchor, constant: 4).isActive = true
        titleLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 8).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: imgView.bottomAnchor, constant: -4).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        descriptionLabel.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    }
}







