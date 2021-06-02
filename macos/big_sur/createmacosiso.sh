#!/bin/sh
# 仮想のディスクイメージを作成
hdiutil create -o /tmp/Big\ Sur -size 16G -volname Big\ Sur -layout SPUD -fs HFS+J -type SPARSE
# 作成したディスクイメージをマウント
hdiutil attach /tmp/Big\ Sur.sparseimage -noverify -mountpoint /Volumes/Big\ Sur
# createinstallmediaを使って、ディスクイメージを作成
sudo $HOME/macOS\ Big\ Sur.app/Contents/Resources/createinstallmedia --volume /Volumes/Big\ Sur --nointeraction

# アンマウントする
hdiutil eject -force /volumes/Install\ macOS\ Big\ Sur
# dmgファイルをisoファイルに変換
hdiutil convert /tmp/Big\ Sur.sparseimage -format UDTO -o $HOME/Big\ Sur.cdr
# 名前の変更
mv $HOME/Big\ Sur.cdr $HOME/Big\ Sur.iso

rm -f /tmp/Big\ Sur.sparseimage
echo "the temp image has been removed";