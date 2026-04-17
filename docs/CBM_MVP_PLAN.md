# CBM Economy Overhaul — MVP Script Blueprint

This document converts the high-level economy design into a practical Hearts of Iron IV mod structure for an MVP.

## 1) Folder architecture

- `common/on_actions/cbm_on_actions.txt`
  - Monthly and 90-day tick hooks.
- `common/scripted_effects/cbm_scripted_effects.txt`
  - Macro update, GDP update, debt dynamics, inflation consequences, risk bucket refresh.
- `common/scripted_triggers/cbm_scripted_triggers.txt`
  - Reusable threshold triggers (inflation high, debt critical, FX crisis, policy space).
- `common/decisions/cbm_decisions.txt`
  - Central bank and fiscal policy decisions.
- `common/ideas/cbm_ideas.txt`
  - Risk-state and policy-framework spirits.
- `events/cbm_events.txt`
  - Hidden monthly runner + visible crisis chain entry events.
- `tools/validate_cbm.sh`
  - Lightweight consistency checks for required files, runner wiring and localisation keys.
- `localisation/english/cbm_l_english.yml`
  - UI and event localization keys.

## 2) MVP variables (country scope)

Core eight variables:

1. `cbm_gdp`
2. `cbm_gdp_growth`
3. `cbm_inflation`
4. `cbm_unemployment`
5. `cbm_public_debt`
6. `cbm_debt_to_gdp`
7. `cbm_financial_confidence`
8. `cbm_crisis_risk`

Optional scaffolded variables already included in scripts for Phase 2 extension:

- `cbm_policy_rate`, `cbm_liquidity_stance`, `cbm_fiscal_stance`
- `cbm_fx_pressure`, `cbm_fx_reserves`, `cbm_banking_health`
- `cbm_industry_productivity`, `cbm_war_econ_stress`, `cbm_supply_shock_risk`

Starting profiles now include tag-based overrides for major economies and selected regional powers (e.g. USA, GER, SOV, ENG, FRA, JAP, ITA, TUR, ARG) to avoid homogeneous starts.

## 3) MVP loop implemented

- Monthly: hidden event calls `cbm_effect_monthly_macro_update`.
- Macro update pipeline:
  1. GDP update
  2. Debt dynamics update
  3. Inflation consequence update
  4. Crisis risk bucket refresh
  5. Basic AI policy response
- 90-day pulse placeholder for global GDP ranking refresh.
- 90-day pulse now updates major-tag global GDP cache variables (`g_cbm_rank_*`) shown in the dashboard event.

## 4) Included playable policy actions

- Raise policy rate (small / large)
- Cut policy rate
- Open market tightening / easing
- Defend currency with reserves
- Emergency liquidity window
- Fiscal stance shifts (austerity / neutral / expansion)
- Crisis management actions (war bonds, capital controls, debt reprofiling)
- Reform actions (tax collection, state capacity drive, anti-corruption)
- Central bank regime actions (independent, political, peg-like, war finance)
- Fiscal composition actions (social/infra/industry/R&D reallocation)

## 5) Included crisis entry events (phase seeds)

- Debt crisis warning (`cbm_debt_crisis.1`)
- Inflation spiral warning (`cbm_infl_spiral.1`)
- FX crisis warning (`cbm_fx_crisis.1`)
- Bank panic warning (`cbm_bank_panic.1`)
- Follow-up steps for debt and FX chains (`cbm_debt_crisis.2/.3`, `cbm_fx_crisis.2/.3`)
- Follow-up steps for inflation and banking chains (`cbm_infl_spiral.2/.3`, `cbm_bank_panic.2/.3`)

## 6) Balance notes

- Uses deterministic threshold + accumulation logic to avoid abrupt RNG punishments.
- Crisis events include 90-day cooldown flags to avoid repetitive spam firing.
- Early game tolerance can be implemented by adding date/country flag checks in `cbm_effect_refresh_risk_bucket`.
- Includes early-game tolerance window (before July 1, 1937) and ideology-aware AI reactions.
- Majors can run full model later; minors can call a simplified update effect.

## 7) Next step (recommended)

Implement Phase-2 split:

- Add spending composition variables and effects.
- Add central bank regime spirits and regime-specific decision availability.
- Add AI strategy blocks for policy packages by ideology + war state.
