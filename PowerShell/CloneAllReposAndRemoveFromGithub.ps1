# This script will clone all your repositories from github and delete them. 
# You must obtain Github Personal Access Token and set it to $env:GH_TOKEN for it to work. 

$env:GH_TOKEN = 'myGithubAuthToken'
$repos = gh repo list --json name --limit 100 | ConvertFrom-Json

foreach ($repo in $repos) {
    gh repo clone $repo.name ./repos/$repo
    gh repo delete $repo.name --yes
}