//
//  TabItem1.swift
//  Practice1
//
//  Created by Andrey Budnitskiy on 07.03.2022.
//

import SwiftUI

//The third tabview's tab item
struct TabItem3: View {

    @State private var isModalScreenPreented = false

    var body: some View {
        Button("Present the modal view") {
            self.isModalScreenPreented.toggle()
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.blue)
        .cornerRadius(12.0)

        .sheet(isPresented: $isModalScreenPreented) {
            ModalView()
        }
    }

}



struct TabItem3_Previews: PreviewProvider {
    static var previews: some View {
        TabItem3()
    }
}
