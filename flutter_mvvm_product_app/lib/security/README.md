# Security Checklist Flutter

## Penyimpanan Data
- Tidak menyimpan token pada SharedPreferences
- Menggunakan flutter_secure_storage
- Tidak menyimpan password dalam plaintext

## Komunikasi API
- Menggunakan HTTPS
- Menggunakan certificate pinning
- Tidak menampilkan detail error server ke pengguna

## Validasi Input
- Validasi email
- Validasi password
- Sanitasi input pengguna

## Dependency
- Audit package secara berkala
- Menghapus package yang tidak digunakan

## Authentication
- Menggunakan access token
- Menggunakan refresh token
- Logout menghapus seluruh session
