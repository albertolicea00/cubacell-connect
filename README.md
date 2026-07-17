# 🇨🇺CubaCell Connect

An iPhone app to quickly access the **USSD service codes of ETECSA (Cubacel)**: check your balance, buy data/voice/SMS plans, transfer credit and more — all from a clean, organized list that hands the code straight to the system dialer.

> Colors: deep navy `rgb(0, 0, 102)`, cyan `#09C`, black and white.

## Features

- 📋 **Full USSD catalog** grouped by category: Balance & Plans, Purchases & Top-Up, Transfers, and Other Utilities.
- 📞 **One-tap dialing** — the app opens the system dialer with the code prefilled (`#` correctly percent-encoded).
- ⌨️ **Input-aware codes** — codes like `*662*{card}#` or `#31#{number}` ask for the missing part before dialing.
- 📎 **Copy to clipboard** for any code.
- 💡 **Mnemonics** — e.g. `328 = DAT`, `266 = BON`, `869 = VOZ` — the keypad letters spell the service name.
- 🌗 Light and dark mode support.

## Code Catalog

The catalog lives in [`CubacellConnect/Resources/ussd_codes.json`](CubacellConnect/Resources/ussd_codes.json). Highlights:

| Code | Purpose |
| --- | --- |
| `*222#` | Main balance, voice/SMS/data resources and line validity |
| `*222*328#` | Data plan balance and validity |
| `*222*266#` | Promotional bonuses and USD plans |
| `*222*869#` | Voice plan credit |
| `*222*767#` | SMS plan credit |
| `*222*264#` | Friends Plan (Plan Amigos) status |
| `*222*468#` | Mobile data availability |
| `*111#` | Postpaid / institutional balance |
| `*133#` | Purchase menu (data, SMS, voice, bundles) |
| `*234#` | Transfer menu (balance transfer, PIN change, Adelanta Saldo) |
| `*662*{card}#` | Manual top-up with a scratch card |
| `*99{number}` | Collect call (receiver pays) |
| `#31#{number}` | Private call (hidden caller ID) |
| `*#06#` | Show device IMEI |

## Requirements

- Xcode 15+
- iOS 17.0+
- [XcodeGen](https://github.com/yonaskolb/XcodeGen) (`brew install xcodegen`)

## Getting Started

```bash
git clone https://github.com/albertolicea00/cubacell-connect.git
cd cubacell-connect
xcodegen generate
open CubacellConnect.xcodeproj
```

Build and run on a device. **USSD dialing requires a physical iPhone with a Cubacel SIM** — the simulator cannot place calls.

## Project Structure

```
CubacellConnect/
├── App/          # App entry point
├── Models/       # USSDCode, USSDCategory, catalog decoding
├── Services/     # JSON catalog store, system dialer bridge
├── Theme/        # Brand colors and typography
├── Views/        # Home list, row, detail sheet
└── Resources/    # ussd_codes.json catalog
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). Please follow the [Code of Conduct](CODE_OF_CONDUCT.md).

## Disclaimer

This is an independent, community-made app. It is **not affiliated with, endorsed by, or sponsored by ETECSA**. Codes may change at any time at the carrier's discretion.

## License

[MIT](LICENSE) © 2026 Alberto Licea
