set -e
set -x
export COMMIT_MSG="$(git log -1 --pretty=%B)"
echo "PR_TITLE=$COMMIT_MSG" >>$CM_ENV
export LOWERCASE_MSG="$(tr '[:upper:]' '[:lower:]' <<<"$COMMIT_MSG")"
if [[ $LOWERCASE_MSG != *"codemagic ignore"* ]]; then
    echo "Commit message does not include 'codemagic ignore', moving forward..."
else
    echo "Commit including 'codemagic ignore' in it's message, ignoring it"
    exit 1
fi
