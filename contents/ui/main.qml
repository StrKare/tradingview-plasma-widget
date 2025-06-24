import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtWebEngine 1.8
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

Item {
    id: root
    
    Layout.minimumWidth: 350
    Layout.minimumHeight: 500
    Layout.preferredWidth: 450
    Layout.preferredHeight: 700
    
    Plasmoid.preferredRepresentation: Plasmoid.fullRepresentation
    
    Plasmoid.fullRepresentation: Rectangle {
        anchors.fill: parent
        color: PlasmaCore.Theme.backgroundColor
        border.color: Qt.rgba(PlasmaCore.Theme.highlightColor.r, PlasmaCore.Theme.highlightColor.g, PlasmaCore.Theme.highlightColor.b, 0.3)
        border.width: 1
        radius: 4
        
        WebEngineView {
            id: webView
            anchors.fill: parent
            anchors.margins: 3
            
            settings.javascriptEnabled: true
            settings.localContentCanAccessRemoteUrls: true
            
            onLoadingChanged: {
                if (loadRequest.status === WebEngineView.LoadSucceededStatus) {
                    loadingLabel.visible = false
                } else if (loadRequest.status === WebEngineView.LoadFailedStatus) {
                    loadingLabel.text = "Failed to load TradingView"
                }
            }
            
            Component.onCompleted: {
                var htmlContent = `<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TradingView Widget</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            overflow: hidden;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            background: #232530;
        }

        .tradingview-widget-container {
            width: 100%;
            height: 100vh;
            background: #232530;
        }

        .tradingview-widget-container__widget {
            width: 100%;
            height: calc(100% - 25px);
        }

        .tradingview-widget-copyright {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            font-size: 10px;
            text-align: center;
            padding: 5px;
            background: rgba(35, 37, 48, 0.95);
            border-top: 1px solid #363a45;
        }

        .tradingview-widget-copyright a {
            text-decoration: none;
            color: #3d9eff;
        }

        .blue-text {
            color: #3d9eff;
        }
    </style>
</head>
<body>
    <!-- TradingView Widget BEGIN -->
    <div class="tradingview-widget-container">
        
        <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-market-overview.js" async>
        {
            "colorTheme": "dark",
            "dateRange": "12M",
            "showChart": true,
            "locale": "en",
            "largeChartUrl": "",
            "isTransparent": false,
            "showSymbolLogo": true,
            "showFloatingTooltip": false,
            "width": "450",
            "height": "650",
            "plotLineColorGrowing": "rgba(38, 166, 154, 1)",
            "plotLineColorFalling": "rgba(239, 83, 80, 1)",
            "gridLineColor": "rgba(54, 58, 69, 0.06)",
            "scaleFontColor": "rgba(209, 212, 220, 1)",
            "belowLineFillColorGrowing": "rgba(38, 166, 154, 0.12)",
            "belowLineFillColorFalling": "rgba(239, 83, 80, 0.12)",
            "belowLineFillColorGrowingBottom": "rgba(38, 166, 154, 0)",
            "belowLineFillColorFallingBottom": "rgba(239, 83, 80, 0)",
            "symbolActiveColor": "rgba(61, 158, 255, 0.12)",
            "tabs": [
                {
                    "title": "Indices",
                    "symbols": [
                        {"s": "FOREXCOM:SPXUSD", "d": "S&P 500"},
                        {"s": "FOREXCOM:NSXUSD", "d": "NASDAQ 100"},
                        {"s": "FOREXCOM:DJI", "d": "Dow Jones"},
                        {"s": "INDEX:NKY", "d": "Japan 225"},
                        {"s": "INDEX:DEU40", "d": "DAX"},
                        {"s": "FOREXCOM:UKXGBP", "d": "FTSE 100"},
                        {"s": "KRX:KOSPI", "d": "KOSPI"}
                    ]
                },
                {
                    "title": "Futures",
                    "symbols": [
                        {"s": "OANDA:XAUUSD", "d": "Gold"},
                        {"s": "MATBAROFEX:WTI1!", "d": "WTI Oil"},
                        {"s": "BLACKBULL:BRENT", "d": "Brent Oil"},
                        {"s": "CAPITALCOM:NATURALGAS", "d": "Natural Gas"},
                        {"s": "OANDA:XAGUSD", "d": "Silver"}
                    ]
                },
                {
                    "title": "Forex",
                    "symbols": [
                        {"s": "FX:EURUSD", "d": "EUR/USD"},
                        {"s": "FX:GBPUSD", "d": "GBP/USD"},
                        {"s": "FX:USDJPY", "d": "USD/JPY"},
                        {"s": "FX:USDKRW", "d": "USD/KRW"},
                        {"s": "FX:AUDUSD", "d": "AUD/USD"}
                    ]
                },
                {
                    "title": "Crypto",
                    "symbols": [
                        {"s": "COINBASE:BTCUSD", "d": "Bitcoin"},
                        {"s": "COINBASE:ETHUSD", "d": "Ethereum"},
                        {"s": "BINANCE:XRPUSD", "d": "XRP"},
                        {"s": "COINBASE:ADAUSD", "d": "Cardano"},
                        {"s": "COINBASE:SOLUSD", "d": "Solana"}
                    ]
                }
            ]
        }
        </script>
    </div>
    <!-- TradingView Widget END -->
</body>
</html>`
                loadHtml(htmlContent)
            }
        }
        
        PlasmaComponents.Label {
            id: loadingLabel
            anchors.centerIn: parent
            text: "Loading TradingView Widget..."
            visible: true
            z: 999
            font.pixelSize: 14
            color: PlasmaCore.Theme.textColor
        }
    }
}