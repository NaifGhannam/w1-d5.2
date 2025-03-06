import SwiftUI

struct ContentView: View {
    // State variables to manage user input and UI changes
    @State private var name: String = ""
    @State private var displayedName: String = "Your name will appear here"
    @State private var isDarkMode: Bool = false
    
    var body: some View {
        ZStack {
            // Background color changes based on dark mode toggle
            (isDarkMode ? Color.black : Color.white)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                // TextField for user input
                TextField("Enter your name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .foregroundColor(isDarkMode ? .white : .black)
                
                // Button to update the displayed name
                Button(action: {
                    displayedName = "Hello, \(name)!"
                }) {
                    Text("Submit")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                // Label to display the entered name
                Text(displayedName)
                    .font(.title)
                    .foregroundColor(isDarkMode ? .white : .black)
                
                // Toggle to switch between light and dark mode
                Toggle("Dark Mode", isOn: $isDarkMode)
                    .padding()
                    .foregroundColor(isDarkMode ? .white : .black)
            }
            .padding()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
