# Changelog

All notable changes to Pigeon Vehicle Doors are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project uses [Semantic Versioning](https://semver.org/spec/v2.0.0.html):

- **Major** versions can need changes to your configuration or other resources. Read the **Upgrade notes**.
- **Minor** versions add features without breaking existing setups.
- **Patch** versions fix bugs only.

## [Unreleased]

First release.

### Highlights

- `/door`, `/window`, `/hood` and `/trunk`, with optional keys
- One door, all of them, your own or the nearest
- Windows kept on the vehicle for everyone
- Checked by the server, locks respected
- 23 languages

### Added

- `/door`, `/window`, `/hood` and `/trunk`, each with an optional key, opening and closing the vehicle the player is in or the nearest unlocked one on foot.
- Door and window numbers 1 to 4, or `all`, or none for the player's own door and window or the door they're nearest.
- `Config.PassengersOwnOnly`: passengers use only their own door and window, the driver everything.
- Server checks on every request for the vehicle, seat, distance, lock, numbers and rate.
- Doors moved by the vehicle's controlling game so they sync, and windows kept in a server-set `pigeonWindows` vehicle state bag.
- Messages and key binding names in 23 languages, following ox_lib's language with `Config.Locale = 'auto'`.
- Update checker from the Pigeon Studios version registry.

[Unreleased]: https://github.com/pigeon-studios-uk/pigeon-vehicle-doors/commits/main
