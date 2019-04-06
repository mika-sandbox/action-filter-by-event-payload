workflow "New workflow" {
  on = "push"
  resolves = ["print message 'Hello, World'"]
}

action "Run only master branch" {
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "Check commit sender is repository owner" {
  uses = "./"
  needs = ["Run only master branch"]
  args = "sender.login eq mika-f"
}

action "print message 'Hello, World'" {
  uses = "actions/bin/sh@master"
  needs = ["Check commit sender is repository owner"]
  args = ["echo 'Hello, World'"]
}