# v2.3.0 2024-02-09
## What's Changed
- Tree shake the config (no rules change)

# v2.2.0 2024-01-30
## What's Changed
- Add rubocop-factory_bot

# v2.1.0 2024-01-26
## What's Changed
- Add cops for Rails + NxtCore logger functionality

# v2.0.2 2024-01-10
## What's Changed
* Disable more cops depending on the code style in our backend-services

* **Full Changelog**: https://github.com/nxt-insurance/nxt_cop/compare/v2.0.1...v2.0.2

# v2.0.1 2024-01-10
## What's Changed
* Disable more cops depending on the code style in our backend-services

* **Full Changelog**: https://github.com/nxt-insurance/nxt_cop/compare/v2.0.0...v2.0.1

# v2.0.0 2023-11-28
## What's Changed
* Enabled all cops by default

**Full Changelog**: https://github.com/nxt-insurance/nxt_cop/compare/v1.3.1...v2.0.0

# v1.3.1 2023-10-10
## What's Changed
* Bumped dependencies version

**Full Changelog**: https://github.com/nxt-insurance/nxt_cop/compare/v1.3.0...v1.3.1

# v1.3.0 2023-09-22
## What's Changed
* `inherit_mode` was added to `default.yml`

**Full Changelog**: https://github.com/nxt-insurance/nxt_cop/compare/v1.2.1...v1.3.0

# v1.2.1 2023-08-23
## What's Changed
* Add `Lint/MixedCaseRange`
* Add `Lint/RedundantRegexpQuantifiers`

**Full Changelog**: https://github.com/nxt-insurance/nxt_cop/compare/v1.2.0...v1.2.1

# v1.2.0 2023-08-23
## What's Changed
Bumped dependencies version

**Full Changelog**: https://github.com/nxt-insurance/nxt_cop/compare/v1.1.1...v1.2.0

# v1.1.1 2023-05-23
## What's Changed
* Add `Lint/DuplicateMatchPattern`
* Add `Layout/EmptyLineAfterMagicComment`

**Full Changelog**: https://github.com/nxt-insurance/nxt_cop/compare/v1.1.0...v1.1.1

# v1.1.0 2023-05-05
## What's Changed
* Change `DotPosition` to enforce leading dots for method invocation
* Add multiple autocorrectable layout cops

**Full Changelog**: https://github.com/nxt-insurance/nxt_cop/compare/v1.0.19...v1.1.0

# v1.0.19 2023-04-04

## What's Changed
* Add `Layout/SpaceBeforeComma`
* Add `Layout/SpaceAfterComma`
* Add `Layout/EmptyLines` cops ([#80](https://github.com/nxt-insurance/nxt_cop/pull/80)) 

**Full Changelog**: https://github.com/nxt-insurance/nxt_cop/compare/v1.0.18...v1.0.19

# v1.0.18

## What's Changed
* Add `Rails/Date` cop ([#50](https://github.com/nxt-insurance/nxt_cop/pull/50))

**Full Changelog**: https://github.com/nxt-insurance/nxt_cop/compare/v1.0.17...v1.0.18

# v1.0.17 2022-08-19

## What's Changed
* Adjust severity of the recently added  Lint/SymbolConversion cop ([#45](https://github.com/nxt-insurance/nxt_cop/pull/45))

**Full Changelog**: https://github.com/nxt-insurance/nxt_cop/compare/v1.0.16...v1.0.17

# v1.0.16 2022-07-07

## What's Changed
* Add RSpec/Focus cop ([#38](https://github.com/nxt-insurance/nxt_cop/pull/38))
* Configure recently added cops ([#39](https://github.com/nxt-insurance/nxt_cop/pull/39))

**Full Changelog**: https://github.com/nxt-insurance/nxt_cop/compare/v1.0.15...v1.0.16

# v1.0.15 2022-05-18

## What's Changed
* Don't enforce trailing comma in hash literals rule ([#30](https://github.com/nxt-insurance/nxt_cop/pull/30))

**Full Changelog**: https://github.com/nxt-insurance/nxt_cop/compare/v1.0.14...v1.0.15

# v1.0.14 2022-05-04

## What's Changed
* 🚨 [security] Upgrade rubocop: 0.92.0 → 1.25.1 (major) by @depfu in https://github.com/nxt-insurance/nxt_cop/pull/19
* Upgrade rubocop: 1.25.1 → 1.28.2 (minor) by @depfu in https://github.com/nxt-insurance/nxt_cop/pull/26
* Allow including repos use their own ruby version by @shalvah-gs in https://github.com/nxt-insurance/nxt_cop/pull/27
* Update rubocop-rails: 2.13.2 → 2.14.2 (minor) by @depfu in https://github.com/nxt-insurance/nxt_cop/pull/22

**Full Changelog**: https://github.com/nxt-insurance/nxt_cop/compare/v1.0.13...v1.0.14

# v1.0.12 2020-12-29

### Update Gems

# v1.0.11 2020-12-29

### Fix
- Add `require: rubocop-rails` to `default.yml`

# v1.0.10 2020-12-01

### Added
- `Style/HashSyntax`

# v1.0.9 2020-10-15

### Added
- `Layout/EmptyLinesAroundClassBody`
- `Layout/EmptyLinesAroundBlockBody`

# v1.0.8 2020-10-01

### Removed
- Lint/MissingSuper

# v1.0.7 2020-09-29

Updated Rubocop Version

### Added
- All new Cops
- Style/MutableConstant

# v1.0.6 2020-08-03

### Added

- `Layout/SpaceBeforeBlockBraces`
- `Layout/SpaceInsideBlockBraces`

# v1.0.5 2020-07-27

### Added

- `Layout/TrailingEmptyLines`

# v1.0.4 2020-07-23

### Added

- `Style/TrailingCommaInArguments`

### Removed

- Gemfile.lock from .gitignore
