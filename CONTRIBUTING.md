# Guia de Contribuição

## 📋 Submissão de Atividades

### Processo de Submissão

1. **Clone o repositório** (se ainda não o fez):
   ```bash
   git clone https://github.com/marquesclayton/ads5-2026-1.git
   cd ads5-2026-1
   ```

2. **Crie sua branch pessoal**:
   ```bash
   git checkout -b seu-nome-sobrenome
   ```

3. **Desenvolva sua atividade** na pasta correspondente:
   - Navegue até a pasta da atividade (ex: `assignments/assignment-1/`)
   - Crie uma subpasta com seu nome ou siga a estrutura indicada
   - Desenvolva sua solução

4. **Commit suas alterações**:
   ```bash
   git add .
   git commit -m "feat: adiciona assignment X - Seu Nome"
   ```

5. **Push para o repositório**:
   ```bash
   git push origin seu-nome-sobrenome
   ```

6. **Abra um Pull Request**:
   - Acesse o repositório no GitHub
   - Clique em "Pull Requests" → "New Pull Request"
   - Selecione sua branch
   - Preencha o template de PR (veja abaixo)

## 📝 Template de Pull Request

Ao criar um Pull Request, use o seguinte template:

```markdown
## Atividade: [Nome da Atividade]

### Descrição
Breve descrição do que foi implementado.

### Funcionalidades Implementadas
- [ ] Requisito 1
- [ ] Requisito 2
- [ ] Requisito 3

### Como Testar
1. Passo 1
2. Passo 2
3. Resultado esperado

### Screenshots (se aplicável)
[Adicione capturas de tela da aplicação]

### Observações
Qualquer informação adicional relevante.
```

## 💻 Padrões de Código

### Estrutura de Projeto

Organize seu código seguindo as convenções da plataforma:

**Android (Kotlin):**
```
src/
├── main/
│   ├── java/com/seu/pacote/
│   │   ├── MainActivity.kt
│   │   ├── models/
│   │   ├── viewmodels/
│   │   └── views/
│   └── res/
│       ├── layout/
│       ├── values/
│       └── drawable/
```

**iOS (Swift):**
```
ProjectName/
├── Models/
├── Views/
├── ViewControllers/
├── Services/
└── Resources/
```

**React Native:**
```
src/
├── components/
├── screens/
├── navigation/
├── services/
├── utils/
└── App.js
```

### Convenções de Nomenclatura

- **Variáveis e funções:** camelCase (`getUserData`, `isValid`)
- **Classes e componentes:** PascalCase (`UserProfile`, `LoginScreen`)
- **Constantes:** UPPER_SNAKE_CASE (`API_BASE_URL`, `MAX_RETRIES`)
- **Arquivos:** Seguir convenção da plataforma

### Comentários

- Use comentários para explicar **por que**, não **o que**
- Documente funções públicas e classes importantes
- Mantenha comentários atualizados com o código

Exemplo:
```kotlin
// ✅ Bom: explica o motivo
// Validamos o email antes de salvar para evitar dados inválidos no banco
fun validateEmail(email: String): Boolean { ... }

// ❌ Evitar: descreve o óbvio
// Valida o email
fun validateEmail(email: String): Boolean { ... }
```

## 🧪 Testes

- Adicione testes para funcionalidades importantes
- Execute testes antes de fazer commit
- Garanta que todos os testes passem antes de abrir PR

```bash
# Android
./gradlew test

# iOS
xcodebuild test

# React Native
npm test
```

## 📏 Checklist Antes de Submeter

Antes de abrir seu Pull Request, verifique:

- [ ] O código compila sem erros
- [ ] A aplicação roda sem crashes
- [ ] Todos os requisitos da atividade foram implementados
- [ ] O código segue os padrões estabelecidos
- [ ] Comentários e documentação estão adequados
- [ ] Não há código comentado ou debugs esquecidos
- [ ] As credenciais/chaves API não estão no código (use .env)
- [ ] Screenshots foram adicionadas (se UI)

## 🚫 O Que Não Fazer

- ❌ Não commite arquivos de build (`build/`, `*.apk`, `*.ipa`)
- ❌ Não commite dependências (`node_modules/`, `Pods/`)
- ❌ Não commite arquivos de IDE (`.idea/`, `.vscode/`)
- ❌ Não commite chaves de API ou credenciais
- ❌ Não modifique código de outros alunos
- ❌ Não faça commits direto na branch `main`

## 🎨 Boas Práticas de UI/UX

- Siga as diretrizes de design da plataforma (Material Design para Android, Human Interface Guidelines para iOS)
- Teste em diferentes tamanhos de tela
- Garanta acessibilidade (contraste, tamanho de fonte)
- Forneça feedback visual para ações do usuário
- Trate estados de carregamento e erro

## 🐛 Reportando Problemas

Se encontrar bugs ou tiver sugestões:

1. Verifique se já não existe uma issue aberta
2. Abra uma nova issue com:
   - Título descritivo
   - Descrição detalhada do problema
   - Passos para reproduzir
   - Comportamento esperado vs observado
   - Screenshots (se aplicável)
   - Informações do ambiente (OS, versão do SDK, etc.)

## 📞 Obtendo Ajuda

- **Dúvidas técnicas:** Abra uma issue
- **Problemas de configuração:** Consulte `setup-guide.md`
- **Discussões:** Use GitHub Discussions
- **Urgências:** Contate o professor

---

**Lembre-se:** Este é um ambiente de aprendizado. Não tenha medo de errar, experimentar e pedir ajuda! 🚀
