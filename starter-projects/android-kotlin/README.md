# Android Kotlin Starter Project

Este diretório contém templates e projetos iniciais para desenvolvimento Android usando Kotlin.

## 🚀 Começando

### Pré-requisitos
- Android Studio Arctic Fox ou superior
- JDK 11 ou superior
- Android SDK API Level 21+

### Como usar este template

1. Copie este diretório para sua pasta de trabalho
2. Abra o projeto no Android Studio
3. Aguarde a sincronização do Gradle
4. Execute o projeto em um emulador ou dispositivo

## 📱 Estrutura Básica de um App Android

```
app/
├── src/
│   ├── main/
│   │   ├── java/com/exemplo/app/
│   │   │   ├── MainActivity.kt
│   │   │   ├── models/
│   │   │   ├── viewmodels/
│   │   │   └── ui/
│   │   ├── res/
│   │   │   ├── layout/
│   │   │   │   └── activity_main.xml
│   │   │   ├── values/
│   │   │   │   ├── colors.xml
│   │   │   │   ├── strings.xml
│   │   │   │   └── themes.xml
│   │   │   └── drawable/
│   │   └── AndroidManifest.xml
│   └── test/
└── build.gradle
```

## 📖 Conceitos Básicos

### Activity
O ponto de entrada da aplicação. Representa uma tela.

```kotlin
class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }
}
```

### Fragment
Componente reutilizável que representa uma parte da UI.

```kotlin
class MyFragment : Fragment() {
    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.fragment_my, container, false)
    }
}
```

### ViewModel
Gerencia dados relacionados à UI de forma lifecycle-aware.

```kotlin
class MyViewModel : ViewModel() {
    private val _data = MutableLiveData<String>()
    val data: LiveData<String> = _data
    
    fun loadData() {
        _data.value = "Hello, World!"
    }
}
```

## 🎨 UI Components Essenciais

### TextView
```xml
<TextView
    android:id="@+id/textView"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:text="Hello, World!" />
```

### Button
```xml
<Button
    android:id="@+id/button"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:text="Clique aqui" />
```

### EditText
```xml
<EditText
    android:id="@+id/editText"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:hint="Digite algo" />
```

### RecyclerView
```xml
<androidx.recyclerview.widget.RecyclerView
    android:id="@+id/recyclerView"
    android:layout_width="match_parent"
    android:layout_height="match_parent" />
```

## 🔧 Dependências Comuns

Adicione ao `build.gradle (Module: app)`:

```gradle
dependencies {
    // Core
    implementation 'androidx.core:core-ktx:1.12.0'
    implementation 'androidx.appcompat:appcompat:1.6.1'
    implementation 'com.google.android.material:material:1.11.0'
    
    // Lifecycle
    implementation 'androidx.lifecycle:lifecycle-viewmodel-ktx:2.7.0'
    implementation 'androidx.lifecycle:lifecycle-livedata-ktx:2.7.0'
    
    // Navigation
    implementation 'androidx.navigation:navigation-fragment-ktx:2.7.6'
    implementation 'androidx.navigation:navigation-ui-ktx:2.7.6'
    
    // Retrofit (API calls)
    implementation 'com.squareup.retrofit2:retrofit:2.9.0'
    implementation 'com.squareup.retrofit2:converter-gson:2.9.0'
    
    // Coroutines
    implementation 'org.jetbrains.kotlinx:kotlinx-coroutines-android:1.7.3'
    
    // Room (Database)
    implementation 'androidx.room:room-runtime:2.6.1'
    implementation 'androidx.room:room-ktx:2.6.1'
    
    // Image loading
    implementation 'com.github.bumptech.glide:glide:4.16.0'
}
```

## 📚 Recursos

- [Android Developer Guide](https://developer.android.com/guide)
- [Kotlin for Android](https://developer.android.com/kotlin)
- [Material Design Components](https://material.io/develop/android)

## 💡 Próximos Passos

1. Explore o Android Studio
2. Modifique o layout XML
3. Adicione funcionalidades em Kotlin
4. Execute em um emulador
5. Experimente diferentes componentes de UI

---

**Bom desenvolvimento! 🚀**
