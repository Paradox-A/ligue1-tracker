#!/bin/bash
# Requires FOOTBALL_DATA_API_TOKEN env var set (free key from football-data.org)
set -e
curl -s -H "X-Auth-Token: $FOOTBALL_DATA_API_TOKEN" "https://api.football-data.org/v4/competitions/FL1/standings" -o standings.json
curl -s -H "X-Auth-Token: $FOOTBALL_DATA_API_TOKEN" "https://api.football-data.org/v4/competitions/FL1/matches" -o matches.json
curl -s -H "X-Auth-Token: $FOOTBALL_DATA_API_TOKEN" "https://api.football-data.org/v4/competitions/FL1/scorers?limit=50" -o scorers.json

# No working free source found for Ligue 1 cards/real assists (ligue1.com's own stats
# hub is currently broken client-side; other free sites are behind anti-bot walls or
# prohibit scraping). football-data.org is the only source used here.

python3 build_site.py
echo "Rebuilt site/index.html"
