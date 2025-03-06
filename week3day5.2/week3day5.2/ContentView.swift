import SwiftUI


struct NameInputView: View {
    @Binding var name: String  // Binding for user input
    @Binding var displayedName: String  // Binding for the displayed name
    
    var body: some View {
        VStack {
            // TextField for user to enter their name
            TextField("Enter your name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
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
        }
    }
}

// Main ContentView
struct ContentView: View {
    @State private var name: String = ""  
    @State private var displayedName: String = "Your name will appear here"  
    @State private var isDarkMode: Bool = false  // Controls dark mode toggle
    
    var body: some View {
        ZStack {
            // Background color changes based on the toggle state
            (isDarkMode ? Color.black : Color.white)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                // Pass state variables to NameInputView using @Binding
                NameInputView(name: $name, displayedName: $displayedName)
                
                // Display the updated name
                Text(displayedName)
                    .font(.title)
                    .foregroundColor(isDarkMode ? .white : .black)
                
                // Toggle to switch between dark and light mode
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
