import SwiftUI

struct SecondScreen: View {
    let name: String
    @State private var selectedUserName = "Selected User Name"

    var body: some View {
        VStack {
            // Align "Welcome" and Name to the Left
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Welcome")
                        .font(.subheadline)
                        .foregroundColor(.black)
                    
                    Text(name)
                        .font(.title)
                        .bold()
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 20)

            Spacer()

            // Centered Selected User Name
            Text(selectedUserName)
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)

            Spacer()

            // Choose a User Button
            NavigationLink(destination: ThirdScreen(selectedUserName: $selectedUserName)) {
                Text("Choose a User")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color(hex: "#2B637B"))
                    .cornerRadius(12)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 30)
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Second Screen")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: BackButton())
    }
}

#Preview {
    SecondScreen(name: "John Doe")
}
