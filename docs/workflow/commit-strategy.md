# Commit Strategy

Use small, reviewable, testable commits.

## Commit Style

`type(scope): summary`

Types:
- `feat`
- `fix`
- `docs`
- `refactor`
- `test`
- `chore`

Examples:
- `feat(lab-01): add pure asm led blink and make target`
- `fix(timer0): correct compare value for 1 kHz tick`
- `docs(flashing): add fuse backup policy`

## Rules

1. One behavioral change per commit.
2. Include rationale in body for timing-sensitive changes.
3. For fuse/toolchain changes, include rollback notes.

