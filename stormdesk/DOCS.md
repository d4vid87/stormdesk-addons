# StormDesk

A self-hosted dashboard for your own weather station — Tempest, Ecowitt, Ambient Weather, Davis
via WeatherLink Live, AcuRite through rtl_433, La Crosse, and anything that speaks the Weather
Underground or Ecowitt upload protocol.

## Install

Start it. There is nothing to configure here — the dashboard configures itself, in its own
Settings drawer, on first run.

Open it from the sidebar. The first-run wizard asks which brand of station you have and where it
is, and that is usually the whole setup.

## Your station

**Tempest with a token** — paste a personal use token from tempestwx.com → Settings → Data
Authorizations. Everything else follows from it.

**Tempest with no token at all** — this add-on runs with host networking, so it hears the hub's
own broadcasts on UDP 50222 directly. Nothing to configure; readings appear as the hub sends
them.

**Ecowitt, Ambient Weather, a Weather Underground clone, rtl_433** — these push to a URL. The
wizard shows the address to paste into the console's app, which will be
`http://<your Home Assistant>:8088/ingest`.

**Davis via WeatherLink Live** — the wizard's *Find console* button looks for it on the network
by itself.

## Home Assistant

The dashboard publishes to Home Assistant over MQTT, and the setup is in its own Settings drawer
rather than here: **Settings → Home Assistant → Publish the station**. Point it at the same broker
Home Assistant uses — the Mosquitto add-on is `core-mosquitto:1883` from in here — and press
**Test both**.

Home Assistant then discovers one device with nineteen entities under it, with no YAML and no
custom component.

The full guide, including the blueprints and the entity list, is in
[the StormDesk docs](https://github.com/d4vid87/stormdesk/blob/main/docs/homeassistant.md).

There is also a [custom integration](https://github.com/d4vid87/ha-stormdesk) if you would
rather not run a broker, or if you want a weather entity with a forecast card — MQTT discovery has
no weather platform.

## Storage

Everything lives in the add-on's own data directory: one settings file and one SQLite archive of
every reading it has ever heard. It is included in Home Assistant's backups.

The archive grows by roughly a megabyte a month at one reading a minute. Years of it is fine on
any machine that runs Home Assistant OS.

## A note on the network

This add-on runs with **host networking**, because a Tempest hub broadcasts its readings to the
whole subnet and a broadcast does not survive Docker's bridge network. It is the difference
between a Tempest working with no token and not working at all.

That has a consequence worth stating plainly: **port 8088 is reachable from your LAN**, and Ingress
does not hide it. Anyone on your network who opens `http://<your Home Assistant>:8088` gets the
dashboard, and the dashboard's LAN routes will hand them the settings blob — which includes your
Tempest API token and any broker password.

This is the same posture as every other way of installing StormDesk, and it is deliberate: the
console on the kitchen wall has no keyboard to log in with. It assumes a LAN you trust. If that is
not your situation, do not expose this to the internet, and put an authenticating proxy in front
of it if your LAN is shared.

## Backups

The Supervisor's own backup covers the data directory, so a snapshot has your settings and your
whole archive in it. There is also **Settings → Export everything** in the dashboard, which writes
a single file — note that it contains your API token in plain text and says so before writing.
