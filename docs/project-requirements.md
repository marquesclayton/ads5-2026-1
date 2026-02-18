# Requisitos de Projetos

## 📋 Requisitos Gerais

Todos os projetos desenvolvidos nesta disciplina devem atender aos seguintes requisitos mínimos:

### Requisitos Técnicos

#### 1. Funcionalidade
- ✅ Aplicação deve executar sem crashes
- ✅ Todas as funcionalidades solicitadas devem estar implementadas
- ✅ Tratamento adequado de erros e exceções
- ✅ Validação de inputs do usuário

#### 2. Interface do Usuário
- ✅ Interface intuitiva e fácil de usar
- ✅ Feedback visual para ações do usuário
- ✅ Estados de loading e erro bem tratados
- ✅ Design responsivo para diferentes tamanhos de tela
- ✅ Segue diretrizes da plataforma:
  - **Android**: Material Design
  - **iOS**: Human Interface Guidelines

#### 3. Arquitetura e Organização
- ✅ Código bem estruturado e organizado
- ✅ Separação de responsabilidades (Model-View-ViewModel, MVC, etc.)
- ✅ Nomes de variáveis e funções descritivos
- ✅ Sem código duplicado

#### 4. Performance
- ✅ Não há operações pesadas na thread principal
- ✅ Carregamento eficiente de imagens e dados
- ✅ Uso apropriado de cache quando necessário
- ✅ Gestão adequada de memória

#### 5. Segurança
- ✅ Não há credenciais hardcoded no código
- ✅ Comunicação segura (HTTPS)
- ✅ Validação de dados do usuário
- ✅ Tratamento seguro de dados sensíveis

#### 6. Documentação
- ✅ README.md completo com instruções
- ✅ Comentários no código onde necessário
- ✅ Screenshots da aplicação
- ✅ Documentação de APIs utilizadas

### Requisitos de Entrega

#### Estrutura do Repositório
```
assignments/
└── nome-do-projeto/
    ├── README.md
    ├── src/
    ├── docs/
    │   └── [documentação adicional]
    ├── screenshots/
    │   └── [capturas de tela]
    └── [arquivos do projeto]
```

#### README.md Obrigatório
```markdown
# Nome do Projeto

## Descrição
Breve descrição do projeto

## Funcionalidades
- Lista de funcionalidades implementadas

## Tecnologias
- Linguagens e frameworks utilizados

## Como Executar
Passo a passo para executar o projeto

## Screenshots
Imagens da aplicação

## Autor
Seu nome

## Licença
Informações de licença
```

## 🎯 Requisitos por Tipo de Projeto

### Projeto Básico (Hello World / Primeiro App)

**Funcionalidades Mínimas:**
- Interface com pelo menos 2 telas
- Navegação entre telas
- Componentes básicos de UI (botões, textos, imagens)
- Interação com o usuário (cliques, inputs)

**Tecnologias:**
- Linguagem nativa da plataforma (Kotlin/Swift) ou React Native
- UI toolkit padrão da plataforma

**Duração Estimada:** 1-2 semanas

### Projeto Intermediário (App com API)

**Funcionalidades Mínimas:**
- Todas do projeto básico, mais:
- Integração com API REST
- Listagem de dados em lista/grid
- Detalhes de item individual
- Tratamento de estados (loading, success, error)
- Persistência local básica (SharedPreferences/UserDefaults)

**Tecnologias:**
- HTTP client (Retrofit, Alamofire, Axios)
- JSON parsing
- Armazenamento local

**Duração Estimada:** 2-3 semanas

### Projeto Avançado (App Completo)

**Funcionalidades Mínimas:**
- Todas dos projetos anteriores, mais:
- Autenticação de usuário
- CRUD completo (Create, Read, Update, Delete)
- Banco de dados local (Room, Core Data, SQLite)
- Upload de imagens/arquivos
- Notificações push (opcional)
- Múltiplos fluxos de navegação
- Temas/personalização

**Tecnologias:**
- Banco de dados local
- Sistema de autenticação
- Gerenciamento de estado avançado
- Arquitetura definida (MVVM, Clean Architecture)

**Duração Estimada:** 4-6 semanas

### Projeto Final (Capstone)

