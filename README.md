📚 ReadRadar - O Teu Radar Literário

Aplicação Flutter para descoberta e gestão de livros, desenvolvida com foco em Arquitetura Limpa e Design System.

📱 Sobre o Projeto

O ReadRadar é uma aplicação móvel que permite aos utilizadores pesquisar livros, visualizar detalhes, explorar categorias e gerir uma lista de favoritos. O projeto foi desenvolvido como um trabalho académico para demonstrar competências avançadas em engenharia de software móvel, incluindo a implementação de um Design System completo e o padrão arquitetural MVVM-C (Model-View-ViewModel-Coordinator).

✨ Funcionalidades Principais

🔍 Busca em Tempo Real: Integração com a Google Books API para pesquisar milhares de títulos.

❤️ Gestão de Favoritos: Persistência de dados local (Shared Preferences) para guardar livros favoritos offline.

🎨 Design System Completo: Componentes reutilizáveis, tipografia centralizada e paleta de cores semântica.

🌙 Tema Claro e Escuro: Suporte total a Dark Mode, adaptando todos os componentes automaticamente.

🚀 Navegação Fluida: Uso de animações Hero para transições suaves entre lista e detalhes.

🗂️ Categorias: Filtros rápidos por género (Tecnologia, Ficção, Romance, etc.).

🔐 Autenticação: Fluxo de Login, Registo e Recuperação de Senha (Simulado).

🛠️ Arquitetura e Tecnologias

O projeto segue rigorosamente o padrão MVVM-C para garantir a separação de responsabilidades e testabilidade.

Tecnologias

Linguagem: Dart

Framework: Flutter (3.x)

Gerenciamento de Estado: ChangeNotifier / AnimatedBuilder (Nativo)

Persistência: shared_preferences

Requisições HTTP: http

Estrutura MVVM-C

Model: Definição dos dados (Book) e lógica de parsing JSON.

View: Camada de UI passiva (Screens), responsável apenas por desenhar o estado.

ViewModel: Gerencia a lógica de negócios e o estado da tela (HomeViewModel, FavoritesViewModel).

Coordinator: Gerencia a navegação e o fluxo entre telas, centralizado no main.dart.

Factory: Padrão de criação para injetar dependências nas Views (DashboardFactory).

🎨 Design System

O projeto implementa um Design System customizado baseado em Atomic Design, localizado na pasta lib/Design_system.

Estrutura

Tokens (Shared):

colors.dart: Paleta de cores semântica (AppColors.primary, AppColors.surface(isDark)).

styles.dart: Tipografia e espaçamentos padronizados (AppTypography.h1, AppSpacings.m).

Componentes:

PrimaryButton: Botões com suporte a loading e outline.

CustomInput: Campos de texto adaptáveis ao tema.

BookCard: Cartão de exibição de livro com sombra e animação Hero.

Nota: A aplicação inclui uma tela dedicada ("UI Kit") para visualizar e documentar todos os componentes do Design System.

📂 Estrutura de Pastas

lib/
├── Application/
│   ├── Factories/      # Criação de telas e injeção de dependências
│   ├── Models/         # Modelos de dados (Book)
│   ├── Screens/        # Telas (UI)
│   ├── Services/       # API e Persistência Local
│   └── ViewModels/     # Lógica de Estado (ChangeNotifier)
├── Design_system/
│   ├── Components/     # Widgets Reutilizáveis (Botões, Inputs, Cards)
│   └── Shared/         # Tokens de Estilo (Cores, Tipografia)
└── main.dart           # Ponto de Entrada e Coordinator


🚀 Como Executar

Clone o repositório:

git clone [https://github.com/Nathan-PO/ProjetoReadRadar.git](https://github.com/Nathan-PO/ProjetoReadRadar.git)


Instale as dependências:

flutter pub get


Execute o projeto:

flutter run


👨‍💻 Autor

Desenvolvido por Nathan Lacerda como parte de um projeto universitário de Desenvolvimento Mobile.
