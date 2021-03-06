# Mewblr
<img src="https://raw.githubusercontent.com/wiki/tofuonfire/mewblr/images/demo1.gif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://raw.githubusercontent.com/wiki/tofuonfire/mewblr/images/demo2.gif">

就活用のポートフォリオとして制作した自作アプリです（ミューブラーと読みます。）<br />
簡易的な画像投稿SNSになります。機能としてはシンプルですが、開発環境にDockerやCircleCI、インフラにAWSを使用しています。またRSpecによる単体テスト・統合テスト機能を追加し、UI/UX周りもこだわりました。

## URL
https://mewblr.com/

* 画面上部のバーから【ゲストユーザー】としてログインできます。
* ユーザーネーム"admin"、パスワード"123456"で【管理ユーザー】としてログインできます。管理ユーザーは、他の一般ユーザーのアカウントや投稿を削除する権限を持ちます。
* ゲスト/管理ユーザーのユーザー情報の編集は禁止しています。ご了承ください。
* 尚、[初期登録されているユーザー](https://mewblr.com/users/)はすべてパスワード"123456"でログインできます。

## 使用技術
* Ruby 2.6.5, Rails 6.0.0
* Nginx, Puma
* AWS (EC2, RDS for MySQL, S3, VPC, Route53, SES, ALB, ACM)
* Docker
* CircleCI
* Capistrano
* RSpec
* SASS, Bootstrap, JQuery

## AWS構成図
<img src="https://raw.githubusercontent.com/wiki/tofuonfire/mewblr/images/aws_architecture.png" width="640px">


## 機能一覧
* CircleCIを用いたCI/CD機能
* Rspecによる自動テスト機能
* ユーザー登録・ログイン機能（deviseを使用）
* 投稿機能（画像のアップロードにCarrierWaveを使用）
* 投稿一覧・投稿詳細表示機能
* 投稿管理機能
* ページネーション機能（Kaminari + InfiniteScroll）
* フォロー機能（Ajax）
* いいね機能（Ajax）
* コメント機能（Ajax）
* 検索機能（Ransackを使用）
* 管理ユーザー機能（一般ユーザーのアカウントや投稿を削除可能）
* Twitterへのシェア機能
