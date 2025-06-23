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
    Layout.preferredHeight: 600
    
    Plasmoid.preferredRepresentation: Plasmoid.fullRepresentation
    
    Plasmoid.fullRepresentation: Rectangle {
        anchors.fill: parent
        color: PlasmaCore.Theme.backgroundColor
        border.color: PlasmaCore.Theme.highlightColor
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
                var htmlContent = '<!DOCTYPE html>
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
                                background: #fff;
                            }

                            .tradingview-widget-container {
                                width: 100%;
                                height: 100vh;
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
                                background: #f8f9fa;
                            }

                            .tradingview-widget-copyright a {
                                text-decoration: none;
                                color: #2962FF;
                            }

                            .blue-text {
                                color: #2962FF;
                            }
                        </style>
                    </head>
                    <body>
                        <div class="tradingview-widget-container">
                            <div class="tradingview-widget-container__widget"></div>
                            <div class="tradingview-widget-copyright">
                                <a href="https://www.tradingview.com/" rel="noopener nofollow" target="_blank">
                                    <span class="blue-text">Track all markets on TradingView</span>
                                </a>
                            </div>
                            <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-market-overview.js" async>
                                {
                                    "colorTheme": "light",
                                    "dateRange": "12M",
                                    "showChart": true,
                                    "locale": "en",
                                    "largeChartUrl": "",
                                    "isTransparent": false,
                                    "showSymbolLogo": true,
                                    "showFloatingTooltip": false,
                                    "width": "450",
                                    "height": "600",
                                    "plotLineColorGrowing": "rgba(41, 98, 255, 1)",
                                    "plotLineColorFalling": "rgba(41, 98, 255, 1)",
                                    "gridLineColor": "rgba(240, 243, 250, 0)",
                                    "scaleFontColor": "rgba(15, 15, 15, 1)",
                                    "belowLineFillColorGrowing": "rgba(41, 98, 255, 0.12)",
                                    "belowLineFillColorFalling": "rgba(41, 98, 255, 0.12)",
                                    "belowLineFillColorGrowingBottom": "rgba(41, 98, 255, 0)",
                                    "belowLineFillColorFallingBottom": "rgba(41, 98, 255, 0)",
                                    "symbolActiveColor": "rgba(41, 98, 255, 0.12)",
                                    "tabs": [
                                        {
                                            "title": "Indices",
                                            "symbols": [
                                                {
                                                    "s": "FOREXCOM:SPXUSD",
                                                    "d": "S&P 500 Index"
                                                },
                                                {
                                                    "s": "FOREXCOM:NSXUSD",
                                                    "d": "US 100 Cash CFD"
                                                },
                                                {
                                                    "s": "FOREXCOM:DJI",
                                                    "d": "Dow Jones Industrial Average Index"
                                                },
                                                {
                                                    "s": "INDEX:NKY",
                                                    "d": "Japan 225"
                                                },
                                                {
                                                    "s": "INDEX:DEU40",
                                                    "d": "DAX Index"
                                                },
                                                {
                                                    "s": "FOREXCOM:UKXGBP",
                                                    "d": "FTSE 100 Index"
                                                },
                                                {
                                                    "s": "KRX:KOSPI",
                                                    "d": "KOSPI"
                                                }
                                            ],
                                            "originalTitle": "Indices"
                                        },
                                        {
                                            "title": "Futures",
                                            "symbols": [
                                                {
                                                    "s": "OANDA:XAUUSD",
                                                    "d": "Gold"
                                                },
                                                {
                                                    "s": "MATBAROFEX:WTI1!",
                                                    "d": "WTI"
                                                },
                                                {
                                                    "s": "TOCOM:TCL1!",
                                                    "d": "Dubai Oil"
                                                },
                                                {
                                                    "s": "BLACKBULL:BRENT",
                                                    "d": "Brent Oil"
                                                },
                                                {
                                                    "s": "CAPITALCOM:NATURALGAS",
                                                    "d": "Natural Gas"
                                                }
                                            ],
                                            "originalTitle": "Futures"
                                        },
                                        {
                                            "title": "Bonds",
                                            "symbols": [
                                                {
                                                    "s": "NASDAQ:OBIL",
                                                    "d": "US 1 Year"
                                                },
                                                {
                                                    "s": "PYTH:US10Y",
                                                    "d": "US 10 Year"
                                                },
                                                {
                                                    "s": "PYTH:US30Y",
                                                    "d": "US 30 Year"
                                                },
                                                {
                                                    "s": "TVC:JP10",
                                                    "d": "JP 10Y"
                                                },
                                                {
                                                    "s": "TVC:JP30",
                                                    "d": "JP 30Y"
                                                }
                                            ],
                                            "originalTitle": "Bonds"
                                        },
                                        {
                                            "title": "Crypto",
                                            "symbols": [
                                                {
                                                    "s": "COINBASE:BTCUSD",
                                                    "d": "BTC"
                                                },
                                                {
                                                    "s": "BINANCE:XRPUSD",
                                                    "d": "XRP"
                                                },
                                                {
                                                    "s": "COINBASE:ETHUSD",
                                                    "d": "ETH"
                                                }
                                            ]
                                        }
                                    ]
                                }
                            </script>
                        </div>
                        </body>
                    </html>'
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
        }
    }
}
