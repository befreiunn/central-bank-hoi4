#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

required_files=(
  "common/on_actions/cbm_on_actions.txt"
  "common/scripted_effects/cbm_scripted_effects.txt"
  "common/scripted_triggers/cbm_scripted_triggers.txt"
  "common/decisions/cbm_decisions.txt"
  "common/ideas/cbm_ideas.txt"
  "events/cbm_events.txt"
  "localisation/english/cbm_l_english.yml"
)

for file in "${required_files[@]}"; do
  [[ -f "$file" ]] || { echo "Missing required file: $file"; exit 1; }
done

# quick structural checks
rg -q "cbm_effect_monthly_macro_update" common/scripted_effects/cbm_scripted_effects.txt
rg -q "country_event = \{ id = cbm\.1000" events/cbm_events.txt || rg -q "id = cbm\.1000" events/cbm_events.txt
rg -q "cbm_central_bank_policies" common/decisions/cbm_decisions.txt
rg -q "cbm_reform_packages" common/decisions/cbm_decisions.txt
rg -q "cbm_central_bank_regimes" common/decisions/cbm_decisions.txt
rg -q "cbm_fiscal_composition" common/decisions/cbm_decisions.txt
rg -q "cbm_open_macro_breakdown" common/decisions/cbm_decisions.txt
rg -q "^l_english:" localisation/english/cbm_l_english.yml
rg -q "g_cbm_rank_usa" common/scripted_effects/cbm_scripted_effects.txt
rg -q "g_cbm_rank_10_score" common/scripted_effects/cbm_scripted_effects.txt
rg -q "cbm_global_gdp_rank" common/scripted_effects/cbm_scripted_effects.txt
rg -q "cbm_dbg_infl_net" common/scripted_effects/cbm_scripted_effects.txt

# ensure all event IDs used in file have loc title keys
while read -r event_id; do
  key="${event_id}.t"
  if ! rg -q "^[[:space:]]*${key}:0" localisation/english/cbm_l_english.yml; then
    echo "Missing localisation key: ${key}"
    exit 1
  fi
done < <(rg -o 'id = ([a-zA-Z0-9_\.]+)' -r '$1' events/cbm_events.txt | sort -u)

echo "CBM validation passed."
