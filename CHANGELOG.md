# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.6.5] - 2021-01-27

### Fixed

- Fix for papertrail migration issue caused by upgrade to Ruby 3.

## [0.6.4] - 2021-01-26

### Changed

- Add script to generate .env file.

## [0.6.3] - 2021-01-26

### Changed

- The first admin user is now automatically activated and made a point of contact.

## [0.6.2] - 2021-01-25

### Changed

- Upgrade to Ruby 3.

## [0.6.1] - 2020-11-24

### Changed

- Handle race condition in import jobs.

## [0.6.0] - 2020-11-20

### Added

- Add production mode configuration.

## [0.5.0] - 2020-11-17

### Changed

- Add separate queues per record type to improve import speed.

## [0.4.6] - 2020-10-16

### Fixed

- Fix CSV export to cope will nil dates.
- Fix FakeDataJob queue name.

## [0.4.5] - 2020-10-16

### Fixed

- Fix import to skip LOV records.
- Prevent Sidekiq from retrying failed import jobs.

## [0.4.4] - 2020-10-15

### Fixed

- Fix import to cope with filename timestamps on 30th/31st day of month.

## [0.4.3] - 2020-10-15

### Fixed

- Fix import timestamp format.

## [0.4.2] - 2020-10-15

### Fixed

- Import multiple files in the order of their timestamps, rather than alphanumerically.

## [0.4.1] - 2020-10-14

### Changed

- Approve the [BSD 0-Clause](https://tldrlegal.com/license/bsd-0-clause-license), a permissive license which is used by the Yarn dependency Snyk.

## [0.4.0] - 2020-10-14

### Added

- Add rake task to import all files from a directory.

## [0.3.2] - 2020-10-14

### Fixed

- Fix issue where API causes error if page parameter is missing.
- Fix issue where API causes error if requested record does not exist.

## [0.3.1] - 2020-10-14

### Fixed

- Remove old version number file.

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
