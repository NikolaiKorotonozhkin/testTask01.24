//
//  UILabel + Extension.swift
//  testTask01.24
//
//  Created by Nikolai  on 19.01.2024.
//

import UIKit

//Создаем обводку вокруг текста


extension UILabel {
    func addTextOutline(usingColor outlineColor: UIColor, outlineWidth: CGFloat) {
        class OutlinedText: UILabel{
            var outlineWidth: CGFloat = 0
            var outlineColor: UIColor = .clear

            override public func drawText(in rect: CGRect) {
                let shadowOffset = self.shadowOffset
                let textColor = self.textColor

                let c = UIGraphicsGetCurrentContext()
                c?.setLineWidth(outlineWidth)
                c?.setLineJoin(.round)
                c?.setTextDrawingMode(.stroke)
                self.textAlignment = .center
                self.textColor = outlineColor
                super.drawText(in:rect)

                c?.setTextDrawingMode(.fill)
                self.textColor = textColor
                self.shadowOffset = CGSize(width: 0, height: 0)
                super.drawText(in:rect)

                self.shadowOffset = shadowOffset
            }
        }

        let textOutline = OutlinedText()

        textOutline.outlineColor = outlineColor
        textOutline.outlineWidth = outlineWidth
        textOutline.textColor = textColor
        textOutline.font = font
        textOutline.text = text
        
        sizeToFit()
        addSubview(textOutline)
        textOutline.frame = CGRect(x: -(outlineWidth / 2), y: -(outlineWidth / 2),
                                   width: bounds.width + outlineWidth,
                                   height: bounds.height + outlineWidth)
    }
}


//Это расширение работает лучше. Тут добавлена передача ширины и высоты.
//Расширение выше плохо работает с лейблами, где больше одной строки, а это нормально

extension UILabel {
    func addTextOutline2(usingColor outlineColor: UIColor, outlineWidth: CGFloat, width: Int, height: Int) {
        
        class OutlinedText2: UILabel{
            var outlineWidth: CGFloat = 0
            var outlineColor: UIColor = .clear

            override public func drawText(in rect: CGRect) {
                let shadowOffset = self.shadowOffset
                let textColor = self.textColor

                let c = UIGraphicsGetCurrentContext()
                c?.setLineWidth(outlineWidth)
                c?.setLineJoin(.round)
                c?.setTextDrawingMode(.stroke)
                self.textAlignment = .center
                self.textColor = outlineColor
                super.drawText(in:rect)

                c?.setTextDrawingMode(.fill)
                self.textColor = textColor
                self.shadowOffset = CGSize(width: 0, height: 0)
                super.drawText(in:rect)

                self.shadowOffset = shadowOffset
            }
        }

        let textOutline = OutlinedText2()

        textOutline.outlineColor = outlineColor
        textOutline.outlineWidth = outlineWidth
        textOutline.textColor = textColor
        textOutline.font = font
        textOutline.text = text
        
        
        sizeToFit()
        addSubview(textOutline)
        
//        textOutline.frame = CGRect(x: -(outlineWidth / 2), y: -(outlineWidth / 2),
//                                   width: bounds.width + outlineWidth,
//                                   height: bounds.height + outlineWidth)
        
        textOutline.frame = CGRect(x: 0, y: 0, width: width, height: height)
        textOutline.numberOfLines = 0
    }
}
