//
//  BGImageView.swift
//  Devote
//
//  Created by Anis on 18/06/21.
//

import SwiftUI

struct BGImageView: View {
    var body: some View {
        Image("rocket")
            .antialiased(true)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(.all)
    }
}

struct BGImageView_Previews: PreviewProvider {
    static var previews: some View {
        BGImageView()
    }
}
