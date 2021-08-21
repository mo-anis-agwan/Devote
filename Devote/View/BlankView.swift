//
//  BlankView.swift
//  Devote
//
//  Created by Anis on 19/06/21.
//

import SwiftUI

struct BlankView: View {
    //MARK:- Vars
    var bgColor: Color
    var bgOpacity: Double

    //MARK:- Body
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(bgColor)
        .opacity(bgOpacity)
        .blendMode(.overlay)
        .edgesIgnoringSafeArea(.all)
    }
}

//MARK:- Preview
struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView(bgColor: Color.black, bgOpacity: 0.3)
            .background(BGImageView())
            .background(backgroundGradient.ignoresSafeArea(.all))
    }
}
