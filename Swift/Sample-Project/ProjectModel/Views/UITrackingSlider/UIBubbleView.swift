//
//  UITrackingSlider.swift
//  ProjectModel
//
//  Created by Erico Gimenes Teixeira on 02/07/19.
//  Copyright © 2019 Erico Gimenes Teixeira. All rights reserved.
//

import UIKit


class UIBubbleView : UIView {
    
    //MARK: Properties
    
    //content
    private weak var contentView:UIView? = nil
    private var internalMargin:UIEdgeInsets = .zero
    //border
    private var borderLineWidth:CGFloat = 0.0
    private var borderLineColor:UIColor = .clear
    //corner
    private var cornerType:UIRectCorner = .allCorners
    private var cornerRadius:CGSize = .zero
    //target
    private var targetPoint:CGPoint? = .zero
    //background
    private var bubbleColor:UIColor = UIColor.white
    private var shapeLayer:CAShapeLayer = CAShapeLayer.init()
    
    //MARK: - INITIALIZERS:
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.updateLink()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.updateLink()
    }
    
    private func updateLink() -> Void {
        
        
        
        updateShapeLayer()
    }
    
    public func show(animated:Bool) -> Void {
        if animated {
            UIView.animate(withDuration: 0.25) {
                self.alpha = 1.0
            }
        } else {
            self.alpha = 1.0
        }
    }
    
    public func hide(animated:Bool) -> Void {
        if animated {
            UIView.animate(withDuration: 0.25) {
                self.alpha = 0.0
            }
        } else {
            self.alpha = 0.0
        }
    }
    
    public func setBubbleContent(view contentView:UIView) -> Void {
        
        if let actualContent = self.contentView {
            actualContent.removeFromSuperview()
        }
        
        self.contentView = contentView
        
        self.contentView?.frame = CGRect.init(x: internalMargin.left, y: internalMargin.top, width: contentView.frame.size.width, height: contentView.frame.size.height)
        self.addSubview(self.contentView!)
        //
        self.frame = CGRect.init(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.contentView!.bounds.size.width + internalMargin.left + internalMargin.right, height: self.contentView!.bounds.size.height + internalMargin.top + internalMargin.bottom)
    }
    
    public func setBubbleBackground(color:UIColor, animated:Bool) -> Void {
        self.bubbleColor = color//
        //TODO:
        updateLink()
    }
    
    public func setLinkTarget(_ target:CGPoint?) -> Void {
        self.targetPoint = target
        //
        updateLink()
    }
    
    public func setInternalMargin(insets:UIEdgeInsets) -> Void {
        self.internalMargin = insets
        //
        if let contentView = self.contentView {
            self.contentView?.frame = CGRect.init(x: internalMargin.left, y: internalMargin.top, width: contentView.frame.size.width, height: contentView.frame.size.height)
            //
            self.frame = CGRect.init(x: self.frame.origin.x, y: self.frame.origin.y, width: self.contentView!.frame.size.width + internalMargin.left + internalMargin.right, height: self.contentView!.frame.size.height + internalMargin.top + internalMargin.bottom)
            //
            updateLink()
        }
    }
    
    public func setBubbleCorner(corners:UIRectCorner, radius:CGSize) -> Void {
        cornerType = corners
        cornerRadius = radius
        //
        self.updateShapeLayer()
    }
    
    public func setPosition(_ newPosition:CGPoint) -> Void {
        
        if let target = targetPoint {
            let deltaX = self.center.x - newPosition.x
            let deltaY = self.center.y - newPosition.y
            self.center = newPosition
            self.targetPoint = CGPoint.init(x: target.x + deltaX, y: target.y + deltaY)
        } else {
            self.center = newPosition
        }
        //
        updateLink()
    }
    
    private func updateShapeLayer() -> Void {
        
        self.backgroundColor = UIColor.clear
        
        //FINAL LAYER
        let layer:CAShapeLayer = CAShapeLayer.init()
        layer.isOpaque = false
        
        //BACKGROUND
        let rectLayer = CGRect.init(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.height)
        let backgroundPath = UIBezierPath.init(roundedRect: rectLayer, byRoundingCorners: cornerType, cornerRadii: cornerRadius)
        backgroundPath.close()
        //
        let backGroundLayer:CAShapeLayer = CAShapeLayer.init()
        backGroundLayer.isOpaque = false
        backGroundLayer.path = backgroundPath.cgPath
        backGroundLayer.fillColor = self.bubbleColor.cgColor
        //
        backgroundPath.fill()
        //
        layer.addSublayer(backGroundLayer)
        
        if let target = targetPoint {
            
            //LINK
            var center = self.center
            var useHorizontal = false
            let horizontalDist = abs(target.x - (self.frame.size.width / 2.0))
            let verticalDist = abs(target.y - (self.frame.size.height / 2.0))
            if horizontalDist < verticalDist {
                useHorizontal = true
            }
            //
            print("horizontalDist: \(horizontalDist), verticalDist: \(verticalDist)")
            //
            center = CGPoint.init(x: self.frame.size.width / 2.0, y: self.frame.size.height / 2.0)
            //
            let linkPath = UIBezierPath.init()
            let minSide = min(self.frame.size.width, self.frame.size.height) / 2.0
            if useHorizontal {
                linkPath.move(to: CGPoint.init(x: center.x - minSide / 2.0, y: center.y))
                linkPath.addLine(to: target)
                linkPath.addLine(to: CGPoint.init(x: center.x + minSide / 2.0, y: center.y))
                linkPath.addLine(to: CGPoint.init(x: center.x - minSide / 2.0, y: center.y))
            } else {
                linkPath.move(to: CGPoint.init(x: center.x, y: center.y + minSide / 2.0))
                linkPath.addLine(to: target)
                linkPath.addLine(to: CGPoint.init(x: center.x, y: center.y - minSide / 2.0))
                linkPath.addLine(to: CGPoint.init(x: center.x, y: center.y + minSide / 2.0))
            }
            linkPath.close()
            //
            let linkLayer:CAShapeLayer = CAShapeLayer.init()
            linkLayer.isOpaque = false
            linkLayer.path = linkPath.cgPath
            linkLayer.fillColor = self.bubbleColor.cgColor
            //
            linkPath.fill()
            //
            layer.addSublayer(linkLayer)
        }
        
        shapeLayer.removeFromSuperlayer()
        
        shapeLayer = layer
        self.layer.insertSublayer(shapeLayer, at: 0)
    }
    
    private func angleBetween(point1:CGPoint, point2:CGPoint) -> CGFloat {
        let originPoint = CGPoint.init(x: point2.x - point1.x, y: point2.y - point1.y)
        let bearingRadians = atan2f(Float(originPoint.y), Float(originPoint.x))
        var bearingDegrees = bearingRadians * (180.0 / Float.pi)
        bearingDegrees = bearingDegrees > 0.0 ? bearingDegrees : (360.0 + bearingDegrees)
        return CGFloat(bearingDegrees)
    }
    
    private func distance(_ a: CGPoint, _ b: CGPoint) -> CGFloat {
        let xDist = a.x - b.x
        let yDist = a.y - b.y
        return CGFloat(sqrt(xDist * xDist + yDist * yDist))
    }
    
}
