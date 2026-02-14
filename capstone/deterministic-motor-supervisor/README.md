# Deterministic Motor Supervisor

## Scope

- Deterministic PWM-based motor drive.
- Fault-state machine (normal, degraded, safe-stop).
- Cooperative periodic tasks with measured runtime limits.

## Success Criteria

1. No blocking delays in main execution path.
2. Documented interrupt latency bound.
3. Jitter remains within target envelope.

