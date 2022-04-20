.PHONY: overlay-update
update-overlay:
	git add .
	git commit -m 'auto update: ebuilds update'
	git remote | xargs -L1 git push --all

.PHONY: readme-update
readme-update:
	git add .
	git commit -m 'auto update: readme update'
	git remote | xargs -L1 git push --all

.PHONY: makefile-update
makefile-update:
	git add .
	git commit -m 'auto update: makefile update'
	git remote | xargs -L1 git push --all

.PHONY: metadata-update
metadata-update:
	git add .
	git commit -m 'auto update: metadata update'
	git remote | xargs -L1 git push --all

.PHONY: orphan-update
orphan-update:
	portageq --orphaned > ./orphaned_packages/orphaned_packages.txt
	qlist -Iv $(portageq --repo gentoo --orphaned) > ./orphaned_packages/installed_orphaned_packages.txt
	git add .
	git commit -m 'auto update: orphaned packages update'
	git remote | xargs -L1 git push --all
