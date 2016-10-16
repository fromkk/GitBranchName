# Sample of display git branch name

Add **branch.plist** to top of project.  
Change scheme to **Shared**  
Set build target to `Provide build setting from ***`

add code to **Scheme/Build/Pre-actions/Run Script**

```bash
branch="master"
if [ ! -z "${CIRCLE_BRANCH+x}" ]; then
    branch=$CIRCLE_BRANCH
elif [ ! -z "${TRAVIS_BRANCH+x}" ]; then
    branch=$TRAVIS_BRANCH
elif [ ! -z "${BITRISE_GIT_BRANCH+x}" ]; then
    branch=$BITRISE_GIT_BRANCH
else
    git_path=$(which git)
    if [ -e $git_path ]; then
        branch=$($git_path --git-dir=$PROJECT_DIR/.git rev-parse --abbrev-ref HEAD)
    fi
fi

plistName=$PROJECT_DIR/Branch
plistPath=$plistName.plist
if [ ! -e $plistPath ]; then
touch $plistPath
fi
chmod u+wr,g+wr,o+r $plistPath
defaults write $plistName "branch" $branch
```

Build your apps then generated file of **Branch.plist**

You can get branch name from **Branch.plist**.  

For example:

```swift
struct Branch {
    private enum Constants {
        static let defaultBranch: String = "master"
        static let plistFileName: String = "Branch"
        static let branchNameKey: String = "branch"
    }

    static var current: String {
        guard let path: String = Bundle.main.path(forResource: Constants.plistFileName, ofType: "plist") else {
            return Constants.defaultBranch
        }
        guard let plist: NSDictionary = NSDictionary(contentsOfFile: path) else {
            return Constants.defaultBranch
        }
        return (plist[Constants.branchNameKey] as? String) ?? Constants.defaultBranch
    }
}
```
