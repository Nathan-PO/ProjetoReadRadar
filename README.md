# 📚 ReadRadar

ReadRadar é um aplicativo Flutter para explorar, favoritar e salvar livros para leitura posterior. Desenvolvido como parte de um projeto acadêmico, o app simula um radar literário, permitindo ao usuário buscar livros, marcar como favoritos e organizar leituras.

## 🚀 Funcionalidades

- 🔍 **Busca de Livros** — Permite pesquisar livros pelo nome.
- ❤️ **Favoritar Livros** — Salve seus livros favoritos com um toque.
- 📌 **Ler Depois** — Marque livros para ler depois, com sistema independente dos favoritos.
- 📖 **Detalhes do Livro** — Veja informações completas sobre o livro selecionado.
- ⚙️ **Configurações** — Altere o tema (claro/escuro) e personalize o nome de usuário.
- 💾 **Persistência Local** — Os dados de favoritos e "ler depois" são salvos localmente com `shared_preferences`.


## 🛠️ Tecnologias

- **Flutter**
- **Dart**
- `shared_preferences` para armazenamento local
- Organização modular por:
  - `/models`
  - `/screens`
  - `/widgets`
  - `/data`
  - `/services`

## 🗂️ Estrutura de Pastas

```

lib/
├── data/
│   └── books\_data.dart
├── models/
│   └── book.dart
├── screens/
│   ├── book\_details\_screen.dart
│   ├── favorites\_screen.dart
│   ├── home\_screen.dart
│   ├── saved\_screen.dart
│   ├── settings\_screen.dart
├── services/
│   └── book\_api\_service.dart
├── widgets/
│   └── book\_card.dart
├── main.dart

````

## 📦 Instalação

1. **Clone o repositório:**

```bash
git clone https://github.com/seu-usuario/readradar.git
cd readradar
````

2. **Instale as dependências:**

```bash
flutter pub get
```

3. **Execute o app:**

```bash
flutter run
```

> Certifique-se de ter o Flutter instalado e configurado corretamente.
> Caso ainda não tenha, consulte: [flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)

## 🙋‍♂️ Autor

Desenvolvido por **Nathan Lacerda** como projeto acadêmico.
Sinta-se livre para contribuir, testar ou deixar sugestões!

---

## 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.

