import SwiftUI

struct ThirdScreen: View {
    @StateObject private var viewModel = UserViewModel()
    @Binding var selectedUserName: String

    var body: some View {
        VStack {
            List {
                ForEach(viewModel.users) { user in
                    HStack(spacing: 12) {
                        AsyncImage(url: URL(string: user.avatar)) { image in
                            image.resizable().scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())

                        VStack(alignment: .leading, spacing: 4) {
                            Text("\(user.first_name) \(user.last_name)")
                                .font(.headline)
                                .foregroundColor(.black)
                            
                            Text(user.email)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }

                        Spacer()
                    }
                    .padding(.vertical, 8)
                    .onTapGesture {
                        DispatchQueue.main.async {
                            selectedUserName = "\(user.first_name) \(user.last_name)"
                        }
                    }
                }
                
                if viewModel.isLoading {
                    ProgressView()
                }
            }
            .listStyle(.plain)
            .onAppear { viewModel.fetchUsers() }
            .refreshable { viewModel.fetchUsers() }
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Third Screen")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: BackButton())
    }
}
