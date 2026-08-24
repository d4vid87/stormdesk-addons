# WeatherDesk add-ons for Home Assistant

Home Assistant OS add-on for [WeatherDesk](https://github.com/d4vid87/weatherdesk) — a
self-hosted dashboard for your own weather station.

## Install

[![Add repository to my Home Assistant][repo-badge]][repo-url]

Or by hand: **Settings → Add-ons → Add-on Store → ⋮ → Repositories**, and add

```
https://github.com/d4vid87/weatherdesk-addons
```

Then install **WeatherDesk** from the store and start it. Nothing to configure — the dashboard
configures itself on first run, and appears in your sidebar.

## What's in here

| Add-on | |
| --- | --- |
| [WeatherDesk](weatherdesk) | The dashboard. Tempest, Ecowitt, Ambient, Davis, AcuRite, La Crosse and the upload protocols. Publishes to Home Assistant over MQTT. |

## Also worth knowing

- [WeatherDesk itself](https://github.com/d4vid87/weatherdesk) — desktop apps, Docker, Android.
- [The Home Assistant guide](https://github.com/d4vid87/weatherdesk/blob/main/docs/homeassistant.md) — MQTT setup, the entity list, blueprints, the JSON API.
- [ha-weatherdesk](https://github.com/d4vid87/ha-weatherdesk) — a custom integration, for a weather entity with a forecast or for a house with no broker.

## Licence

MIT.

[repo-badge]: https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg
[repo-url]: https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fd4vid87%2Fweatherdesk-addons
