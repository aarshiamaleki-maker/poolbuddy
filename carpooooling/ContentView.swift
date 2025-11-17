import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Cerca", systemImage: "magnifyingglass")
                }

            Text("Pubblica")
                .tabItem {
                    Label("Pubblica", systemImage: "plus.circle")
                }

            Text("I tuoi viaggi")
                .tabItem {
                    Label("I tuoi viaggi", systemImage: "car.fill")
                }

            Text("Messaggi")
                .tabItem {
                    Label("Messaggi", systemImage: "bubble.left.and.bubble.right")
                }

            Text("Profile")
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
        .tint(.blue)
    }
}

struct HomeView: View {
    @State private var from = "P.za Giuseppe Garibaldi"
    @State private var to = "Caserta CE"
    @State private var date = Date()
    @State private var passengers = 1

    var body: some View {
        ZStack {
            Color(UIColor.systemGroupedBackground)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                ZStack(alignment: .bottom) {
                    Image("carpool_logo")
                        .resizable()
                        .scaledToFill()
                        .scaleEffect(2.8)                       .frame(maxWidth: .infinity)
                        .frame(height: 430)
                        .offset(y: 100)
                    VStack(spacing: 4) {
                        Text("Carpool Buddy")
                            .font(.title)
                            .fontWeight(.bold)

                        Text("Your Ride your way")
                            .font(.subheadline)
                    }
                    .foregroundColor(.white)
                    .shadow(radius: 8)
                    .padding(.bottom, 40)
                }
                .ignoresSafeArea(edges: .top)

                VStack(spacing: 13) {
                    Spacer(minLength: 1)

                    HStack {
                        Image(systemName: "circle")
                            .foregroundColor(.gray)
                        TextField("Partenza", text: $from)
                        Spacer()
                        Image(systemName: "arrow.up.arrow.down")
                            .foregroundColor(.gray)
                    }
                    Divider()

                    HStack {
                        Image(systemName: "circle")
                            .foregroundColor(.gray)
                        TextField("Destinazione", text: $to)
                    }
                    Divider()

                    HStack {
                        Image(systemName: "calendar")
                            .foregroundColor(.gray)

                        DatePicker(
                            "",
                            selection: $date,
                            displayedComponents: .date
                        )
                        .padding(.trailing, 189)
                        .labelsHidden()
                        .fixedSize()
                    }
                    Divider()

                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(.gray)
                        Stepper(value: $passengers, in: 1...6) {
                            Text("\(passengers)")
                        }
                    }

                    Button(action: {
                        print("Searching for rides...")
                    }) {
                        Text("Trova")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding(.top)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(16)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
                .padding(.horizontal)
                .offset(y: -70)
                .padding(.bottom, -70)

                Spacer(minLength: 80)
            }
        }
    }
}

#Preview {
    ContentView()
}
