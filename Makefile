.PHONY = build

run:
	@uv run honcho start

bootstrap:
	uv sync
	npm --prefix techcity/services/builder install

serve:
	uv run manage.py runserver

frontend:
	npm --prefix techcity/services/builder run tailwind

fetch:
	@uv run manage.py fetch_events

# This is mostly for the scenario where the output data files need to be manipulated
# and reformatted and we don't want to keep hitting the Meetup APIs slowly.
fetch-cached:
	@uv run manage.py fetch_events --cached

test:
	uv run pytest --cov techcity
