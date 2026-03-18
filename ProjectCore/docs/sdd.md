# Subtopology `ProjectCore`

My Subtopology Description

> Utilizes the [F Prime Subtopology autocoder](https://github.com/mosa11aei/fprime-subtopology-tool).

## Related Diagrams
Add any related diagrams here

## Requirements
Add requirements in the chart below
| Name | Description | Validation |
|---|---|---|
|---|---|---|

## Instantiation

```
# TODO: EDIT THIS

topology Inst {}
@<! is topology ProjectCore base id 0xAAAA with {
@<! # fill in as appropriate    
@<! }
```

## Redefine-able Instances
| Instance name | Component |
|---|---|
|---|---|

## Subtopology Interface

**Input interface instance**: `module.NameOfInputInterface`
**Output interface instance**: `module.NameOfOutputInterface`

### Input Interface

Going into `ProjectCore`.

| Input port | Output port pair | Type      |
| ---------- | ---------------- | --------- |
| clock      | clock_in         | Svc.Sched |

### Output Interface

Going out of `ProjectCore`.

| Output port | Input port pair  | Type      |
| ----------- | ---------------- | --------- |
| clock_out   | clock            | Svc.Sched |

## Change Log
| Date | Description |
|---|---|
|---| Initial Draft |