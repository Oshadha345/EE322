# Branch Strategy

## Primary Branches

- `main`: protected, releasable, always buildable.
- `feature/<topic>`: implementation work.
- `docs/<topic>`: documentation-only updates.

## Optional Lab Branch Namespace

- `lab/<layer>-<name>`
- Example: `lab/l2-timer0-ctc`

## Pull Request Expectations

1. Include build result and target lab path.
2. Include timing impact notes for ISR/timer changes.
3. Include flashing risk assessment for low-level hardware changes.

