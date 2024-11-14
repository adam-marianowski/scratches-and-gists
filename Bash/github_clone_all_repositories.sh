gh repo list adam-marianowski --limit 4000 | while read -r repo _; do
  gh repo clone "$repo" "$repo"
done