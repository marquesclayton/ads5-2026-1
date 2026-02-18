# React Native Starter Project

Este diretório contém templates e projetos iniciais para desenvolvimento cross-platform usando React Native.

## 🚀 Começando

### Pré-requisitos
- Node.js 14 ou superior
- npm ou yarn
- Para Android: Android Studio e Android SDK
- Para iOS: macOS com Xcode (apenas em Mac)

### Como usar este template

#### Opção 1: React Native CLI
```bash
npx react-native init MyApp
cd MyApp
npx react-native run-android  # ou run-ios
```

#### Opção 2: Expo (Recomendado para iniciantes)
```bash
npx create-expo-app MyApp
cd MyApp
npx expo start
```

## 📱 Estrutura Básica de um App React Native

```
src/
├── App.js                    # Componente principal
├── components/               # Componentes reutilizáveis
│   ├── Button.js
│   └── Card.js
├── screens/                  # Telas do app
│   ├── HomeScreen.js
│   └── DetailScreen.js
├── navigation/               # Configuração de navegação
│   └── AppNavigator.js
├── services/                 # APIs e serviços
│   └── api.js
├── utils/                    # Utilitários
│   └── helpers.js
├── assets/                   # Imagens, fontes, etc
└── styles/                   # Estilos globais
    └── colors.js
```

## 📖 Conceitos Básicos

### Componente Funcional
```javascript
import React, { useState } from 'react';
import { View, Text, Button } from 'react-native';

const MyComponent = () => {
  const [count, setCount] = useState(0);
  
  return (
    <View>
      <Text>Você clicou {count} vezes</Text>
      <Button 
        title="Clique aqui" 
        onPress={() => setCount(count + 1)} 
      />
    </View>
  );
};

export default MyComponent;
```

### Props
```javascript
const Greeting = ({ name }) => {
  return <Text>Olá, {name}!</Text>;
};

// Uso
<Greeting name="João" />
```

### State com Hooks
```javascript
const [text, setText] = useState('');
const [loading, setLoading] = useState(false);
const [data, setData] = useState(null);
```

### useEffect
```javascript
useEffect(() => {
  // Executa quando o componente monta
  fetchData();
  
  // Cleanup (executa quando desmonta)
  return () => {
    cleanup();
  };
}, []); // Array de dependências vazio = executa uma vez
```

## 🎨 Componentes Essenciais

### View
Container básico - equivalente a div no web.

```javascript
<View style={styles.container}>
  {/* Conteúdo */}
</View>
```

### Text
Exibir texto - todo texto deve estar dentro de Text.

```javascript
<Text style={styles.title}>
  Hello, World!
</Text>
```

### Image
Exibir imagens.

```javascript
// Imagem local
<Image source={require('./assets/logo.png')} />

// Imagem remota
<Image 
  source={{ uri: 'https://example.com/image.jpg' }}
  style={{ width: 200, height: 200 }}
/>
```

### Button
Botão básico.

```javascript
<Button
  title="Clique aqui"
  onPress={() => console.log('Clicado!')}
  color="#841584"
/>
```

### TouchableOpacity
Botão customizável.

```javascript
<TouchableOpacity 
  style={styles.button}
  onPress={handlePress}
>
  <Text style={styles.buttonText}>Custom Button</Text>
</TouchableOpacity>
```

### TextInput
Campo de entrada de texto.

```javascript
<TextInput
  style={styles.input}
  placeholder="Digite algo"
  value={text}
  onChangeText={setText}
/>
```

### FlatList
Lista otimizada para grandes conjuntos de dados.

```javascript
<FlatList
  data={items}
  keyExtractor={(item) => item.id}
  renderItem={({ item }) => (
    <Text>{item.name}</Text>
  )}
/>
```

### ScrollView
Container com scroll.

```javascript
<ScrollView>
  {/* Conteúdo que pode fazer scroll */}
</ScrollView>
```

## 🎨 Styling

### StyleSheet
```javascript
import { StyleSheet } from 'react-native';

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#333',
  },
});
```

