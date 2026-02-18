# Guia de Configuração do Ambiente

Este guia fornece instruções detalhadas para configurar seu ambiente de desenvolvimento móvel.

## 📱 Escolha sua Plataforma

Você pode desenvolver para:
- **Android** - Disponível em Windows, macOS e Linux
- **iOS** - Requer macOS
- **React Native** - Desenvolvimento cross-platform
- **Flutter** - Desenvolvimento cross-platform (alternativa)

## 🤖 Configuração para Android

### 1. Instalar o Java Development Kit (JDK)

**Windows/Linux:**
1. Baixe o [JDK 11 ou superior](https://www.oracle.com/java/technologies/downloads/)
2. Execute o instalador
3. Configure a variável de ambiente `JAVA_HOME`

**macOS:**
```bash
brew install openjdk@11
```

### 2. Instalar Android Studio

1. Baixe o [Android Studio](https://developer.android.com/studio)
2. Execute o instalador
3. Siga o wizard de configuração
4. Instale os componentes recomendados:
   - Android SDK
   - Android SDK Platform
   - Android Virtual Device (AVD)

### 3. Configurar Android SDK

1. Abra Android Studio
2. Vá em **Tools → SDK Manager**
3. Na aba **SDK Platforms**, instale:
   - Android 13.0 (API Level 33)
   - Android 11.0 (API Level 30)
4. Na aba **SDK Tools**, instale:
   - Android SDK Build-Tools
   - Android Emulator
   - Android SDK Platform-Tools

### 4. Configurar Variáveis de Ambiente

**Windows:**
```
ANDROID_HOME = C:\Users\SeuUsuario\AppData\Local\Android\Sdk
Path += %ANDROID_HOME%\platform-tools
Path += %ANDROID_HOME%\tools
```

**macOS/Linux:**
Adicione ao `~/.bashrc` ou `~/.zshrc`:
```bash
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools
```

### 5. Criar um Emulador Android

1. Abra Android Studio
2. Vá em **Tools → AVD Manager**
3. Clique em **Create Virtual Device**
4. Selecione um dispositivo (ex: Pixel 5)
5. Selecione uma imagem do sistema (ex: API 33)
6. Configure as opções e finalize

### 6. Testar a Instalação

```bash
# Verificar Android SDK
adb version

# Listar dispositivos conectados
adb devices
```

## 🍎 Configuração para iOS

> **Nota:** Desenvolvimento iOS requer um Mac com macOS 11 (Big Sur) ou superior.

### 1. Instalar Xcode

1. Abra a **App Store**
2. Busque por "Xcode"
3. Clique em **Obter/Instalar**
4. Aguarde a instalação (pode demorar, arquivo grande ~12GB)

### 2. Instalar Command Line Tools

```bash
xcode-select --install
```

### 3. Instalar CocoaPods

```bash
sudo gem install cocoapods
pod setup
```

### 4. Configurar Simulador iOS

1. Abra o Xcode
2. Vá em **Window → Devices and Simulators**
3. Crie um novo simulador se necessário
4. Ou use: `open -a Simulator`

### 5. Testar a Instalação

```bash
# Verificar versão do Xcode
xcodebuild -version

# Listar simuladores disponíveis
xcrun simctl list devices
```

## ⚛️ Configuração para React Native

### 1. Instalar Node.js

**Windows/macOS/Linux:**
1. Baixe o [Node.js LTS](https://nodejs.org/)
2. Execute o instalador
3. Verifique: `node --version` e `npm --version`

**macOS (alternativa com Homebrew):**
```bash
brew install node
```

### 2. Instalar React Native CLI

```bash
npm install -g react-native-cli
```

Ou use **Expo CLI** para começar mais rápido:
```bash
npm install -g expo-cli
```

### 3. Configurar Ambiente Nativo

Para build nativo, você ainda precisa configurar:
- **Android:** Siga os passos da seção Android acima
- **iOS:** Siga os passos da seção iOS acima (apenas macOS)

### 4. Criar Projeto de Teste

**Com React Native CLI:**
```bash
npx react-native init TestApp
cd TestApp
npx react-native run-android  # ou run-ios
```

**Com Expo:**
```bash
expo init TestApp
cd TestApp
expo start
```

## 🐦 Configuração para Flutter (Opcional)

### 1. Instalar Flutter SDK

**macOS/Linux:**
```bash
# Baixe o Flutter SDK
git clone https://github.com/flutter/flutter.git -b stable

# Adicione ao PATH
export PATH="$PATH:`pwd`/flutter/bin"
```

**Windows:**
1. Baixe o [Flutter SDK](https://flutter.dev/docs/get-started/install/windows)
2. Extraia o arquivo
3. Adicione `flutter\bin` ao PATH

### 2. Executar Flutter Doctor

```bash
flutter doctor
```

Este comando verifica seu ambiente e mostra o que está faltando.

### 3. Instalar Dependências

Siga as instruções do `flutter doctor` para:
- Android Studio / Android SDK
- Xcode (macOS)
- VS Code ou Android Studio plugins

## 🔧 IDEs Recomendadas

### Android Studio
- Melhor para desenvolvimento Android nativo
- Suporte completo para Kotlin/Java
- Emulador integrado

### Xcode
- Essencial para desenvolvimento iOS
- Interface Builder para UI
- Simulador iOS integrado

### Visual Studio Code
- Leve e rápido
- Excelente para React Native e Flutter
- Extensões recomendadas:
  - React Native Tools
  - Flutter
  - Dart
  - ES7+ React/Redux/React-Native snippets

### IntelliJ IDEA
- Alternativa ao Android Studio
- Suporte multi-plataforma

## 🧪 Verificação Final

Execute estes comandos para verificar sua instalação:

```bash
# Java
java -version

# Android
adb version
android --version  # ou sdkmanager --list

# iOS (macOS apenas)
xcodebuild -version

# Node.js
node --version
npm --version

# React Native
npx react-native --version

# Flutter (se instalado)
flutter doctor
```

## ❓ Problemas Comuns

### Android Studio não encontra o SDK
- Verifique as variáveis de ambiente `ANDROID_HOME`
- Reinstale o SDK através do SDK Manager

### Emulador Android muito lento
- Habilite a virtualização (VT-x/AMD-V) na BIOS
- Use uma imagem x86 em vez de ARM
- Aloque mais RAM para o emulador

### Erro de permissão no macOS
- Use `sudo` quando necessário
- Verifique permissões com `ls -la`

### React Native não encontra o Android SDK
- Verifique `ANDROID_HOME` no arquivo `~/.bashrc` ou `~/.zshrc`
- Execute `source ~/.bashrc` ou `source ~/.zshrc`

### Pod install falha no iOS
```bash
cd ios
pod deintegrate
pod install
```

## 📚 Recursos Adicionais

- [Android Developer Guide](https://developer.android.com/guide)
- [iOS Development Guide](https://developer.apple.com/documentation/)
- [React Native Documentation](https://reactnative.dev/docs/getting-started)
- [Flutter Documentation](https://flutter.dev/docs)

## 🆘 Precisa de Ajuda?

Se você encontrou problemas não listados aqui:
1. Consulte a documentação oficial da plataforma
2. Busque no Stack Overflow
3. Abra uma issue neste repositório
4. Peça ajuda ao professor ou colegas

---

**Bom desenvolvimento! 🚀**
