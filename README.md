# 🍔 Bites  
**A mobile app for UPRM students to pre-order food from campus dining spots.**

---

## 📖 Overview  
Bytes is a Flutter application designed for students at the University of Puerto Rico – Mayagüez (UPRM).  
It allows students to browse campus dining menus, place food orders in advance, and pick them up without waiting in line.  

The app improves the campus food experience by reducing wait times, simplifying ordering, and supporting multiple payment methods.  

---

## ✨ Features  
- 🔐 **Student login** (UPRM email with Firebase Auth)  
- 📋 **Browse menus** by food spot  
- ⏱ **Pre-order food for pickup**  
- 📦 **Track orders** with status updates  
- 🔔 **Notifications** when your order is ready  
- 💳 **Multiple payment options** (meal plan, ATH Móvil, credit/debit)  
- ⭐ **Favorites & order history**  
- 🌐 **Bilingual support** (English/Spanish – roadmap)  

---

## 🛠 Tech Stack  
- **Framework:** Flutter (Dart)  
- **Routing:** go_router  
- **State Management:** flutter_bloc / Cubit  
- **Responsive UI:** sizer  
- **Backend & Services:** Firebase (Auth, Firestore, Storage, FCM)  
- **UI Design:** Custom theme (AppColors, AppSpacing, reusable widgets)  

---

## 📂 Project Structure  
```text
lib/
  app/            # global app setup (theme, router, DI)
  core/           # shared utils, widgets, constants
  features/
    auth/         # login & signup
    menu/         # food spots, menus
    orders/       # order placing & history
    payments/     # payment integration
    notifications/# push & in-app alerts
