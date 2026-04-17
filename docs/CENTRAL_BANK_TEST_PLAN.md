# Central Bank Test Plan

## 1) Initialization
- Start new game.
- Verify `central_bank_initialized` exists for player tag.
- Load save and verify values are not reset unexpectedly.

## 2) Decisions visibility and category binding
- Open decisions panel.
- Verify categories are visible only after init.
- Verify all decisions appear under:
  - `central_bank_policy_category`
  - `central_bank_fiscal_category`
  - `central_bank_dashboard_category`

## 3) Monthly tick
- Let game run one month.
- Verify `central_bank_update_monthly` affects GDP/inflation/debt values.
- Confirm normalization clamps remain within defined bounds.

## 4) Event triggers and cooldown
- Force debt/inflation/fx thresholds via console variable edits.
- Confirm `central_bank.100`, `central_bank.200`, `central_bank.300` fire.
- Confirm cooldown flags prevent immediate re-fire.
- Confirm stage-2/stage-3/stage-recovery events chain correctly.

## 5) Localisation completeness
- Inspect decisions/events/ideas and confirm no raw keys appear in UI.
- Run validator and confirm event title key coverage.

## 6) error.log check
- Boot game with mod enabled and run at least 3 months.
- Inspect `error.log` for parser/unknown trigger/effect/localisation errors.
- Resolve all central_bank-related errors before release.