**Requisitos Completos:**
- App completo e funcional
- Pelo menos 5 telas distintas
- Integração com API real ou backend próprio
- Autenticação e autorização
- Persistência de dados local e remota
- Tratamento robusto de erros
- Testes unitários (mínimo 50% de cobertura)
- UI/UX polida e profissional
- Documentação completa
- Vídeo demo (2-3 minutos)

**Entregáveis:**
- Código fonte completo
- Documentação técnica
- Manual do usuário
- Vídeo demonstração
- Apresentação (slides)
- APK/IPA para testes (opcional)

**Duração Estimada:** 6-8 semanas

## 📊 Critérios de Avaliação Detalhados

### Funcionalidade (40%)
| Critério | Peso | Descrição |
|----------|------|-----------|
| Completude | 15% | Todos os requisitos implementados |
| Correção | 15% | Funciona sem erros |
| Robustez | 10% | Tratamento de edge cases |

### Qualidade do Código (30%)
| Critério | Peso | Descrição |
|----------|------|-----------|
| Organização | 10% | Estrutura clara do projeto |
| Legibilidade | 10% | Código fácil de entender |
| Boas Práticas | 10% | Segue padrões da plataforma |

### UI/UX (15%)
| Critério | Peso | Descrição |
|----------|------|-----------|
| Design | 7% | Visual atraente |
| Usabilidade | 8% | Fácil de usar |

### Documentação (10%)
| Critério | Peso | Descrição |
|----------|------|-----------|
| README | 5% | Completo e claro |
| Código | 3% | Comentários apropriados |
| Screenshots | 2% | Ilustram funcionalidades |

### Extras (5%)
| Critério | Peso | Descrição |
|----------|------|-----------|
| Criatividade | 3% | Soluções inovadoras |
| Funcionalidades Extras | 2% | Além do solicitado |

## ✅ Checklist de Submissão

Antes de submeter seu projeto, verifique:

### Código
- [ ] Compila sem erros
- [ ] Executa sem crashes
- [ ] Todos os requisitos implementados
- [ ] Código bem formatado
- [ ] Sem código comentado
- [ ] Sem logs de debug
- [ ] .gitignore configurado

### Documentação
- [ ] README.md completo
- [ ] Instruções de execução claras
- [ ] Screenshots incluídas
- [ ] Comentários no código

### Funcionalidade
- [ ] Todas as telas funcionam
- [ ] Navegação funciona corretamente
- [ ] API integration funciona (se aplicável)
- [ ] Tratamento de erros funciona
- [ ] App funciona em diferentes tamanhos de tela

### Segurança
- [ ] Sem credenciais no código
- [ ] Validação de inputs
- [ ] Comunicação segura

### Performance
- [ ] App responde rapidamente
- [ ] Sem operações na thread principal
- [ ] Imagens otimizadas

## 🚨 Problemas Comuns a Evitar

1. **Código não compila**: Sempre teste antes de submeter
2. **App crasha ao abrir**: Teste em dispositivo limpo
3. **README incompleto**: Use o template fornecido
4. **Sem .gitignore**: Não commite arquivos desnecessários
5. **Credenciais no código**: Use variáveis de ambiente
6. **Sem tratamento de erros**: Sempre valide e trate erros
7. **UI não responsiva**: Teste em diferentes dispositivos
8. **Faltam screenshots**: Essencial para avaliação

## 💡 Dicas para Sucesso

1. **Planeje antes de codificar**: Faça um esboço das telas e fluxos
2. **Desenvolva incrementalmente**: Uma funcionalidade de cada vez
3. **Teste constantemente**: Não deixe para testar no final
4. **Peça feedback cedo**: Mostre protótipos ao professor
5. **Use controle de versão**: Commits frequentes e descritivos
6. **Documente enquanto desenvolve**: Não deixe para o final
7. **Mantenha backup**: Use Git e serviços de cloud

## 📞 Precisa de Ajuda?

- **Dúvidas sobre requisitos**: Abra uma issue
- **Problemas técnicos**: Consulte as docs ou peça ajuda
- **Ideias para projeto final**: Discuta com o professor

---

**Sucesso no seu projeto! 🚀**
