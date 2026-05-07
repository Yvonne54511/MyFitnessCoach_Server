# ngrok 啟動專案

這個專案可以幫助你快速啟動 ngrok 並對應到本地的開發環境。

## 檔案說明

- **start.bat**: 執行此檔案可啟動 ngrok。你可以輸入想要的連接埠（Port），預設為 `7212`。
- **set-authtoken.bat**: 如果你還沒有設定 ngrok 的 Authtoken，或者需要更換，請執行此檔案並貼上你的 Token。

## 使用步驟

1. (選用) 如果是第一次使用，請先執行 `set-authtoken.bat` 設定你的驗證碼。
2. 執行 `start.bat`。
3. 輸入你的網頁專案執行的 Port（例如：5000, 8080, 7212）。
4. 複製 ngrok 產生的 `Forwarding` 網址（例如：`https://xxxx-xxxx.ngrok-free.app`），即可從外部存取。

## 注意事項

- 請確保你的本地專案已經啟動，否則 ngrok 會回傳 502 Bad Gateway。
- 免費版的 ngrok 網址在每次重新啟動時都會改變。
