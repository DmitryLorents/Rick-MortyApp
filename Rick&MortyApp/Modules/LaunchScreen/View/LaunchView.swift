//
//  LaunchView.swift
//  Rick&MortyApp
//
//  Created by Dmitry on 15.11.2023.
//

import UIKit

class LaunchView: UIView {
    
    //MARK: - Parameters
    
    var degree = CGFloat(Double.pi / 180)
    var timer: Timer!
    private let logoImageView = UIImageView(image: UIImage(named: "logo"))
    private let greenCircleImageView = UIImageView(image: UIImage(named: "greenCircle"))
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
        rotateView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Methods
    
    private func setViews() {
        backgroundColor = .systemBackground
        addSubview(logoImageView)
        addSubview(greenCircleImageView)
    }
    
    private func rotateView() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true, block: { timer in
            UIView.animate(withDuration: 0.02) { [self] in
                greenCircleImageView.transform = CGAffineTransform(rotationAngle: self.degree)
            }
            self.degree += CGFloat(Double.pi / 180)
        })
        
    }
    
    func stopAnimation() {
        timer.invalidate()
    }
    
    private func setConstraints() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        greenCircleImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 97),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            greenCircleImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            greenCircleImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            greenCircleImageView.widthAnchor.constraint(equalToConstant: 200),
            greenCircleImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
