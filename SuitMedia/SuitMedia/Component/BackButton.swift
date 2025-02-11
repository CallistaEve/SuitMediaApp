//
//  BackButton.swift
//  SuitMedia
//
//  Created by Evelyn Callista Yaurentius on 11/02/25.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left") 
                .font(.system(size: 17, weight: .medium))
                .foregroundColor(.blue)
        }
    }
}
