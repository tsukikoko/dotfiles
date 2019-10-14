#!/bin/sh

# ================================================================================
# 【For Mac】setup.sh : Setup MacOS
# ================================================================================

if [ "$(uname)" != "Darwin" ] ; then
  echo 'Not macOS!'
  exit 1
fi

echo 'Setup MacOS'

# ~/Library ディレクトリを可視化
chflags nohidden ~/Library
 # /Volumes ディレクトリを可視化
sudo chflags nohidden /Volumes

# ツールチップ表示までのタイムラグをなくす
defaults write -g NSInitialToolTipDelay -integer 0
# ダイアログ表示やウィンドウリサイズ速度を高速化する
defaults write -g NSWindowResizeTime 0.1

# Finder:隠しファイル/フォルダを表示
defaults write com.apple.finder AppleShowAllFiles true
# Finder:拡張子を表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Finder:パスバーを表示する
defaults write com.apple.finder ShowPathbar -bool true
# Finder:終了するメニュー追加する
defaults write com.apple.Finder QuitMenuItem -bool true

# Bluetooth ヘッドフォン・ヘッドセットの音質を向上させる
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# USB やネットワークボリュームに .DS_Store ファイルを作成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# ダウンロードしたファイルを初めて開く際のダイアログを無効にする
defaults write com.apple.LaunchServices LSQuarantine -bool false

# スクリーンキャプチャの影をなくす
defaults write com.apple.screencapture disable-shadow -bool true
# スクリーンショットの保存形式を PNG にする
defaults write com.apple.screencapture type -string "png"

# マウスカーソルを爆速にする
defaults write -g com.apple.mouse.scaling 20

# 省エネルギー 割合 (%) を表示
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Finder反映
killall Finder
# メニューバー反映
killall SystemUIServer

echo 'Setup Finished'
