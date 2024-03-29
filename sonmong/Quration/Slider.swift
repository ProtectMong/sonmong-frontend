//
//  Slider.swift
//  sonmong
//
//  Created by 이은솔 on 2024/03/26.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

//MARK: - SliderView.swift
protocol SliderViewDelegate: AnyObject {
    func sliderView(_ sender: SliderView, changedValue value: Int)
}

final class SliderView: UIView {
    
    weak var sliderDelegate: SliderViewDelegate?
    // RxSwift를 위한 PublishSubject 추가
    private var currentValueSubject = PublishSubject<Int>()
    // 외부에서 접근 가능하도록 Observable로 변환
    var currentValueObservable: Observable<Int> {
        return currentValueSubject.asObservable()
    }
    
    var currentValue: Int = 1 {
        didSet {
            // delegate 방식을 제거하거나 필요에 따라 유지합니다.
            sliderDelegate?.sliderView(self, changedValue: currentValue)
            // 새로운 currentValue를 Subject에 방출합니다.
            currentValueSubject.onNext(currentValue)
        }
    }
    
    //MARK: - Properties
    private let trackView: UIView = {
        let view = UIView()
        view.backgroundColor = Constant.Color.g1
        return view
    }()
    
    private lazy var thumbView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.isUserInteractionEnabled = true
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(gesture)
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = .init(width: 0, height: 4)
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.1
        view.layer.borderWidth = 2
        view.layer.borderColor = Constant.Color.m5.cgColor
        return view
    }()
    
    private let fillTrackView: UIView = {
        let view = UIView()
        view.backgroundColor = Constant.Color.m5
        return view
    }()
    
    private var dividers: [UIView] = []
    
    private var maxValue: Int
    private var touchBeganPosX: CGFloat?
    private var didLayoutSubViews: Bool = false
    
    private let thumbSize: CGFloat = 30
    private let dividerWidth: CGFloat = 0
    
    weak var delegate: SliderViewDelegate?
    
    override var intrinsicContentSize: CGSize {
        return .init(width: .zero, height: thumbSize)
    }
    
    var value: Int = 1 {
        didSet {
            delegate?.sliderView(self, changedValue: value)
        }
    }
    
    //MARK: - LifeCycle
    init(maxValue: Int) {
        if maxValue < 1 {
            self.maxValue = 1
        }
        else if maxValue > 20 {
            self.maxValue = 20
        }
        else{
            self.maxValue = maxValue
        }
        super.init(frame: .zero)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if !didLayoutSubViews {
            makeDivider(maxValue)
            thumbView.layer.cornerRadius = thumbView.frame.width / 2
            thumbView.layer.shadowPath = UIBezierPath(
                roundedRect: thumbView.bounds,
                cornerRadius: thumbView.layer.cornerRadius
            ).cgPath
            trackView.layer.cornerRadius = trackView.frame.height / 2
            fillTrackView.layer.cornerRadius = trackView.frame.height / 2
            fillTrackView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMinXMaxYCorner)
        }
    }
    
    //MARK: - Helpers
    private func layout() {
        [trackView, fillTrackView, thumbView].forEach(addSubview)
        
        trackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(10)
            make.centerY.equalToSuperview() // 가운데 정렬
            make.height.equalTo(20)
        }
        trackView.layer.cornerRadius = 10
        thumbView.snp.makeConstraints { make in
            make.centerY.equalTo(trackView)
            make.left.equalTo(trackView).offset(-(thumbSize / 2))
            make.size.equalTo(thumbSize)
        }
        fillTrackView.snp.makeConstraints { make in
            make.left.equalTo(trackView)
            make.top.bottom.equalTo(trackView)
            make.width.equalTo(0)
        }
        fillTrackView.layer.cornerRadius = 10
    }
    
    private func makeDivider(_ numberOfDivider: Int) {
        let slicedPosX = trackView.frame.width / CGFloat(numberOfDivider - 1)
        
        for i in 0..<numberOfDivider {
            let dividerPosX = slicedPosX * CGFloat(i)
            let divider = makeDivider()
            
            trackView.addSubview(divider)
            divider.snp.makeConstraints { make in
                make.centerY.equalTo(trackView)
                make.left.equalTo(trackView).offset(dividerPosX - 4)
                make.width.equalTo(dividerWidth)
                make.height.equalTo(trackView).offset(7)
            }
        }
        
        didLayoutSubViews.toggle()
    }
    
    private func makeDivider() -> UIView {
        let divider = UIView()
        divider.backgroundColor = .systemGray5
        divider.clipsToBounds = true
        divider.layer.cornerRadius = 3
        dividers.append(divider)
        return divider
    }
    
    //MARK: - Actions
    
    @objc func handlePan(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: thumbView)
        
        if recognizer.state == .began {
            // 팬 제스쳐가 시작된 x좌표 저장
            touchBeganPosX = thumbView.frame.minX
        }
        if recognizer.state == .changed {
            guard let startX = self.touchBeganPosX else { return }
            
            var offSet = startX + translation.x // 시작지점 + 제스쳐 거리 = 현재 제스쳐 좌표
            if offSet < 0 || offSet > trackView.frame.width { return } // 제스쳐가 trackView의 범위를 벗어나는 경우 무시
            let slicedPosX = trackView.frame.width / CGFloat(maxValue - 1) // maxValue를 기준으로 trackView를 n등분
            
            // value = 반올림(현재 제스쳐 좌표 / 1단위의 크기) -> 슬라이더의 값이 변할 때마다 똑똑 끊기는 효과를 주기 위해
            let newValue = round(offSet / slicedPosX)
            offSet = slicedPosX * newValue - (thumbSize / 2)
//            offSet = offSet + (thumbSize / 2)
            
            thumbView.snp.updateConstraints { make in
                make.left.equalTo(trackView).offset(offSet-3)
//                make.left.equalTo(trackView).offset(offSet - (thumbSize / 2))
            }
            fillTrackView.snp.updateConstraints { make in
                make.width.equalTo(offSet)
            }
            
            if value != Int(newValue + 1) {
                value = Int(newValue + 1)
                for i in 0..<value {
                    dividers[i].backgroundColor = .systemBlue
                }
                for i in value..<maxValue {
                    dividers[i].backgroundColor = .systemGray5
                }
            }
        }
    }

}
