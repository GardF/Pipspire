# CLAUDE.md – Pips / Piptower

Dette er en kontekstfil for Claude Code. Les denne først når du starter en ny sesjon i prosjektet.

## Prosjekt i ett avsnitt

Pips (også kalt Piptower / Pipspire) er et roguelike domino-spill bygd i **LÖVE 2D (Lua)**. Kjernekonseptet er "Balatro møter Mexican Train": du bygger et tårn av domino-brikker som må nå himmelen, men som kan velte. Mefistofeles er maskoten – det er et Faust-inspirert tema der du forhandler med djevelen for å få tårnet høyere.

## Identitet og tone

- **Tema:** Babels tårn. Et tre kan ikke nå til himmelen hvis røttene ikke når til helvetesild.
- **Maskot:** Mefistofeles. Spilleren signerer en kontrakt med ham (derfor Arial-font i pixel art – Arial brukes i kontrakter).
- **Tone:** "Faustisk alvor og berserker-glede, men mest faustisk alvor." Følelsen av en viking på slagmarken som koser seg, uten faktisk vold/blod.
- **Inspirasjon i progresjon:** Hades – du starter på 0 etter hver fullført sesjon, men visuell stil/farger endres på nye nivåer for å gi følelse av fremgang. Reell oppgradering er liten (ny powerup unlockes), ikke våpenoppgradering som i Hades.

## Visuelle valg

- **Stil:** Pixel art
- **Fargepalett:** PEAR36 fra LOSPEC
- **Font:** Arial i pixel art-utgave
- **Bordduk:** Klassisk casino-rød
- **Powerups:** Pixel art-stil (se moodboard i `Pipspire - Identitet (ideer).md`)

## Tre spillmoduser

Koden er delt i tre moduler – hver har sin egen `Functions`-fil:

1. **MT – Mexican Train** (`piptower_MT - Functions`): Domino-leggingen, kjernemekanikken hvor brikker plasseres
2. **TB – Tower Building** (`piptower TB - Functions`): Bygging av tårnet, zoomet inn-perspektiv
3. **PR – Piprush** (`piptower PR - Functions`): Zoomet ut-perspektiv hvor hele tårnet vises og kan velte

## State machine (fra sekvensdiagrammet)

```
State 0: Place piece (spilleren legger brikke)
State 1: Opponent places piece + ny brikke til settet
State 2: Finish round
State 3: Add last piece to spire (tårnet)
State 4: Pip Toss (gjenværende pips kastes på tårnet → øker sjanse for velting)
State 5: Game Over / Shop
State 6: Next Round
```

Bygging skjer zoomet inn. Pip Toss skjer zoomet ut.

## Powerup-system

**Trains (vehicles):**
- Locomotive
- Chariot (gir ekstra spire-byggebrikke)
- Mule, Horse, Seahorse
- Ghost train (engangsbruk, forsvinner)
- "Flip last piece"-evne

**Dominos:**
- Standard, black, wood
- Cards
- Kinesiske spillebrikker

## Major spheres (progresjon-nivåer)

Basert på Dantes paradis-sfærer:
The Moon → Mercury → Venus → The Sun → Mars → Jupiter → Saturn → The Fixed Stars → The Primum Mobile → The Empyrean

## Sentrale designdokumenter

Når du jobber med en spesifikk del av spillet, sjekk relevant dokument:

| Tema | Fil |
|---|---|
| Hovedindeks | `Pips.md` |
| Identitet/tone | `Pips - Identitet.md`, `Pipspire - Identitet (ideer).md` |
| Gjeldende konsept | `Piptower Basic Concept 0.1-0.3` |
| Originalt konsept-utkast | `Pipspire - Basic Concept.18.excalidraw.md` |
| Sekvensdiagram | `Pips - Sequence Diagram.excalidraw.md` |
| MT-mekanikk | `Mexican Train (MT)`, `piptower_MT - Functions` |
| TB-mekanikk | `Tower Building (TB)`, `piptower TB - Functions` |
| PR-mekanikk | `Piprush (PR)`, `piptower PR - Functions` |
| LÖVE 2D notater | `LOVE Erfaringer` |
| Lyd | `Piptower - Holbergs Electric Suite` |
| Marketing | `Press kit`, `Love 2d release til alle plattformer` |

## Tagging-konvensjon i notater

- `#pipsire_TB` – Tower Building-relatert
- `#pipspire_MT` – Mexican Train-relatert
- `#pipspire_PR` – Piprush-relatert (antatt)

## Når du skriver kode

- Språk: Lua (LÖVE 2D)
- Hold modulene MT/TB/PR adskilt der det gir mening – de har separate `Functions`-filer
- Excalidraw-filer er komprimert JSON og må eksporteres til PNG hvis du vil "se" dem visuelt
- Bygg-perspektiv vs. tårn-perspektiv er en sentral arkitekturbeslutning – tenk på kameralogikk tidlig

## Hva spilleren skal føle

Ekstrem satisfaction når tårnet velter eller står. Pip Toss-fasen skal være den følelsesmessige toppen i hver runde – det er der spenningen avgjøres.
