prepare:
	pre-commit install
	pre-commit install --install-hooks -t commit-msg

disable:
	pre-commit uninstall
	pre-commit uninstall -t commit-msg
