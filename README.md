# Flutter Clean Architecture Posts App

This Flutter project demonstrates the use of Clean Architecture to build a mobile application that performs CRUD operations on posts via a REST API. The app showcases state management with Cubit, dependency injection, and effective testing practices.

## Features

- List all posts
- View individual post details
- Create new posts
- Update existing posts
- Delete posts

## Architecture

This project follows the principles of Clean Architecture with the following layers:

- **Presentation Layer**: Consists of screens and widgets that display the UI. This layer uses Cubit for state management.
- **Domain Layer**: Includes entities, use cases, and repositories interfaces. This layer is purely abstract and contains the business logic of the application.
- **Data Layer**: Comprises the data models, data sources (API or local database), and the implementation of the repositories.

## Getting Started

### Prerequisites

Ensure you have Flutter installed on your machine. For installation details, refer to the official [Flutter installation guide](https://flutter.dev/docs/get-started/install).

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/SidahmedBelkadi/flutter_posts_app_crud.git
   cd flutter-posts-app-crud
