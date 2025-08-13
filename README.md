# Návod na spuštění aplikace

Tento dokument obsahuje instrukce pro kompilaci, spuštění a konfiguraci aplikace.

## Požadavky
- Nainstalovaný **Flutter** SDK (doporučená verze: nejnovější stabilní)
- Editor jako **Visual Studio Code** nebo **Android Studio** s Flutter pluginem
- Připojené zařízení nebo emulátor pro spuštění aplikace
- Přístup k API tokenu z [Golemio API](https://api.golemio.cz/pid/docs/openapi/index.htm)

## Instalace a kompilace

1. **Klonování repozitáře**
   - Naklonujte repozitář do svého lokálního prostředí:
     ```
     git clone https://github.com/bujdy/pid
     ```

   - Přejděte do adresáře projektu:
     ```
     cd pid
     ```
2. **Instalace závislostí**
   - Spusťte následující příkaz pro stažení všech závislostí uvedených v `pubspec.yaml`:
     ```
     flutter pub get
     ```

3. **Kompilace a spuštění**
   - Ujistěte se, že máte připojené zařízení nebo spuštěný emulátor.
   - Spusťte aplikaci příkazem:
     ```
     flutter run
     ```

   - Pro build produkční verze použijte:
     ```
     flutter build apk  # pro Android
     flutter build ios  # pro iOS (na macOS s Xcode)
     ```

## Nastavení API tokenu

1. **Získání API tokenu**
   - Navštivte [dokumentaci Golemio API](https://api.golemio.cz/pid/docs/openapi/index.htm) a získejte svůj API token podle pokynů.

2. **Vytvoření `.env` souboru**
   - V kořenovém adresáři projektu vytvořte soubor s názvem `.env`.
   - Přidejte API token v následujícím formátu:
     ```
     API_KEY=váš_api_key_zde
     ```

3. **Načtení tokenu**
   - Aplikace automaticky načte API token ze souboru `.env` při spuštění.
   - Pokud token chybí nebo je neplatný, aplikace může hlásit chybu. Zkontrolujte správnost tokenu a případně kontaktujte poskytovatele API.

## Poznámky
- Ujistěte se, že máte nainstalované všechny potřebné nástroje pro vývoj ve Flutteru (Dart, Android SDK, případně Xcode pro iOS).
- Pokud narazíte na problémy s kompilací, zkontrolujte verzi Flutteru a aktualizujte závislosti.
- API token je citlivá informace – nikdy jej nesdílejte veřejně.

## TODO
- Move colors and text styles into ThemeData
- Define entities in the domain layer (not just using DTOs)
