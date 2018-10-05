# my dotfiles
my personalized dotfiles along with themes, new installation for mac.

## For a new Machine Run

```bash
./install.sh
```

## Extras

- You will need to manually install virtualbox
- You will need to generate ssh-key
- You might need to use [powerline](https://github.com/powerline/powerline) with the
  [powerline](https://github.com/powerline/fonts) fonts
- You will need to set caps lock to change language

### Clone all repos of organization
```
curl -H "Authorization: token <token>" https://api.github.bus.zalan.do/orgs/<org>/repos\?per_page\=200 | grep clone_url | awk -F '"' '{print $4}' | xargs -n 1 -P 4 git clone
```
