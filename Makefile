git-push-to-all := "git remote | xargs -L1 git push --all"

.PHONY: update-overlay
update-overlay:
	git add .
	git commit -m 'auto update: ebuilds update'
	git remote | xargs -L1 git push --all

.PHONY: update-readme
update-readme:
	git add .
	git commit -m 'auto update: readme update'
	git remote | xargs -L1 git push --all

.PHONY: update-makefile
update-makefile:
	git add .
	git commit -m 'auto update: makefile update'
	git remote | xargs -L1 git push --all

.PHONY: update-metadata
update-metadata:
	git add .
	git commit -m 'auto update: metadata update'
	git remote | xargs -L1 git push --all
