# File Structure

## Central Bank module (new standardized namespace)

- `common/on_actions/central_bank_on_actions.txt`
  - only on_action wiring; no inline scripted effects.
- `common/scripted_effects/central_bank_effects.txt`
  - initialization, monthly macro update, decision effects, event checks, normalization.
- `common/scripted_triggers/central_bank_triggers.txt`
  - thresholds and emergency triggers.
- `common/decisions/central_bank_decisions.txt`
  - category-bound decisions.
- `common/ideas/central_bank_ideas.txt`
  - persistent state ideas.
- `events/central_bank_events.txt`
  - triggered-only crisis chains + one MTTH informational event with cooldown.
- `localisation/english/central_bank_l_english.yml`
  - all decision/event/idea/category keys.
- `common/opinion_modifiers/central_bank_opinion_modifiers.txt`
  - opinion modifiers used by scripted effects.
- `common/scripted_variables/central_bank_variables.txt`
  - documented variable defaults.

## Notes
- This implementation uses **dashboard decisions/events**, not a custom `gui/*.gui` implementation yet.
