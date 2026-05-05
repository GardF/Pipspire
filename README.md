# Pips / Piptower

LÖVE 2D-skjelett for et roguelike domino-spill med Babels tårn-tema.
Se `CLAUDE.md` for full prosjektkontekst.

## Kjøre spillet

Krever [LÖVE 2D 11.5](https://love2d.org/).

```bash
# Fra prosjektrota
love .
```

### Kjøre i nettleseren

Mappen `web/` inneholder en ferdigbygd love.js-versjon. Fordi WebAssembly
krever HTTP (ikke `file://`), må du serve den lokalt:

```bash
cd web
python3 -m http.server 8000
# Åpne http://localhost:8000 i nettleseren
```

Bygg på nytt etter kodeendringer:

```bash
npm install -g love.js
zip -r /tmp/pips.love main.lua conf.lua src
love.js -c -t "Pips - Piptower" /tmp/pips.love web
```

## Mappestruktur

```
piptower/
├── main.lua                  # entry point
├── conf.lua                  # LÖVE konfigurasjon
├── CLAUDE.md                 # kontekst for Claude Code
├── src/
│   ├── core/
│   │   ├── statemachine.lua  # driver state-flyten
│   │   ├── camera.lua        # zoom inn/ut mellom TB og PR
│   │   ├── colors.lua        # PEAR36 palett
│   │   └── game.lua          # delt run-state (round, height, pips, money)
│   ├── states/               # én fil per fase i runden
│   │   ├── menu.lua
│   │   ├── mt.lua            # Mexican Train
│   │   ├── tb.lua            # Tower Building (zoomet inn)
│   │   ├── pr.lua            # Piprush / Pip Toss (zoomet ut)
│   │   ├── shop.lua          # Mefistofeles' butikk
│   │   └── gameover.lua
│   └── modules/              # spillmoduler – matcher MT/TB/PR-funksjonsnotatene
│       ├── mt/init.lua
│       ├── tb/init.lua
│       └── pr/init.lua
├── assets/
│   ├── images/
│   ├── fonts/                # legg pixel-Arial her
│   └── audio/
└── lib/                      # tredjepartsbiblioteker
```

## Gameloop

MT, TB og PR er ikke separate spill — de er tre faser av samme runde.
En run består av mange runder:

```
menu → [ MT → TB → PR → shop ] ↻ ... → gameover
       └── én runde (én sløyfe)
```

Felles run-state (round, height, pips, money, ...) ligger i
`src/core/game.lua` og leses/skrives av alle fasene.

Hver state er en tabell med `enter`, `update`, `draw`, `keypressed`,
`mousepressed`. State-machine forwarder hendelser automatisk.

## Tastatursnarveier (i skjelett-versjonen)

- `ENTER` fra menyen → start run
- `SPACE` → neste fase (MT → TB → PR → shop → MT → ...)
- `BACKSPACE` (i MT) → avbryt run, tilbake til meny
- `ENTER` (i shop) → neste runde
- `ESC` → avslutt

## Neste steg

1. Bytt PEAR36-fargene i `src/core/colors.lua` mot de eksakte hex-verdiene fra lospec
2. Last inn pixel-Arial som font
3. Implementer domino-datastruktur i `src/modules/mt/init.lua`
4. Bygg ut tårn-fysikken i `src/modules/tb/init.lua`
5. Lag pip toss-animasjonen i `src/modules/pr/init.lua` – dette skal være den mest tilfredsstillende delen av spillet
