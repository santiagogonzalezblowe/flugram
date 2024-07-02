# Flugram

Flugram is a dynamic Flutter application leveraging `blowe_bloc`, `go_router`, `firebase_auth`, `cloud_firestore`, and `google_sign_in` to provide a rich set of features for managing user-generated content. The app supports multi-language with `flutter_localizations` (en & es).

## Features

### Authentication

- **Login**: Allows users to log in using email/password or Google Sign-In.
- **Sign Up**: New users can create an account.
- **Forgot Password**: Users can reset their password via email.

### Home

- **Home Page**: Displays a list of flugrams in a stream, listening for real-time changes from Firestore.

### Flugram

- **Flugram Page**: View detailed information about a specific flugram.
- **Create Flugram**: Users can create a new flugram.
- **Update Flugram**: Edit details of an existing flugram.
- **Delete Flugram**: Remove a flugram from the database.

### Page Management

- **Create Page**: Users can add new pages to a flugram.
- **Update Page**: Edit details of an existing page.
- **Delete Page**: Remove a page from a flugram.

### Subpage Management

- **Create Subpage**: Add subpages to an existing page, supporting nested structures.
- **Update Subpage**: Edit details of an existing subpage.
- **Delete Subpage**: Remove a subpage from a page.

### Bloc Management

- **Create Bloc**: Users can add blocs to a page, managing state and business logic.
- **Update Bloc**: Edit details of an existing bloc.
- **Delete Bloc**: Remove a bloc from a page.

### Repository Management

- **Create Repository**: Add repositories to a flugram for data management.
- **Update Repository**: Edit details of an existing repository.
- **Delete Repository**: Remove a repository from a flugram.

### News

- **News Section**: Contains two tabs, Spaces & Jelly Bean, each with:
  - **OnRefresh**: Refresh the list of news articles. This feature can be enabled or disabled as needed.
  - **Pagination**: Load more articles as the user scrolls.
  - **Search**: Search functionality added for Jelly Bean articles.

### Space Articles

- **Space Articles**: View detailed articles related to space.

### Jelly Bean

- **Jelly Bean Articles**: View detailed articles related to Jelly Bean.

### Theme

- **Light Theme**: A light color scheme for the app.
- **Dark Theme**: A dark color scheme for the app.

## Services

- **Jelly Bean**: [Jelly Bean API](https://jellybellywikiapi.onrender.com) provides information related to Jelly Bean.
- **Space**: [Space API](https://api.spaceflightnewsapi.net) provides the latest news about space.

## Repositories

- **Jelly Bean Repository**: Manages data retrieval from the Jelly Bean API.
- **Space Repository**: Manages data retrieval from the Space API.
- **Authenticated Repository**: Base class for repositories that require user authentication.
- **Authentication Repository**: Manages user authentication using Firebase Authentication.
- **Multiple Repositories**: Connect to Cloud Firestore to manage various data entities dynamically.

## Global Logic

- **AuthenticationBloc**: Manages the user's authentication state in the app. It ensures that the user is authenticated before accessing certain parts of the app and provides an `AuthenticationListener` to respond to authentication changes in the login page and home page.

## Complexity

The most complex part of the app is the dynamic creation, deletion, and updating of complex nested data structures in Cloud Firestore. The app efficiently manages these operations to provide a seamless user experience.

## Multi-Language Support

The app supports multiple languages using `flutter_localizations` with English (en) and Spanish (es) translations.

## Getting Started

### Prerequisites

- Flutter SDK
- Firebase project setup with Firestore and Authentication enabled
- Google Sign-In configuration

### Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/santiagogonzalezblowe/flugram.git
   ```
2. Install dependencies:
   ```sh
   flutter pub get
   ```
3. Set up Firebase for your project and replace the google-services.json and GoogleService-Info.plist in the respective directories.
4. Run the app:
   ```sh
   flutter run
   ```
