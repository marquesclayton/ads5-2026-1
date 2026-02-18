# iOS Swift Starter Project

Este diretório contém templates e projetos iniciais para desenvolvimento iOS usando Swift.

## 🚀 Começando

### Pré-requisitos
- macOS Big Sur ou superior
- Xcode 13 ou superior
- Simulador iOS ou dispositivo físico

### Como usar este template

1. Copie este diretório para sua pasta de trabalho
2. Abra o projeto no Xcode (arquivo .xcodeproj ou .xcworkspace)
3. Selecione um simulador ou dispositivo
4. Clique em Run (⌘ + R)

## 📱 Estrutura Básica de um App iOS

```
MyApp/
├── AppDelegate.swift
├── SceneDelegate.swift
├── ViewControllers/
│   └── ViewController.swift
├── Models/
│   └── DataModel.swift
├── Views/
│   ├── Main.storyboard
│   └── CustomViews/
├── Resources/
│   ├── Assets.xcassets
│   └── LaunchScreen.storyboard
└── Info.plist
```

## 📖 Conceitos Básicos

### UIViewController
O controlador que gerencia uma tela.

```swift
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup inicial
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Preparação antes de aparecer
    }
}
```

### SwiftUI View (alternativa moderna)
```swift
import SwiftUI

struct ContentView: View {
    @State private var name = ""
    
    var body: some View {
        VStack {
            Text("Hello, \(name)!")
            TextField("Enter name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
    }
}
```

### Model
```swift
struct User {
    let id: Int
    let name: String
    let email: String
}
```

### ViewModel (MVVM)
```swift
class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    
    func loadUsers() {
        // Carregar dados
    }
}
```

## 🎨 UI Components Essenciais

### UIKit Components

#### UILabel
```swift
let label = UILabel()
label.text = "Hello, World!"
label.textAlignment = .center
```

#### UIButton
```swift
let button = UIButton(type: .system)
button.setTitle("Clique aqui", for: .normal)
button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
```

#### UITextField
```swift
let textField = UITextField()
textField.placeholder = "Digite algo"
textField.borderStyle = .roundedRect
```

#### UITableView
```swift
let tableView = UITableView()
tableView.delegate = self
tableView.dataSource = self
tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
```

### SwiftUI Components

#### Text
```swift
Text("Hello, World!")
    .font(.title)
    .foregroundColor(.blue)
```

#### Button
```swift
Button("Clique aqui") {
    print("Button tapped!")
}
```

#### TextField
```swift
TextField("Digite algo", text: $inputText)
    .textFieldStyle(RoundedBorderTextFieldStyle())
```

#### List
```swift
List(items) { item in
    Text(item.name)
}
```

## 🔧 Dependências Comuns (CocoaPods)

Crie um arquivo `Podfile`:

```ruby
platform :ios, '14.0'
use_frameworks!

target 'MyApp' do
  # Networking
  pod 'Alamofire', '~> 5.8'
  
  # JSON Parsing
  pod 'SwiftyJSON', '~> 5.0'
  
  # Image Loading
  pod 'SDWebImage', '~> 5.18'
  
  # UI Components
  pod 'SnapKit', '~> 5.6'
  
  # Reactive Programming
  pod 'RxSwift', '~> 6.6'
  pod 'RxCocoa', '~> 6.6'
end
```

Instale com:
```bash
pod install
```

## 🧭 Navegação

### UIKit - Storyboard
```swift
// Push
let nextVC = NextViewController()
navigationController?.pushViewController(nextVC, animated: true)

// Present
let modalVC = ModalViewController()
present(modalVC, animated: true)
```

### SwiftUI - NavigationView
```swift
NavigationView {
    VStack {
        NavigationLink(destination: DetailView()) {
            Text("Go to Detail")
        }
    }
    .navigationTitle("Home")
}
```

## 🌐 Networking

### URLSession
```swift
func fetchData() {
    guard let url = URL(string: "https://api.example.com/data") else { return }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data, error == nil else {
            print("Error: \(error?.localizedDescription ?? "Unknown")")
            return
        }
        
        // Parse data
        do {
            let result = try JSONDecoder().decode([Item].self, from: data)
            DispatchQueue.main.async {
                // Update UI
            }
        } catch {
            print("Decoding error: \(error)")
        }
    }.resume()
}
```

### Alamofire
```swift
import Alamofire

AF.request("https://api.example.com/data").responseDecodable(of: [Item].self) { response in
    switch response.result {
    case .success(let items):
        print("Got \(items.count) items")
    case .failure(let error):
        print("Error: \(error)")
    }
}
```

## 💾 Persistência de Dados

### UserDefaults
```swift
// Save
UserDefaults.standard.set("John", forKey: "username")

// Load
let username = UserDefaults.standard.string(forKey: "username")
```

### Core Data
```swift
// Create
let context = persistentContainer.viewContext
let user = User(context: context)
user.name = "John"
try? context.save()

// Fetch
let request: NSFetchRequest<User> = User.fetchRequest()
let users = try? context.fetch(request)
```

## 📚 Recursos

- [Swift Programming Language](https://docs.swift.org/swift-book/)
- [iOS Development Guide](https://developer.apple.com/documentation/)
- [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/)
- [SwiftUI Tutorials](https://developer.apple.com/tutorials/swiftui)

## 💡 Próximos Passos

1. Familiarize-se com o Xcode
2. Experimente com SwiftUI Previews
3. Crie suas próprias Views
4. Explore o Interface Builder (Storyboards)
5. Aprenda Auto Layout para layouts responsivos

## 🎯 Dicas

- Use `print()` para debug
- Aproveite o Xcode Playground para experimentar código
- Use Swift Package Manager para dependências modernas
- Siga as Human Interface Guidelines da Apple
- Teste em diferentes tamanhos de iPhone

---

**Bom desenvolvimento! 🚀**
