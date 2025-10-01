# 📱 Posts MVVM SwiftUI App

## 🚀 Overview  
This iOS app fetches posts from the [JSONPlaceholder API](https://jsonplaceholder.typicode.com/posts) and provides the following features:  
- View posts in a list  
- Search posts by title  
- View detailed post info  
- Mark/unmark posts as favorites  
- View all favorites in a dedicated tab  
- Splash screen with SF Symbol  

The app is built using **SwiftUI** with the **MVVM architecture** pattern.

---

## 🛠 Project Setup Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/DipakPatil007/PostMaster.git
Open the project in Xcode:

bash
Copy code
cd posts-mvvm-swiftui
open PostsMVVMApp.xcodeproj
Build & run the app on a simulator or device (⌘ + R).

---

📱 Requirements
✅ iOS: 15.0+

✅ Xcode: 15+

✅ Swift: 5.9+

---

## 🏛 Architecture (MVVM)
Model:
- Defines the Post data structure, conforming to Codable for JSON parsing.

ViewModel:

- Handles API calls via APIService.

- Manages UI state (isLoading, errorMessage, favorites).

- Provides filtered/favorite post lists.

View:

- Uses SwiftUI views (PostsListView, PostDetailView, FavoritesView).

- Updates automatically by observing the ViewModel with @StateObject / @Published.

- Splash screen with SF Symbol before loading main content.

---

## 🎯 Features
✅ Fetch posts with async/await networking

✅ Real-time search by title

✅ Favorite toggle with persistence (UserDefaults)

✅ Pull-to-refresh

✅ Error handling with alerts

✅ Splash screen

---

## 💡 Assumptions & Improvements
Favorites are stored locally in UserDefaults. With more time, I’d:

- Add Core Data or CloudKit for persistent & cross-device sync

- Add offline caching of posts

- Improve UI/UX with animations & custom design

- Add unit tests for ViewModel & APIService

- Add accessibility improvements (VoiceOver support)

