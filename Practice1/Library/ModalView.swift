//
//  ModalView.swift
//  Practice1
//
//  Created by Andrey Budnitskiy on 07.03.2022.
//

import SwiftUI

//Modal view, that is using on third page
struct ModalView: View {

    @Environment(\.presentationMode) var presentationMode

    var body: some View {

        NavigationView {
                    Text("Просто текст")
                    .toolbar {
                                    ToolbarItem(placement: .navigationBarLeading) {

                                        Button {
                                            self
                                                .presentationMode
                                                .wrappedValue
                                                .dismiss()
                                        } label: {
                                            Label("", systemImage: "xmark")
                                            Text("Закрыть")
                                        }
                                    }
                                }
        }

    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
