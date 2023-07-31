function specdiff -d "Diff RSpec between two Git trees" -a left right
  set -l pattern "describe|it|context|specify|feature|scenario"
  test -z $left; and set -l left (git main-local)
  test -z $right; and set -l right 'HEAD'

  $DIFF -b -U 3 \
    (git grep -w -h --no-line-number --no-color -Ee $pattern $left -- spec/ | ag -v '^\s+#'| psub) \
    (git grep -w -h --no-line-number --no-color -Ee $pattern $right -- spec/ | ag -v '^\s+#'| psub)
end
