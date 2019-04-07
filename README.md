# action-filter-by-event-payload

GitHub Action that filter by event payload.

## Arguments

You have to pass three arguments.

1. Path of the JSON property (e.g. `commit.committer.login`)
2. Relational Operator (one of [`eq`, `ne`, `gt`, `lt` `ge`, `le`, `gr`])
3. Value for comparing (constant value, e.g. `mika-f`, `1234567890`)

### Relational Operator

| Operator | Description                   |
| -------- | ----------------------------- |
| `eq`     | A equals to B                 |
| `ne`     | A not equals to B             |
| `gt`     | A greater than B              |
| `ge`     | A greater than or equals to B |
| `lt`     | A less than B                 |
| `le`     | A less than or equals to B    |
| `gr`     | A contains B                  |

## Usage

When commit sender is equals to repository owner on master branch, print message "Hello, World".

```hcl
workflow "New workflow" {
  on = "push"
  resolves = ["print message 'Hello, World'"]
}

action "Run only master branch" {
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "Check commit sender is repository owner" {
  uses = "mika-f/action-filter-by-event-payload@master"
  needs = ["Run only master branch"]
  args = "sender.login eq mika-f"
}

action "print message 'Hello, World'" {
  uses = "actions/bin/sh@master"
  needs = ["Check commit sender is repository owner"]
  args = ["echo 'Hello, World'"]
}
```
