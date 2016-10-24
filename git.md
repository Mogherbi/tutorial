Create .git tracker folder
```
$git init
```
Add in remote destination
```
$git remote add origin xxxx.git
```
Show me all the local branches
```
$git branch
``` 
Show me all the local and remote branches (one in green one in red)
```
$git branch --all
``` 
Push it to remote destination named master
```
$git push origin master (u name it master)
```

----------------
A) Creating git branch to work on and switch to it at the same time

```
$git checkout -b "feature/listings"
$git add .
$git commit -m "listing model done"
```

B) Check if there is any conflict with current remote master branch
- checkout to my local master branch
```
$git checkout master 
```


C) Pull the latest code from remote master branch (in case my team members updated it)
```
$git pull origin master
```


D) Checkout(go back) to my local branch feature/listings
```
$git checkout feature/listings
```


E) Merge it with my local master branch code
```
$git merge master
```

F) Solve any conflicts if there are any (it will be shown on your terminal, which file/files)

G) Create remote(github in this case) branch, and push my code there

```
$git push origin feature/listings
```

H) Go to github.com , create a pull request, 
  inform the master team leader of repository to perform merging if it has no more conflicts.

I) DONE, you are now reading to code on another branch if you want to.
   Or further updating the branch feature/listings 




