import SwiftUI
import WebKit

// Model
struct Manufacturer: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let contactEmail: String
}

// ViewModel
class ManufacturerViewModel: ObservableObject {
    @Published var manufacturers: [Manufacturer] = [
        Manufacturer(name: "Chicago Steel Works", description: "A family-owned factory on the South Side of Chicago.", contactEmail: "contact@steelworks.com"),
        Manufacturer(name: "West Side Gears", description: "Precision gear manufacturing.", contactEmail: "info@westgears.com"),
        Manufacturer(name: "Urban Metals", description: "Recycling and sheet metal processing company based in Chicago.", contactEmail: "hello@urbanmetals.org"),
        Manufacturer(name:"PepsiCo", description: "A leading global food and beverage company that manufactures, markets, and distributes its products in over 200 countries and territories", contactEmail: "contact@pepsico.com")
    ]
}



// Views

struct ManufacturerListView: View {
    @ObservedObject var viewModel: ManufacturerViewModel

    var body: some View {
        NavigationStack {
            List(viewModel.manufacturers) { manufacturer in
                VStack(alignment: .leading) {
                    Text(manufacturer.name).font(.headline)
                    Text(manufacturer.description).font(.subheadline).foregroundColor(.gray)
                    Text("Email: \(manufacturer.contactEmail)").font(.caption).foregroundColor(.blue)
                }
            }
            .navigationTitle("Manufacturers")
        }
    }
}

struct ContactUsView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var message = ""

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Your Info")) {
                    TextField("Name", text: $name)
                    TextField("Email", text: $email)
                }
                Section(header: Text("Message")) {
                    TextEditor(text: $message)
                        .frame(height: 150)
                }
                Button("Submit") {
                    print("Submitted by \(name)")
                }
            }
            .navigationTitle("Contact Us")
        }
    }
}

struct MembershipWebView: View {
    let url = URL(string: "https://example.com/membership")!

    var body: some View {
        NavigationStack {
        }
    }
}

struct JobBoardView: View {
    let jobs = [
        "Machine Operator – Chicago Steel Works",
        "Quality Assurance – Urban Metals",
        "Maintenance Tech – West Side Gears"
    ]

    var body: some View {
        NavigationStack {
            List(jobs, id: \.self) { job in
                Text(job)
            }
            .navigationTitle("Job Board")
        }
    }
}

// Main App View
struct ContentView: View {
    @StateObject private var viewModel = ManufacturerViewModel()

    var body: some View {
        TabView {
            ManufacturerListView(viewModel: viewModel)
                .tabItem {
                    Label("Directory", systemImage: "building.2")
                }

            MembershipWebView()
                .tabItem {
                    Label("Membership", systemImage: "person.badge.plus")
                }

            JobBoardView()
                .tabItem {
                    Label("Jobs", systemImage: "briefcase")
                }

            ContactUsView()
                .tabItem {
                    Label("Contact", systemImage: "envelope")
                }
        }
    }
}

//App Entry
@main
struct ManufacturingConnectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


