# Expense Tracker App

## Overview

The Expense Tracker App is a mobile application built using Flutter that helps users manage their finances by tracking their expenses and incomes. The app features Firebase authentication for user management and integrates with Cloud Firestore for storing data securely. It also utilizes the Bloc pattern for state management and SharedPreferences for local data persistence.

## Features

- **User Authentication**: Secure login and registration using Firebase Authentication.
- **Expense and Income Tracking**: Add, edit, and delete expenses and incomes.
- **Data Persistence**: Expenses and incomes are stored locally using SharedPreferences and synced with Cloud Firestore.
- **Real-time Updates**: Changes to expenses and incomes are reflected in real-time across all devices.
- **State Management**: Efficient state management using the Bloc pattern.

## ⚠️ Note

There is currently one user in the system:

- **Email**: omar@gmail.com
- **Password**: 123456

## Screenshots
<img src="https://github.com/user-attachments/assets/291f6827-571a-480a-9a7a-d2cb568e9e71" width="300">
<img src="https://github.com/user-attachments/assets/ab1d5895-74d5-4969-930c-6774f011dd2f" width="300">
<img src="https://github.com/user-attachments/assets/1ad006fc-1971-461f-8d4d-f1df1d51d9a4" width="300">

## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Firebase Project: [Set up Firebase](https://firebase.google.com/docs/flutter/setup) and connect your app.
- Bloc Package: [Flutter Bloc](https://bloclibrary.dev/#/gettingstarted)

### Installation

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/your-username/expense-tracker-app.git
   cd expense-tracker-app
