# Boas Práticas de Desenvolvimento Mobile

## 🎯 Princípios Gerais

### 1. Keep It Simple (KISS)
- Escreva código simples e direto
- Evite over-engineering
- Prefira soluções claras a soluções "inteligentes"

### 2. Don't Repeat Yourself (DRY)
- Extraia código duplicado para funções/componentes
- Use herança e composição apropriadamente
- Crie utilitários reutilizáveis

### 3. Single Responsibility Principle
- Cada classe/função deve ter uma única responsabilidade
- Separe lógica de negócio da apresentação
- Mantenha componentes coesos

### 4. You Aren't Gonna Need It (YAGNI)
- Não adicione funcionalidades "por precaução"
- Implemente apenas o que é necessário agora
- Refatore quando surgir a necessidade real

## 📱 Específicas para Mobile

### Performance

#### Otimize Imagens
```kotlin
// ✅ Bom: Carregue imagens otimizadas
Glide.with(context)
    .load(imageUrl)
    .placeholder(R.drawable.placeholder)
    .error(R.drawable.error)
    .into(imageView)

// ❌ Evitar: Carregar imagens grandes sem otimização
imageView.setImageBitmap(largeBitmap)
```

#### Minimize Operações na Thread Principal
```kotlin
// ✅ Bom: Use coroutines para operações pesadas
lifecycleScope.launch {
    val data = withContext(Dispatchers.IO) {
        database.getData()
    }
    updateUI(data)
}

// ❌ Evitar: Operações de I/O na thread principal
val data = database.getData() // Bloqueia a UI!
updateUI(data)
```

#### Cache de Dados
```kotlin
// ✅ Bom: Implemente cache para reduzir requisições
class DataRepository {
    private var cachedData: List<Item>? = null
    
    suspend fun getData(): List<Item> {
        return cachedData ?: fetchFromNetwork().also {
            cachedData = it
        }
    }
}
```

### Gestão de Memória

#### Evite Memory Leaks
```kotlin
// ✅ Bom: Use lifecycle-aware components
class MyFragment : Fragment() {
    private val viewModel: MyViewModel by viewModels()
    
    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        viewModel.data.observe(viewLifecycleOwner) { data ->
            updateUI(data)
        }
    }
}

// ❌ Evitar: Context leaks
class MyService {
    companion object {
        var context: Context? = null // Memory leak!
    }
}
```

#### Libere Recursos
```kotlin
// ✅ Bom: Sempre feche recursos
class DatabaseHelper(context: Context) {
    private val db = openDatabase()
    
    fun close() {
        db.close()
    }
}

// Use with Closeable
File("data.txt").inputStream().use { stream ->
    // Stream será fechado automaticamente
}
```

### Arquitetura

#### Use Padrões de Arquitetura
```
// MVVM (Model-View-ViewModel)
├── models/
│   └── User.kt
├── viewmodels/
│   └── UserViewModel.kt
├── views/
│   └── UserActivity.kt
└── repositories/
    └── UserRepository.kt

// Clean Architecture
├── data/
│   ├── repositories/
│   └── datasources/
├── domain/
│   ├── entities/
│   └── usecases/
└── presentation/
    ├── viewmodels/
    └── views/
```

#### Separação de Responsabilidades
```kotlin
// ✅ Bom: Lógica separada
class UserViewModel : ViewModel() {
    private val repository = UserRepository()
    
    fun loadUser(id: String) {
        viewModelScope.launch {
            val user = repository.getUser(id)
            _userData.value = user
        }
    }
}

// ❌ Evitar: Lógica no Activity
class UserActivity : AppCompatActivity() {
    fun loadUser(id: String) {
        // Network call direto na Activity!
        val user = api.getUser(id)
        nameTextView.text = user.name
    }
}
```

### Interface e UX

#### Feedback Visual
```kotlin
// ✅ Bom: Mostre loading states
viewModel.uiState.observe(this) { state ->
    when (state) {
        is Loading -> showProgressBar()
        is Success -> showData(state.data)
        is Error -> showError(state.message)
    }
}
```

