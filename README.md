# TradingView Plasma Widget

A KDE Plasma desktop widget that displays live market data from TradingView with native theme integration.

![TradingView Widget](https://img.shields.io/badge/KDE-Plasma%205-blue) ![License](https://img.shields.io/badge/license-MIT-green)

## Features

- **Real-time market data** from TradingView
- **Native Plasma theme integration** - automatically matches your desktop theme
- **Multiple asset categories**: Indices, Futures, Forex, and Cryptocurrency
- **Customizable symbols and markets**
- **Responsive design** that adapts to different widget sizes

## Compatibility

**Tested Environment:**
- **OS**: Kubuntu 24.04 LTS
- **Desktop**: KDE Plasma 5.27.12
- **Login Manager**: SDDM (X11)
- **Widget Session**: Wayland
- **Qt Version**: 5.15.13
- **KDE Frameworks**: 5.115.0

**Requirements:**
- KDE Plasma 5.x (Plasma 6 compatibility not tested)
- QtWebEngine 5.15+
- Internet connection for live data

## Installation

### Quick Install
```bash
# Download and install
git clone https://github.com/StrKare/tradingview-plasma-widget.git
cd tradingview-plasma-widget
plasmapkg2 -i .
```

### Add to Desktop
1. Right-click on desktop → **"Add Widgets..."**
2. Search for **"TradingView"**
3. Drag **"TradingView Market Overview"** to your desktop

## Customization

### Modifying Symbols and Markets

To customize the displayed symbols, edit the code between the `<!-- TradingView Widget BEGIN -->` and `<!-- TradingView Widget END -->` comments in `contents/ui/main.qml`.

**Reference**: Use [TradingView's official widget documentation](https://www.tradingview.com/widget-docs/widgets/watchlists/market-overview/) for:
- Symbol formatting
- Market categories
- Configuration options
- Color themes
- Display settings

### Development Workflow

```bash
# 1. Make your changes
code contents/ui/main.qml

# 2. Update widget
plasmapkg2 -u .
systemctl --user restart plasma-plasmashell.service
```

## File Structure

```
tradingview-widget/
├── metadata.json          # Widget metadata and information
├── contents/
│   ├── ui/
│   │   └── main.qml      # Main widget code (modify here)
│   └── config/
│       └── config.qml    # Widget configuration
└── README.md
```

## Uninstall

```bash
plasmapkg2 -r org.kde.plasma.tradingview
```

## Author

**StrKare** - [GitHub](https://github.com/StrKare)

## License

This project is open source and available under the MIT License.