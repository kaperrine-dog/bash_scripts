# ssh-keygen自動化ツール

- Unix系OSで、Bashでの動作を前提として作成しています。
- ssh-keyは短い鍵長でも比較的セキュアと言われている`ed25519`です。
- rsaで鍵長`4096bit`などにすると`authorized_keys`が見づらくなり、管理が大変です。


## 使い方

`$PATH`を通して、

```bash
$ ssh-keygen.sh
```

で実行。

`$PATH`が通っていない場合は`~/.profile`等を確認して追記。


```bash
--------------------------------------
Local PC UserName?
--------------------------------------
marinpc
```
などと入力すると自動でSSH秘密鍵が作成。

鍵は下記ディレクトリに作成、

- `~/.ssh/id_ed25519_keyname.pub`
- `~/.ssh/id_ed25519_keyname`

これらをローカル環境の`~/.ssh/`以下に配置します。


同時に実行したサーバーのカレントユーザーの
`~/.ssh/authrized_keys`の中に作成されたパブリックキーが自動で書き込まれます。



ご自身の環境の`~/.ssh/config`の中に下記のような設定を追記
(適宜読み替えてください)

```bash
Host ${HOSTNAME}
  HostName ${HOSTNAME}
  IdentityFile ${SSH_ID_FILENAME}
  User ${SSH_USERNAME}
  TCPKeepAlive yes
  IdentitiesOnly yes
  ServerAliveInterval 300
  ServerAliveCountMax 999
```
