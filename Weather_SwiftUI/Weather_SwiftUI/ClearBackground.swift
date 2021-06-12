//
//  ClearBackground.swift
//  Weather_SwiftUI
//
//  Created by 임현지 on 2021/06/12.
//

import SwiftUI

struct ClearBackground: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.addEllipse(in: CGRect(x: 0.16393*width, y: 0.16878*height, width: 0.67213*width, height: 0.69198*height))
        path.addEllipse(in: CGRect(x: 0.36967*width, y: 0.12743*height, width: 0.4918*width, height: 0.50633*height))
        return path
    }
}

