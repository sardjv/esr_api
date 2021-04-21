# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.8.4] - 2021-04-21

### Changed

- Removed Port and Path from FtpCredential, as they are constant currently.
- Updated documentation links.

## [0.8.3] - 2021-04-09

### Added

- Add documentation site to this repo.
- Add Quickstart Guide to docs.

## [0.8.2] - 2021-04-09

### Added

- Add import logic, UI and API for Competence Definition Record.

## [0.8.1] - 2021-04-09

### Changed

- Handle AssignmentRecord, PositionRecord and PersonRecord with different to and from dates.

## [0.8.0] - 2021-04-07

### Changed

- Trigger initial snapshot from FTP as soon as FtpCredential is created.
- Download data from FTP daily at 8am instead of 5am.
- Only download files we've not imported before; don't delete from the FTP.
- Change port to 3001 to not clash with Murfin+.

## [0.7.2] - 2021-03-26

### Added

- Add method to request initial snapshot from FTP.

## [0.7.1] - 2021-03-22

### Added

- Add hint text to boolean checkbox fields.
- Add hints for User#activated and User#point_of_contact.

## [0.7.0] - 2021-03-18

### Added

- Add FtpCredential to store FTP access data.
- Add dummy FTP server container for testing.
- Add FtpMock to cache FTP requests in tests.
- Update ETL pipeline to download files directly from FTP.
- Add Sidekiq cronjob to request data from FTP daily at 5am.

## [0.6.8] - 2021-02-25

### Changed

- Get Rubocop passing.
- Add Rubocop to CI.

## [0.6.7] - 2021-01-27

### Changed

- Switch to using docker-compose override file for easier development.

## [0.6.6] - 2021-01-27

### Added

- Add signup link to homepage.

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