#### Trate Estados de Erro
```kotlin
// ✅ Bom: Dê opções ao usuário
fun showError(message: String) {
    Snackbar.make(view, message, Snackbar.LENGTH_LONG)
        .setAction("Tentar Novamente") { retry() }
        .show()
}
```

#### Acessibilidade
```xml
<!-- ✅ Bom: Adicione content descriptions -->
<ImageButton
    android:id="@+id/closeButton"
    android:contentDescription="@string/close_button_description"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content" />
```

### Segurança

#### Nunca Commite Credenciais
```kotlin
// ✅ Bom: Use variáveis de ambiente ou BuildConfig
object Config {
    const val API_KEY = BuildConfig.API_KEY
}

// build.gradle
buildTypes {
    release {
        buildConfigField "String", "API_KEY", "\"${System.getenv('API_KEY')}\""
    }
}

// ❌ NUNCA faça isso:
const val API_KEY = "abc123def456" // Credencial hardcoded!
```

#### Valide Inputs
```kotlin
// ✅ Bom: Sempre valide dados do usuário
fun validateEmail(email: String): Boolean {
    return Patterns.EMAIL_ADDRESS.matcher(email).matches()
}

fun login(email: String, password: String) {
    if (!validateEmail(email)) {
        showError("Email inválido")
        return
    }
    // Proceed with login
}
```

#### Use HTTPS
```kotlin
// ✅ Bom: Configure Retrofit com HTTPS
val retrofit = Retrofit.Builder()
    .baseUrl("https://api.example.com/") // HTTPS!
    .addConverterFactory(GsonConverterFactory.create())
    .build()
```

### Testes

#### Escreva Testes Unitários
```kotlin
class UserViewModelTest {
    @Test
    fun `loadUser should update userData`() = runTest {
        val viewModel = UserViewModel(FakeRepository())
        viewModel.loadUser("123")
        
        val user = viewModel.userData.value
        assertEquals("John Doe", user?.name)
    }
}
```

#### Teste Edge Cases
```kotlin
@Test
fun `loadUser with invalid id should show error`() = runTest {
    val viewModel = UserViewModel(FakeRepository())
    viewModel.loadUser("")
    
    assertTrue(viewModel.errorState.value is Error)
}
```

## 🔧 Ferramentas Recomendadas

### Linters e Formatters
- **ktlint** (Kotlin)
- **SwiftLint** (Swift)
- **ESLint** (JavaScript/React Native)

### Análise de Código
- **Android Lint**
- **SonarQube**
- **Detekt**

### Debugging
- **Android Studio Debugger**
- **Xcode Debugger**
- **Flipper** (React Native)
- **Reactotron** (React Native)

## 📚 Recursos de Referência

### Android
- [Android Best Practices](https://developer.android.com/topic/performance)
- [Material Design Guidelines](https://material.io/design)
- [Kotlin Style Guide](https://kotlinlang.org/docs/coding-conventions.html)

### iOS
- [iOS Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/)
- [Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/)

### React Native
- [React Native Performance](https://reactnative.dev/docs/performance)
- [React Best Practices](https://react.dev/learn)

## ✅ Checklist de Qualidade

Antes de submeter seu código, verifique:

### Código
- [ ] Nomes de variáveis e funções são descritivos
- [ ] Não há código comentado ou debug logs
- [ ] Não há código duplicado
- [ ] Funções têm responsabilidade única
- [ ] Código segue convenções da linguagem

### Performance
- [ ] Não há operações pesadas na thread principal
- [ ] Imagens estão otimizadas
- [ ] Há cache quando apropriado
- [ ] Recursos são liberados corretamente

### UI/UX
- [ ] Interface é responsiva
- [ ] Há feedback para ações do usuário
- [ ] Estados de loading e erro são tratados
- [ ] Design segue guidelines da plataforma

### Segurança
- [ ] Não há credenciais no código
- [ ] Inputs são validados
- [ ] Comunicação usa HTTPS
- [ ] Dados sensíveis são protegidos

### Testes
- [ ] Funcionalidades principais têm testes
- [ ] Edge cases são testados
- [ ] Todos os testes passam

---

**Lembre-se:** Boas práticas não são regras absolutas, mas diretrizes que ajudam a criar código melhor, mais mantível e profissional. 🚀
