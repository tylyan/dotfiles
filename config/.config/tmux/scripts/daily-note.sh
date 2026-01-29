#!/bin/bash

# Generate daily note path with format: YYYY-MM-DD Day.md
daily_note="/Users/tommy/Library/Mobile Documents/iCloud~md~obsidian/Documents/Life/00 - Homepage/daily-notes/$(date '+%Y-%m-%d %a').md"

nvim "$daily_note"
