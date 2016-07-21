A) creating git branch to work on
- create new git branch and switch to it at the same time
```
$git checkout -b "feature/listings"
$git add .
$git commit -m "listing model done"
```
- create remote branch, and push my code there
```
$git push origin feature/listings
```



B) check your teammate branch, by pulling it from remote branch(github)

```
$git checkout master
$git status
- will show that u r on master
- rmbr: you dont pull the branch to replace ur local master branch
```

```$git checkout -b "check check"```
- for eg.:
```
$git pull origin feature/users
```

C) update your local master branch with UPDATED remote master branch
```$git checkout master```
```%git pull origin master ```

