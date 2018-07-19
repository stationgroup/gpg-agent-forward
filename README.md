# Forward your Yubikey `gpg-agent` to remote host
### Simple GPG agent-forwarding config maker for Yubikey use with SSH.

## 📖 Getting Started

⚠️ Storing SSH keys on disk can be dangerous. Using a hardware crypto key can help mitigate key exfiltration from your local or remote hosts.

This assumes you [already added a GPG key to your Yubikey](https://github.com/drduh/YubiKey-Guide) and now just want to forward it to a remote host.

```
./yubikey_gpg-agent-forward.sh admin host.example.com
```

The important part here is typing the **`username`** and **`hostname/IP`**. These variables are needed to write a correct config.
