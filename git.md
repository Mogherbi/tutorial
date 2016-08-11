A) creating git branch to work on
- create new git branch and switch to it at the same time
```
$git checkout -b "feature/listings"
$git add .
$git commit -m "listing model done"
```

B) check if there is any conflict with current remote master branch
```
- checkout to my local master branch
$git checkout master 

- pull the latest code from remote master branch
$git pull origin master

- checkout to my local branch feature/listings
$git checkout feature/listings

- merge it with my local master branch code
$git merge master

- solve any conflicts if there are any

- create remote(github in this case) branch, and push my code there

$git push origin feature/listings
```

C) go to github.com , create a pull request, 
  inform the master of repository to perform merging if it has no more conflicts.
  
D) DONE, you are now reading to code on another branch if you want to.
   Or further updating the branch feature/listings 
