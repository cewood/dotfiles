.PHONY: stow-check
stow-check:
	stow \
	  --verbose=2 \
	  --no \
	  src

.PHONY: stow
stow:
	stow \
	  --verbose=2 \
	  src

.PHONY: adopt-check
adopt-check:
	stow \
	  --verbose=2 \
	  --no \
	  --adopt \
	  src

.PHONY: adopt
adopt:
	stow \
	  --verbose=2 \
	  --adopt \
	  src

.PHONY: restow-check
restow-check:
	stow \
	  --verbose=2 \
	  --no \
	  --restow \
	  src

.PHONY: restow
restow:
	stow \
	  --verbose=2 \
	  --restow \
	  src

.PHONY: git-crypt-status
git-crypt-status:
	git-crypt \
	  status -e

.PHONY: git-crypt-status-all
git-crypt-status-all:
	git-crypt \
	  status
