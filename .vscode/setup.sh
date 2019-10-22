#!/bin/sh

echo "vscode setup start";
# 現在のディレクトリの位置取得
SCRIPT_DIR=$(cd $(dirname $0) && pwd)
# vscodeの位置取得
VSCODE_SETTING_DIR=~/Library/Application\ Support/Code/User

# シンボリックリンク作成
rm "$VSCODE_SETTING_DIR/settings.json"
ln -s "$SCRIPT_DIR/settings.json" "${VSCODE_SETTING_DIR}/settings.json"
rm "$VSCODE_SETTING_DIR/keybindings.json"
ln -s "$SCRIPT_DIR/keybindings.json" "${VSCODE_SETTING_DIR}/keybindings.json"
echo "created symbolic link"


# 拡張機能インストール
echo "extension install start"

cat extensions | while read line
do
 code --install-extension $line
done

code --list-extensions > extensions

echo "vscode setup finished";
