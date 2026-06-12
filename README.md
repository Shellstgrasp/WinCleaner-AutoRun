# WinCleaner AutoRun

Single-command Windows cleanup tool — removes temp files, clears caches, resets DNS, enables Ultimate Performance.

## Install

Open **PowerShell** and run:

```powershell
irm https://raw.githubusercontent.com/OWNER/REPO/main/install.ps1 | iex
```

That's it. The installer handles everything.

## What it does

1. Elevates to administrator for system-level cleanup.
2. Purges `%TEMP%`, prefetch, Windows Update cache, and browser caches.
3. Clears event logs and old driver packages.
4. Resets the DNS resolver cache.
5. Activates the **Ultimate Performance** power plan.

## Requirements

- Windows 10 / 11 / 8.1 / 7 (32 or 64-bit)
- PowerShell 5.1+
- Administrator access
- No active installations running

## Troubleshooting

**Some files weren't deleted**

Files locked by running processes are skipped — this is normal and safe.

**Ultimate Performance plan not appearing**

Run `powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61` manually.

**Browser history gone after cleanup**

The script clears all browser caches by default. Use `--keep-browser` to skip.

---

**Alternative (bypass execution policy):**

```powershell
powershell -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/OWNER/REPO/main/install.ps1 | iex"
```

**"irm is not recognized"** — old PowerShell. Use:

```powershell
Invoke-RestMethod https://raw.githubusercontent.com/OWNER/REPO/main/install.ps1 | Invoke-Expression
```

## License

MIT — see [LICENSE](LICENSE).
