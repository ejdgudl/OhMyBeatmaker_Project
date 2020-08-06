//
//  CoverCell.swift
//  OhMyBeatmaker
//
//  Created by 김동현 on 2020/08/06.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

protocol DidTapPlayButtonFirstDelegate: class {
    func didTapPlayButton(_ cell: CoverCollectionCell)
}

class CoverCollectionCell: UICollectionViewCell {
    
    private let coverImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cover")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var playButtonInCover: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "play.circle"), for: .normal)
        button.addTarget(self, action: #selector(didTapPlayButton), for: .touchUpInside)
        return button
    }()
    
    private let songtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "노래제목"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    let artistNameLabel: UILabel = {
        let label = UILabel()
        label.text = "아티스트"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    weak var delegate: DidTapPlayButtonFirstDelegate?
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: @Objc
    @objc private func didTapPlayButton() {
        delegate?.didTapPlayButton(self)
    }
    
    // MARK: ConfigureViews
    private func configureViews() {
        backgroundColor = .orange
        
        [coverImage, playButtonInCover, songtitleLabel, artistNameLabel].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        coverImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        coverImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        coverImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        coverImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        playButtonInCover.translatesAutoresizingMaskIntoConstraints = false
        playButtonInCover.topAnchor.constraint(equalTo: coverImage.topAnchor, constant: 2).isActive = true
        playButtonInCover.rightAnchor.constraint(equalTo: coverImage.rightAnchor, constant: -2).isActive = true
        playButtonInCover.widthAnchor.constraint(equalToConstant: 30).isActive = true
        playButtonInCover.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        songtitleLabel.topAnchor.constraint(equalTo: coverImage.bottomAnchor, constant: 5).isActive = true
        songtitleLabel.leftAnchor.constraint(equalTo: coverImage.leftAnchor).isActive = true
        
        artistNameLabel.topAnchor.constraint(equalTo: songtitleLabel.bottomAnchor, constant: 2).isActive = true
        artistNameLabel.leftAnchor.constraint(equalTo: coverImage.leftAnchor).isActive = true
    }
    
}
