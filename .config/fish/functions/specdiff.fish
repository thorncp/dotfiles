function specdiff -d "Diff RSpec between two Git trees" -a left right
  set -l pattern "describe\|it\|context\|specify"
  test -z $left; and set -l left (git main-local)
  test -z $right; and set -l right 'HEAD'

  $DIFF -b -U 3 \
    (git grep -w -h --no-line-number --no-color -e $pattern $left -- spec/ | psub) \
    (git grep -w -h --no-line-number --no-color -e $pattern $right -- spec/ | psub)
end
