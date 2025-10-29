# Identitas Diri
Nama : Putranto Surya Wijanarko
NIM : H1D023048
Shift Baru & KRS : F

# Tugas 1
Bikin main menu make dart aja tanpa flutter

# Penjelasan
Ini adalah penjelasan tentang tugas 1.
Class `MainMenu` berisi stack navigation dan juga menu item current menu diambil dari navigationstack last.

`clearTerminal()` mencari platform untuk native clear clear terminal
`displayMenu()` ini yang akan di forever loop membaca input secara waras dan aman menggunakan tryParse karena dianggap string namun mencoba di konversikan ke `int`, lalu jika aman maka antara dia kembali `goBack()`, `navigation(int input)`, atau exit melalui
```dart
...
if (menuItems[input].toLowerCase() == 'exit') {
  return false
}
...
}
```
yang dimana menambahkan pada stack sedangkan `goBack` remove last atau pop.
