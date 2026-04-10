# Meeting Room Booking App

A professional Flutter application for managing and booking meeting rooms, built with a focus on **Clean Architecture**, **MVI Pattern**, and a **Modern User Experience**.

## 🚀 Features
- **Modern UI**: Clean, intuitive, and responsive design for a high-quality user experience.
- **Room List**: Browse and select from a list of available meeting rooms.
- **Booking Management**: View detailed schedules for each room to stay organized.
- **Conflict Validation**: Robust logic to prevent overlapping bookings, ensuring schedule accuracy.
- **Instant Feedback**: Real-time status updates with integrated Loading and Error handling.

## 🛠 Technical Decisions

### 1. Clean Architecture
The project follows a 3-layer architecture for better maintainability and scalability:
- **Data**: Manages repositories and remote data sources.
- **Domain**: Contains business logic, entities, and use cases.
- **Presentation**: Handles UI components and state management.

### 2. MVI Pattern (Cubit)
Implemented the **Model-View-Intent** architecture using Bloc/Cubit to ensure a predictable data flow and easier debugging.

### 3. Conflict Validation Logic
A custom algorithm was developed to validate booking requests. It compares the requested time range against existing data to prevent scheduling conflicts before hitting the API.

## 🎨 UI & Design
- **Custom Typography**: Used the **Inter** font for a clean, professional, and modern look.
- **Design System**: Followed a consistent design language using a dedicated color palette via `AppColors`.

## 📦 Libraries Used
- `flutter_bloc`
- `dio`
- `dartz`
- `get_it`

## 🏃 How to Run
1. **Clone the repo**:
   `git clone [https://github.com/khalidadel365/meeting_room_booking_app]`
2. **Get packages**:
   `flutter pub get`
3. **Run**:
   `flutter run`
