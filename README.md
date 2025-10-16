🎨 Design System — ReadRadar

O Design System do ReadRadar foi desenvolvido para garantir consistência visual, facilidade de manutenção e reutilização de componentes em todo o aplicativo.
Ele centraliza todas as definições de estilo — cores, tipografia, ícones e componentes — em um único lugar, permitindo que o app mantenha uma identidade visual coesa e moderna.

🧩 Estrutura de Arquivos

O design system é dividido em módulos independentes localizados na pasta:

lib/design_system/


Cada arquivo possui uma função específica:

Arquivo	Função
colors.dart	Define a paleta principal do aplicativo, com cores de fundo, texto, destaque e feedback (erro, sucesso, etc).
typography.dart	Define os estilos tipográficos usados em títulos, subtítulos e textos de corpo, baseados na fonte "Family".
icons.dart	Centraliza todos os ícones utilizados no app, facilitando sua substituição e manutenção.
button.dart	Contém o componente base de botões do ReadRadar, aplicando o tema, cores e tipografia padrão.
card_movie.dart	Define o estilo visual dos cards de livros exibidos nas listas e telas principais do app.
theme.dart	Reúne cores, tipografia e estilos de componentes para compor o tema global (claro e escuro) do aplicativo.
✏️ Tipografia

O ReadRadar utiliza a fonte "Family", mantendo uma hierarquia clara entre os textos:

Estilo	Tamanho	Peso	Uso
Título	14	SemiBold (w600)	Títulos de seções e componentes
Subtítulo	12	Regular (w400)	Textos secundários e descrições
BodyText	10	Regular (w400)	Conteúdo e textos auxiliares
🌈 Cores

A paleta de cores é composta por tons suaves e contrastes equilibrados, visando uma leitura confortável e moderna.
O sistema também é preparado para alternar entre modo claro e escuro, mantendo legibilidade e estética em ambos os temas.

⚙️ Benefícios

🔁 Reutilização de componentes — garante consistência entre as telas

🎯 Padronização visual — mantém a identidade do ReadRadar

🧱 Escalabilidade — fácil de adicionar novos estilos e componentes

⚡ Produtividade — reduz retrabalho e acelera o desenvolvimento de novas features

----------------------------------------------------------------------------------------------------------------------------------------

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

