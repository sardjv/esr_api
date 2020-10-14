# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.3.0] - 2020-10-14

### Added

- Show version in app.

### Changed

- Display Tokens index in descending order.

### Fixed

- Sidekiq dashboard, which was broken by the switch to Devise.

## [0.2.0] - 2020-10-14

### Added

- Add User#timezone so we handle British Summer Time properly.
- Users can change their timezone.

## [0.1.0] - 2020-10-14

### Added

- Add Events.
- Track all changes to models.
- Track API requests.
- Track admin sign in and out.
- Add UI index of events.

### Changed

- Refresh and show changes to views during development.
- Set application root to ui/users.
