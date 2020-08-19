# CountUpGame
## 勉強会で作ったアプリを元に挑むハッカソン
先日、とあるSwift勉強会に参加し、はじめてのiOSアプリをビルドしました。
その勉強会の裏イベントで、iOSアプリをテーマとした1人ハッカソンが開催されるということで、
学んだことをアウトプットする機会として参加してみました。
以下、関連URLです。
- 勉強会
  - [初心者向けSwift勉強会 【ハックツトレジャー Vol.4】](https://hackz.connpass.com/event/183817/)
  URL: https://hackz.connpass.com/event/183817/
- ハッカソン
  - [【プチ開催】1人ハッカソン](https://hackz.connpass.com/event/183815/)
  URL: https://hackz.connpass.com/event/183815/

## このアプリについて
勉強会で作ったアプリを拡張して、ゲーム要素を取り入れてみました。
＋ボタンやーボタンを押すと表示されている数字の値が変化する仕様だったので、
新たにターゲットとなる数字をランダムに用意し、プレイヤーはそれに合わせる形でカウントアップやカウントダウンをしてもらい、スコアを稼いでもらうようにしました。
制限時間を用意したのでどれだけ速くターゲットと数字を合わせられるかがスコアゲットの鍵になります。

## プレイ映像
<a href="https://gyazo.com/0ae0cc84f0db632c763f1cb9db3ff67d"><img src="https://i.gyazo.com/0ae0cc84f0db632c763f1cb9db3ff67d.gif" alt="Image from Gyazo" width="375"/></a>

## 技術的概要
- Xcode Version 11.6 (11E708)
- Swift Version 5.2.4
- StoryBoardを使用
- アダプティブユーザーインターフェイスに挑戦
- ダークモードでも使用できるように調整（プレイ映像はダークモード）
- import GamePlayKit
  - 乱数を生成: GKRandomDistribution(lowestValue: Int, highestValue: Int)
- Timerを使用
- プレイヤーの扱う数字はcount、ターゲットの扱う数字はquestionで集約（リファクタリングの余地がありそうです。）

## まとめ
はじめてのネイティブアプリ制作でしたが自分なりにアウトプットできてとても楽しかったです。
ヒミツ機能としてオンライン対戦機能を付けようと思っていたのですが、、
サーバーとの通信を用いたアプリを作るには、まだまだ僕の技術的スキルでは及ばない感じです。。

```大学のテスト頑張ります(^^)（全く関係ない）```

2020/08/19


↓Fork元のREADMEです。
># CountUpAppForBeginners
>初心者向けSwift勉強会【ハックツトレジャー Vol.4】
>
># このアプリについて
>
>簡単なカウントアップアプリの作成から、XcodeとSwiftの使い方を学ぶことができます。
>
><img src= "https://user-images.githubusercontent.com/35694946/89296918-08db7b80-d69e-11ea-9760-2fc0b0e73bfd.gif" width="300">
>
>ここのレポジトリにはmaster、v1、v2のブランチが存在します。好きなバージョンをcloneしてください。
>
># このアプリ作成で学べること
>- ボタンをタップしてカウントアップ
>- if分
>- メソッド
>- StoryBoardの基本的な使い方
>- 画面遷移  v1
>- 通知機能  v2
>
># v1
>画面遷移を使って動きのあるアプリを作ろう！
>
><img src= "https://user-images.githubusercontent.com/35694946/89493229-aa71e280-d7ee-11ea-84da-6b0a71058fec.gif" width="300">
>
>
># v2 [準備中]
