# Ligue 1 2026-27 Tracker

A static tracker for Ligue 1 (France's top flight), mirroring the Premier League/Championship/Bundesliga trackers, with three tabs:
- **League Table**: full standings, color-coded by European qualification zone (Champions League, CL play-off, Europa League, Conference League play-off) and relegation (play-off spot at 16th, automatic at 17th-18th), plus a "European Race" view of the top 7 and a "Relegation Watch" view of what each bottom-table team needs to reach safety.
- **Club Stats**: clean sheets, home/away form splits, biggest wins & heaviest losses — all derived from match results.
- **Player Stats**: Top Scorer race and goal involvements.

## Data sources
- [football-data.org](https://www.football-data.org/) free API (Ligue 1 competition code `FL1`) — standings, matches, goals/penalties. This is the **only** source used.

**Why no cards/real-assists source (unlike the Premier League, LaLiga, Bundesliga, and Serie A trackers)**: ligue1.com's own stats hub is currently broken in production — the "Statistics" tab on club pages crashes client-side (`Cannot read properties of undefined (reading 'playerIdentity')`) before it ever fetches data, confirmed via console errors, network request capture (no stats API call ever fires), and inspecting the page's embedded Next.js state (no stats payload present anywhere, server- or client-side). Third-party alternatives (fbref, WhoScored) are either behind Cloudflare bot-challenges or explicitly prohibit scraping for republishing in their terms of use. If ligue1.com's site gets fixed, this could be revisited using the same investigative approach as the other trackers.

## Regenerating

```bash
export FOOTBALL_DATA_API_TOKEN=your_token_here
./fetch_data.sh
git add index.html
git commit -m "Refresh standings"
git push
```

Not live-updating — rebuild after each matchday (or whenever) to refresh the table.
