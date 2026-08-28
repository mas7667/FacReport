# FacReport

Prototype Flutter multiplateforme pour centraliser des factures, préparer leur vérification et planifier un export de données structurées.

## État réel

Le dépôt contenait uniquement le modèle de compteur généré par Flutter. Il propose maintenant une interface métier cohérente, mais les fonctions OCR, la persistance et l’export Excel restent à implémenter. Elles ne sont donc pas présentées comme fonctionnelles.

## Stack

- Flutter / Material 3
- Dart 3.5 ou version ultérieure compatible
- Cibles Android, iOS, Web, Windows, macOS et Linux générées

## Vérification

```bash
cd app
flutter pub get
flutter analyze
flutter test
flutter run
```
