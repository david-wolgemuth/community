run:
	venv/bin/honcho start

build:
	@venv/bin/python -m community

watcher:
	venv/bin/watchmedo shell-command \
		--pattern='*.html;*.md;*.py' \
		--recursive \
		--command='make build' \
		--drop \
		community data templates

serve:
	venv/bin/python -m http.server --directory out 8000

fetch:
	@venv/bin/python -m community events

bootstrap:
	test -d venv || python3 -m venv venv
	venv/bin/pip install -r requirements.txt
	npm install