### Flexbox (padrão)
```javascript
container: {
  flex: 1,
  flexDirection: 'column',  // 'row', 'column'
  justifyContent: 'center', // 'flex-start', 'flex-end', 'space-between'
  alignItems: 'center',     // 'flex-start', 'flex-end', 'stretch'
}
```

## 🧭 Navegação (React Navigation)

### Instalação
```bash
npm install @react-navigation/native
npm install @react-navigation/native-stack
npm install react-native-screens react-native-safe-area-context
```

### Stack Navigator
```javascript
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';

const Stack = createNativeStackNavigator();

function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen name="Home" component={HomeScreen} />
        <Stack.Screen name="Details" component={DetailsScreen} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}
```

### Navegação entre telas
```javascript
// Ir para outra tela
navigation.navigate('Details', { itemId: 42 });

// Voltar
navigation.goBack();

// Receber parâmetros
const { itemId } = route.params;
```

## 🌐 API Calls

### Fetch API
```javascript
const fetchData = async () => {
  try {
    setLoading(true);
    const response = await fetch('https://api.example.com/data');
    const json = await response.json();
    setData(json);
  } catch (error) {
    console.error(error);
  } finally {
    setLoading(false);
  }
};
```

### Axios
```bash
npm install axios
```

```javascript
import axios from 'axios';

const api = axios.create({
  baseURL: 'https://api.example.com',
});

const fetchData = async () => {
  try {
    const response = await api.get('/data');
    setData(response.data);
  } catch (error) {
    console.error(error);
  }
};
```

## 💾 Persistência de Dados

### AsyncStorage
```bash
npm install @react-native-async-storage/async-storage
```

```javascript
import AsyncStorage from '@react-native-async-storage/async-storage';

// Salvar
await AsyncStorage.setItem('username', 'John');

// Carregar
const username = await AsyncStorage.getItem('username');

// Remover
await AsyncStorage.removeItem('username');
```

## 🔧 Bibliotecas Úteis

```bash
# Navegação
npm install @react-navigation/native @react-navigation/native-stack

# State Management
npm install zustand  # ou redux, recoil, mobx

# Formulários
npm install react-hook-form

# Ícones
npm install react-native-vector-icons

# Date/Time
npm install date-fns

# Image Picker
npm install react-native-image-picker

# Maps
npm install react-native-maps
```

## 📦 Package.json Básico

```json
{
  "name": "MyApp",
  "version": "1.0.0",
  "scripts": {
    "start": "expo start",
    "android": "expo start --android",
    "ios": "expo start --ios",
    "web": "expo start --web"
  },
  "dependencies": {
    "react": "^18.2.0",
    "react-native": "^0.73.0",
    "@react-navigation/native": "^6.1.0",
    "@react-navigation/native-stack": "^6.9.0",
    "axios": "^1.6.0"
  },
  "devDependencies": {
    "@babel/core": "^7.23.0"
  }
}
```

## 📚 Recursos

- [React Native Documentation](https://reactnative.dev/docs/getting-started)
- [Expo Documentation](https://docs.expo.dev/)
- [React Navigation](https://reactnavigation.org/)
- [React Hooks](https://react.dev/reference/react)

## 💡 Próximos Passos

1. Crie um novo projeto com Expo ou React Native CLI
2. Explore os componentes básicos
3. Configure a navegação
4. Faça uma chamada de API
5. Adicione persistência de dados
6. Experimente com styling

## 🎯 Dicas

- Use Expo Snack para testar código online
- Habilite Fast Refresh para ver mudanças instantaneamente
- Use React DevTools para debug
- Teste em dispositivos reais quando possível
- Siga as diretrizes de UI de cada plataforma
- Use TypeScript para projetos maiores

## 🐛 Debugging

```bash
# Abrir o menu de desenvolvimento
# Android: Cmd+M (Mac) ou Ctrl+M (Windows/Linux)
# iOS: Cmd+D

# Ver logs
npx react-native log-android
npx react-native log-ios

# Limpar cache
npx react-native start --reset-cache
```

---

**Bom desenvolvimento! 🚀**
