//
//  Cardify.swift
//  Memorize
//
//  Created by Aige Cortasa, Albert on 22/09/2020.
//  Copyright © 2020 Aige Cortasa, Albert. All rights reserved.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    var rotacion: Double
    var isFaceUp: Bool {
        rotacion < 90
    }
    private let cornerRadius: CGFloat = 10
    private let edgeLineWidth: CGFloat = 3
    
    var animatableData: Double {
        get { return rotacion }
        set { rotacion = newValue }
    }
    
    init(isFaceUp: Bool) {
        rotacion = isFaceUp ? 0 : 180
    }
    
    func body(content: Content) -> some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                content
            }
                .opacity(isFaceUp ? 1 : 0)
            RoundedRectangle(cornerRadius: cornerRadius).fill()
                .opacity(isFaceUp ? 0 : 1)
            
        }
        .rotation3DEffect(Angle.degrees(rotacion), axis: (0,1,0))
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
