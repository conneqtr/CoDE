# The Git Repository

#### delete remote branch

`git push --delete origin <branch_name>`

`git branch --delete <branch_name>`

if a branch reference is hanging around locally that has already been deleted on the server

`git remote prune`

`git fetch --prune`

#### log for a single branch

switch to branch

`git log master..`

### which commits are in that branch but not in this

`git log ..<that_branch>`

### which commits are in this branch but not in that

`git log <that_branch>..`

#### log with file change details

`git log --stat`

#### create new upstream branch

`git push --set-upstream origin <branch_name>`

#### resurrect a file

`git checkout <commit_file_was_last_in> -- <file_name>`

-- may be optional, commit is optional if the file was in previous commit

#### restore file to previous version

`git checkout <commit_of_version_to_restore_to> -- <file_name>`

(notes as above for 'resurrect a file')

#### update last commit message

`git commit --amend -m <new_message>`

#### show details (in. diff) of a commit

`git show <commit>`

#### show files in commit

`git show --name-only <commit>`

`git show --name-status <commit>`

#### show previous version of file

`git show revision:path/to/file`

`git show HEAD~4:src/main.c`

#### merge dry-run (without committing)

`git merge --no-commit`  (dubious usefulness)

`git merge --abort`

#### ignore files/directories 

adding a file to `.gitignore` will do nothing if it was previously tracked 

do this as well

`git rm --cached <filename>`

for directories add the -r (recursive) flag


#### check if a particular file is being ignored

`git check-ignore <filename>`

add the -v (verbose) flag for more information

#### force add ignored files

to seed remote repo' with at least the current version of ignored files

`git add --force`

#### show ignored files

`git status --ignored`

#### refer to previous commit 

`HEAD^`

#### list files that are different between two branches

`git diff --name-only <branch1>..<branch2> `

- in modern git you can omit the dots 

- `--name-status` is a useful variation

- drop the flag altogether for normal content diff

#### show the commit history of a file/folder

`git log <filename>`

#### show the change (or diff) history

`git log -p <filename>`

#### protect files during merges

add the following to your `.gitconfig`

```yaml
[merge "ours"]
    name = "Keep ours merge"
    driver = true
```

then in the directory where the file to be protected resides add the following to a `.gitattributes` file.

`<filename> merge=ours`

#### difference between my branch and another branch

... useful before a merge

actual content diff

`git diff <branchname>`

list files that will be changed

`git diff <branchname>  --name-only`

list of commits coming across

`git log <our branch>..<their branch> `



if diff highlighting seems the wrong way round, try

`git diff ..<branchname>` 

#### diff between the last two versions of this file

`git diff <previous_commit> filename`

#### detailed status of all branches

`git branch -a -vv`

#### keep file but ignore all future changes

`git update-index --skip-worktree <file_name>`

and you may need to do that in all branches where the file occurs

#### create branch from stash

`git stash branch <new_branchname>`

#### show contents of stash

`git stash show --patch`

#### undo a fetch   

... from e.g. origin/master

`git update-ref refs/remotes/origin/master refs/remotes/origin/master@{1}`

(https://stackoverflow.com/questions/15254480/reverse-a-git-fetch)

#### which files are being ignored

`git status --ignored`

#### why is a file being ignored

`git check-ignore --verbose <filename>`

#### commits from specific author

`git log --author=jon`

will match jon, jonathan, jon smith etc.

#### rename branch

`git branch -m <oldname> <newname>`

#### take unstaged changes to a different branch

`git stash`

`git checkout <other_branch>`

`git stash pop`

#### keep ours/theirs during merge conflict

`git checkout --ours/theirs file.in.question`

#### find deleted file somewhere in history

commits which affected said file

`git log --all --full-history  -- /path/to/file`

add `--patch` so see actual changes to files then

`git checkout <commit>^ -- /path/to/file` 

#### squash recent commits

e.g squash last 2 commits into the commit prior

`git reset --soft HEAD~3` 

`git commit`

#### history of all transactions / history of everything

git reflog

#### which branches is this commit in 

git branch --contains <commit>


### merge conflicts : just accept all their changes

`git merge --abort`

abort merge after getting conflicts

`git merge --strategy-option=theirs`
