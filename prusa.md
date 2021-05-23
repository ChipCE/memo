# n/a

## 自動ロード

- Prusa の自動フィラメントロード機能がある、しかしフィラメントアンロードする時に(人が Extruder からフィラメントを抜く)、フィラメントセンサーのチャタリングによって自動ロードが実行される。実際この場合、フィラメント抜く時の誤信号を防ぐべき。そういう機能がないから、フィラメントアンロード時、画面に"pull filament out limitedly"が表示される。limitedly だが、人間は機械の速度を勝てない場合が多い。参考：私が投稿した FR(去年)https://github.com/prusa3d/Prusa-Firmware/issues/2771

- 私が使った時にこの問題があった、既に直せたかどうか実機で確認してください。ノズルが冷える時にフィラメントを入れると"preheat"の温度を聞いてくれる、しかしノズルとベットが一緒に加熱される。フィラメント交換だから、ノズルのみ加熱するべきではないか？ベッドを加熱するのは火傷の恐れもあるし。

## 非標準台形ねじナット

- 台形ねじ(8mm ピッチ)ナットのサイズは標準ではない。外形 25mm のナットは Prusa が普及になってから買えるようになった。もし、8mm 以外ピッチの台形ねじ(2mm、4mm とか)を交換したら、外形 25mm ナットは調達できない。ナットをプリントする(精度は保証できない)か 22mm ナットを改造するしかない。[ナット改造道具](https://www.thingiverse.com/thing:4401155)

## ファン

- 元々 mk3 は Noctua 製ファンが使われてるが、去年 Noctua ファン供給が不安定になったので Delta 製に変えた。Delta ファンの回転速度が高いので PWM でファンの速度を落とす(自動)。Prusa の定番改造は Noctua ファンから Sunon ファンに変える、このファンは PWM 対応しないので PWM 制御によって寿命が短くなる。コミュニティと喧嘩した結果、ファンの速度選択設定が隠しメニューに追加された　
  参考 : Sunon ファンデータシート　https://www.tme.eu/Document/3cb1207277218a2fbbe696db35c9eace/A1259XBL-TC%28A25000350G-00%29-0.pdf
  Prusa pull request : https://github.com/prusa3d/Prusa-Firmware/pull/2692

## キャリブレーション

- Prusa の自慢機能だが、改造によって xyz 軸のいずれかが変わるとキャリブレーションができなくなる。対策として、Bondtech や bear などはカスタマイズ FW を出した。革命機能だが、改造しやすいプリンターではないと思う。

## prusa ikea lack encloure + electronic

- Prusa のエンクロージャー が公開されたが、プリンターの制御ボードがエンクロージャー 内にある。ボード冷却ファンがないので、温度が上がると tmc が停止したり、tmc 内の mosfet 性能が下がるによる"lost step"が起きる。夏になると Prusa facebook グループに"lost step"による投稿が増えるのはこの原因。

- 上と同じ、エンクロージャー内の温度と Extruder モーターの高温によってフィラメントが Extruder 内に溶ける。（これは Prusa だけの問題ではない）

## 602

- Prusa の伝説問題、今でも原因不明。Extruder の設計ミスによる原因ではないか(フィラメントパスが真っ直ぐではない)を指摘された。指摘された問題は 2021 年(3 年後)に改善された。 参考:https://github.com/prusa3d/Prusa-Firmware/issues/602

## これからは Prusa MINI の話です

- Prusa mini の X と Y シャフトの長さは 279mm,Z シャフトは 341mm。この変な長さを使う理由は何？
- 元々、Extruder の e-step 設定は EEPROM に保存された。その後、この機能は削除された。Bontech 製 Extruder に変えた人はカスタマイズ Gcode で設定するしかない。参考:https://github.com/prusa3d/Prusa-Firmware-Buddy/issues/364

## まとめ

全体的にはいいプリンターと思いますが、改造しやすいプリンターではない。
