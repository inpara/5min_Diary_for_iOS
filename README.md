# 5min_Diary
## 目的
- アプリ開発を通してSwiftUIの知識を高める
- 過去に作成したwebアプリケーションをiOSアプリに落とし込み、ブラッシュアップを図る
- アプリケーション開発の一連の流れを学ぶ

## コンセプト
- 1日5分で書ける超簡単日記帳アプリ。日記を書きたい全ての怠け者のために。


## 機能要件
- MUST
  - 日記(長文テキスト)の登録,閲覧,編集,削除ができる
  - 日記をリスト形式で一覧表示できる
  - 日記にお気に入りをつけることができる
- WANT
  - 日記の検索ができる(お気に入り/タグ/キーワード)
  - 日記にメディア(画像,動画)を挿入できる
  - 日記をカレンダー形式で表示できる(リスト表示と切り替えができる)
  - 日記に対してタグ付けができる
  - 日記を画像として保存,共有ができる
  - テーマカラーを設定できる
  - 背景画像を設定できる
  


## 外部設計
  - ワイヤーフレーム
## 内部設計
  - DB設計
  - ER図

## input
- [モバイルアプリ開発の流れ](https://pentagon.tokyo/app/1999/)
- [非機能要件とは？](https://products.sint.co.jp/obdz/blog/nonfunctionalrequirements)
- [xcodeでのプロジェクト削除方法](https://zenn.dev/suginoki45/articles/54ab4e19480abf)
- [プロジェクト作成時のOrganizationIdentifier](https://type.jp/et/feature/3008/)
- [ファイル生成時のヘッダーテンプレート作成](https://penguinchord.com/blog/swift/xcode-customize-header-new-file)
  - コマンドラインからフォルダ移動してテンプレート作成すれば上手くいく(ファインダーから作成したときは上手くいかなかった)
- [xcodeでプロジェクトを作成したら必ず確認しておきたいgitignore設定](https://zenn.dev/nkysyuichi/articles/7694975d156dcc)
- [Issueの書き方](https://gist.github.com/BcRikko/6af0b248148c12d3ab90)
- [gitのブランチの命名規則](https://qiita.com/luccafort/items/c91e817e78f1167221cc)
- エラー処理
  - https://kazunoriri.com/swiftui-do-try-catch/
  - [fatalError関数によるプログラム終了](https://qiita.com/onishi_820/items/e6f8cd28fe2ea38ebb7a)
- MVVM,アーキテクチャ
  - [もっともシンプルな SwiftUI - MVVM](https://qiita.com/john-rocky/items/88b45e18bd48e3dbc87c)
  - [SwiftUIでMVVMやるシンプルなパターン３つ](https://zenn.dev/kyome/articles/710cde86537d45)
  - [CoreDataでのフォルダ構成の参考](https://design.aoziso.com/swiftui-coredata/)
- [nil coalescing operator(??演算子)](https://swift.tecc0.com/?p=349)
- [オプショナル型](https://rakusui.org/swift_optional/)


## アイデア
- ユーザー登録をすることで、他のユーザーに日記を公開/他のユーザーが書いた日記を閲覧できる(簡易SNS的要素)
  - ユーザー登録をしなくても、匿名で投稿&閲覧ができる(登録することでよりリッチな機能を使える)
