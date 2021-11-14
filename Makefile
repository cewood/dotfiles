TARGET = src

.PHONY: init-check
init-check:
	TEST=true ./.stow-fold.sh ${TARGET}

.PHONY: init
init:
	./.stow-fold.sh ${TARGET}

.PHONY: stow-check
stow-check:
	stow \
	  --verbose=2 \
	  --no \
	  ${TARGET}

.PHONY: stow
stow:
	stow \
	  --verbose=2 \
	  ${TARGET}

.PHONY: adopt-check
adopt-check:
	stow \
	  --verbose=2 \
	  --no \
	  --adopt \
	  ${TARGET}

.PHONY: adopt
adopt:
	stow \
	  --verbose=2 \
	  --adopt \
	  ${TARGET}

.PHONY: restow-check
restow-check:
	stow \
	  --verbose=2 \
	  --no \
	  --restow \
	  ${TARGET}

.PHONY: restow
restow:
	stow \
	  --verbose=2 \
	  --restow \
	  ${TARGET}

.PHONY: git-crypt-status
git-crypt-status:
	git-crypt \
	  status -e

.PHONY: git-crypt-status-all
git-crypt-status-all:
	git-crypt \
	  status
