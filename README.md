# action-filter-by-payload

GitHub Action that filter by event payload.

## Arguments

You have to pass three arguments.

1. Path of the JSON property (e.g. `commit.committer.login`)
2. Relational Operator (one of [`eq`, `ne`, `gt`, `lt` `ge`, `le`, `gr`])
3. Value for comparing (constant value or JSON path)

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

When success CI checks on master branch, deploy project using GitHub Actions.

```hcl
workflow "New workflow" {
  on = "status"
  resolves = ["Deploy to fly.io"]
}

action "Run only master branch" {
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "Success CI checks" {
  uses = "mika-f/action-filter-by-payload@master"
  needs = ["Run only master branch"]
  args = "state eq success"
}

action "Deploy to fly.io" {
  uses = "mika-f/action-deploy-to-flyio@master"
  needs = ["Success CI checks"]
  secrets = ["FLY_ACCESS_TOKEN"]
}
```
