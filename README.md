# sample-omniauth

OmniAuthを使ったOAuth2ソーシャルログインのサンプルアプリケーションです。

## プロバイダー一覧
- Google
- GitHub
- LINE
- Discord

## 技術スタック

- Ruby 3.3.6
- Rails 8.1.2
- PostgreSQL 17
- Tailwind CSS 4.4

## セットアップ

### 環境変数

`.env` ファイルをプロジェクトルートに作成し、各プロバイダーのクライアントIDとシークレットを設定してください。

```env
GOOGLE_CLIENT_ID=your_google_client_id
GOOGLE_CLIENT_SECRET=your_google_client_secret

GITHUB_CLIENT_ID=your_github_client_id
GITHUB_CLIENT_SECRET=your_github_client_secret

LINE_CLIENT_ID=your_line_client_id
LINE_CLIENT_SECRET=your_line_client_secret

DISCORD_CLIENT_ID=your_discord_client_id
DISCORD_CLIENT_SECRET=your_discord_client_secret
```
