# Catch the Coin

A small arcade game made with [LÖVE](https://love2d.org/) (Love2D). Red coins fall from the top of the screen. You move a blue basket at the bottom and try to catch as many as you can. Each catch adds one point to your score.

There is no timer or game over—just practice your reflexes and beat your high score.

## About the game

- Coins spawn about once per second at random horizontal positions.
- If you miss a coin, it disappears when it leaves the bottom of the screen.
- The window can be resized; the basket stays at the bottom and movement stays within the screen.

## Get LÖVE (Love2D)

You need LÖVE **11.4 or newer** to run this project.

1. Open the official site: [https://love2d.org/](https://love2d.org/)
2. Click **Download**.
3. Pick your operating system and install:
   - **Windows:** Run the installer (or use the zip). After install, `love.exe` is usually on your PATH, or you can drag the game folder onto `love.exe`.
   - **macOS:** Open the `.dmg` and drag **LÖVE** into Applications.
   - **Linux:** Install from your package manager (e.g. `sudo apt install love` on Ubuntu/Debian) or use the AppImage from the download page.

To check that LÖVE works, open a terminal and run:

```bash
love --version
```

You should see something like `LOVE 11.4` (or newer).

## Set up and play this game

### 1. Get the game files

**Option A — Git**

```bash
git clone https://github.com/silenthiccups23/Catch-the-Coin.git
cd Catch-the-Coin
```

**Option B — Zip**

Download the repository as a ZIP from GitHub, extract it, and open a terminal in that folder.

### 2. Run the game

From the project folder (the one that contains `main.lua`):

```bash
love .
```

On **Windows**, if `love` is not in your PATH, you can run:

```text
"C:\Program Files\LOVE\love.exe" .
```

(or drag the project folder onto `love.exe`).

On **macOS**, from Terminal in the project folder:

```bash
/Applications/love.app/Contents/MacOS/love .
```

You can also right‑click the folder → **Open With** → **LÖVE**, if your system offers that.

### 3. Play

| Key | Action |
|-----|--------|
| Left arrow | Move basket left |
| Right arrow | Move basket right |

Hold a key to keep moving. Catch coins to increase your score.

## Project layout (optional)

| File | Purpose |
|------|---------|
| `main.lua` | Game loop, spawning, collisions, score |
| `player.lua` | Basket (player) |
| `coin.lua` | Falling coins |
| `conf.lua` | Window size and LÖVE settings |

## License

See [LICENSE](LICENSE) in this repository.
