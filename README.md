# Base Cubit Widget

Cubit paketinden türetilmiş kod tekrarını azaltmayı amaçlayan bir pakettir.

## 📱 Proje Yapısı

```
├── example
│   ├── main.dart
│   └── test_page
│       ├── model
│       ├── view
│       └── viewmodel
├── lib
│   ├── export.dart
│   └── package
│       └── cubit  
```

## 🚀 Özellikler
- Standart bir mobil uygulama sayfasında temel 3 durum vardır. Initial,Loading,Error doğrudan bloc veya cubit kullandığımızda bu durumları her seferinde tekrar tekrar geliştirmek zorunda kalıyoruz. Bu paket sayesinde 3 durum üzerinden state yönetimini rahatlıkla sağlayabiliyoruz.


<img width="624" height="502" alt="Ekran Resmi 2025-09-07 01 24 08" src="https://github.com/user-attachments/assets/4249050d-5bce-4ad5-9edf-360e54e7bd02" /> 

- Örnek bir viewmodel kullanımı 

<img width="492" height="548" alt="Ekran Resmi 2025-09-07 01 26 27" src="https://github.com/user-attachments/assets/23750c0c-a118-4a44-a8aa-4c07b703fa2b" />

- Örnek bir view kullanımı 
