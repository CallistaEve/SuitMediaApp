import SwiftUI

struct FirstScreen: View {
    @State private var name = ""
    @State private var sentence = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    func isPalindrome(_ text: String) -> Bool {
        let filteredText = text.lowercased().filter { !$0.isWhitespace } // Remove spaces
        return filteredText == String(filteredText.reversed())
    }


    var body: some View {
        ZStack {
            
            Image("backgroundImage")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack{
                Image(systemName: "person.fill.badge.plus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .padding(50)
                    .background(Circle().fill(Color.white.opacity(0.2)))
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.white)
                    .padding(.bottom, 50)
                
                TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 350, minHeight: 50)
                    .cornerRadius(15)
                TextField("Palindrome", text: $sentence)
                    .frame(maxWidth: 350, minHeight: 50)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(15)
                    .padding(.bottom, 30)

                Button(action: {
                    alertMessage = isPalindrome(sentence) ? "isPalindrome" : "not palindrome"
                    showAlert = true
                }) {
                    Text("Check")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: 350, minHeight: 50)
                        .background(Color(hex: "#2B637B"))
                        .cornerRadius(15)
                }
                .padding(.horizontal)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text(alertMessage))
                }

                NavigationLink(destination: SecondScreen(name: name)) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: 350, minHeight: 50)
                        .background(Color(hex: "#2B637B"))
                        .cornerRadius(15)
                }
                .padding(.horizontal)
            }
        }
        .navigationBarHidden(true)
    }
}
