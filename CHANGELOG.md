# Changelog

All notable changes to this project will be documented in this file.

## [5.16.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.15.0...v5.16.0) (2023-04-20)


### Features

* **ecs-apps:** allow force destroy for alb logs s3 bucket ([#171](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/171)) ([f62e654](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/f62e654a6b3bb0974a2c611f5a6518c3e7457b45))

## [5.15.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.14.1...v5.15.0) (2023-04-20)


### Features

* **ecs-apps:** allow overriding the workspace part of cluster and networking name | CS-1473 ([#170](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/170)) ([b36a1cc](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/b36a1ccd3ed4cbfe40046166040b0c7810b6f0fd))

## [5.14.1](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.14.0...v5.14.1) (2023-04-20)


### Bug Fixes

* **ecs-apps:** readme update ([#177](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/177)) ([f924643](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/f924643dce96a7da3c0698d572f434f153af9bf4))

## [5.14.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.13.0...v5.14.0) (2023-04-19)


### Features

* **ecs-apps:** monitor customization ([#168](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/168)) ([3e7d804](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/3e7d80479183a1145d56258fca3b110d972c9dd0))

## [5.13.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.12.0...v5.13.0) (2023-04-18)


### Features

* enable auto version upgrade, custom option group ([#173](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/173)) ([f98e9e8](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/f98e9e8f579357ed4fc2d64d5e20b78433bc24a9))

## [5.12.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.11.2...v5.12.0) (2023-04-17)


### Features

* **ecs-apps:** allow suppress the task definition ([#156](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/156)) ([#172](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/172)) ([ed99cb1](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/ed99cb117948c63878a33064c5913684ff9f0576))

## [5.11.2](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.11.1...v5.11.2) (2023-04-03)


### Bug Fixes

* don't create synthetic health check test for internal services ([#165](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/165)) ([70f859b](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/70f859ba8d0ee777a8d6f7e44bd5bdfc11cd4d97))

## [5.11.1](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.11.0...v5.11.1) (2023-03-29)


### Bug Fixes

* **redis:** enable automated backups ([#162](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/162)) ([bb919db](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/bb919db869092d43db2560bf9269de8c3cbf629a))

## [5.11.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.10.0...v5.11.0) (2023-03-23)


### Features

* **APPSTAB-82:** add require_full_window capability to datadog monitor ([#160](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/160)) ([3a5a9f0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/3a5a9f05281a91b430ec8433c83224d19a615761))

## [5.10.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.9.3...v5.10.0) (2023-03-23)


### Features

* **APPASTAB-82:** add evaluation_delay capability to datadog monitor ([#158](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/158)) ([bf0cbe6](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/bf0cbe670c8c63e03a5c9c192ca817fdd4d0ef15))

## [5.9.2](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.9.1...v5.9.2) (2023-02-28)


### Bug Fixes

* restrict redis port to vpc cidr ([2a680d7](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/2a680d7a5f90a367632ab655a4dc91c95d1e8b03))

## [5.9.1](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.9.0...v5.9.1) (2023-02-23)


### Bug Fixes

* **ecs-apps:** remediate internet exposed security group findings on security hub ([#145](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/145)) ([3aba47c](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/3aba47c75177de1300c51699530f23f8ad07ff90))

## [5.9.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.8.5...v5.9.0) (2023-02-23)


### Features

* **ecs-apps:** make blue termination timeout configurable ([#146](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/146)) ([8b40772](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/8b40772346788fc227d8e75bcc438134cc9d1b29))

## [5.8.5](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.8.4...v5.8.5) (2023-02-13)


### Bug Fixes

* **ecs-apps:** minor fixes ([#138](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/138)) ([a2fa0a4](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/a2fa0a4742f63cc7783f553620d92bbf8288d178))

## [5.8.4](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.8.3...v5.8.4) (2023-02-13)


### Bug Fixes

* **ecs-apps:** minor fixes ([#135](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/135)) ([a8d3055](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/a8d305530ce2d1ea3e9a998663f6c5e51ee0ca94))

## [5.8.3](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.8.2...v5.8.3) (2023-02-08)


### Bug Fixes

* **ecs-apps:** enable alb logs on all microservices ([#133](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/133)) ([50faddf](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/50faddf647d3454990798f53a9d73ec994f26acb))

## [5.8.2](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.8.1...v5.8.2) (2023-02-08)


### Bug Fixes

* **ecs-apps:** enable alb logs on all microservices ([#131](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/131)) ([c66ca0c](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/c66ca0cf17cd19ef5fc507c7a05632060d0991c3))

## [5.8.1](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.8.0...v5.8.1) (2023-02-08)


### Bug Fixes

* **ecs-apps:** enable alb logs on all microservices ([#129](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/129)) ([8c0bb52](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/8c0bb525bdeb16610ac291fb75facb2f2ac480de))

## [5.8.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.7.0...v5.8.0) (2023-02-07)


### Features

* add security group id to outputs ([#128](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/128)) ([1e702ce](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/1e702ce2828c01e458c65fbaf15eb0fc1876f294))

## [5.7.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.6.0...v5.7.0) (2023-02-07)


### Features

* add the master_password to the output ([#127](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/127)) ([48457a2](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/48457a2a5bb731ffe9d1ccf0b50df416f1fbf8d1))

## [5.6.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.5.0...v5.6.0) (2023-02-06)


### Features

* add outputs to rds module ([#124](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/124)) ([52b6566](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/52b65660591df85ad19d23d43f069c0038daf406))

## [5.5.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.4.0...v5.5.0) (2023-02-03)


### Features

* **ecs-apps:** enable alb logs on all microservices ([#123](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/123)) ([b28170c](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/b28170c494c89a4351684e8d891428b2c99f0534))

## [5.4.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.3.0...v5.4.0) (2023-02-03)


### Features

* **rds:** allow snapshot identifiers to create instance ([#122](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/122)) ([6e5b89a](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/6e5b89a7d3d5d684ec31f6552e9dcd524dbf5a50))

## [5.3.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.2.6...v5.3.0) (2023-02-01)


### Features

* store database reader endpoint on ssm ([#121](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/121)) ([e4abddd](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/e4abddd314fb4d47c4eff47abe3e887f3ca36fa6))

## [5.2.6](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.2.5...v5.2.6) (2023-01-30)


### Bug Fixes

* **ecs-apps:** correct the tags and http client ([#120](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/120)) ([dc60a2d](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/dc60a2dac271d5a742ae72b9f9c246bd397adae1))

## [5.2.4](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.2.3...v5.2.4) (2023-01-27)


### Bug Fixes

* **ecs-apps:** validation does not allow omitting monitors in the tf module ([#118](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/118)) ([1ec0b3a](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/1ec0b3aef5a1213bd5f009bbc5e9f19a775455f4))
* enable integration testing on github actions with matrix support for speed ([#111](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/111)) ([21cce90](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/21cce903cac1e03cb0570866c1dbf5d4962ada05))

## [5.2.4](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.2.3...v5.2.4) (2023-01-26)


### Bug Fixes

* enable integration testing on github actions with matrix support for speed ([#111](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/111)) ([21cce90](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/21cce903cac1e03cb0570866c1dbf5d4962ada05))

## [5.2.3](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.2.2...v5.2.3) (2023-01-25)


### Bug Fixes

* **ecs-apps:** validation does not allow omitting monitors in the tf module ([#110](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/110)) ([aa76aad](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/aa76aad367f0a781cd62ad246f8352326871f610))

## [5.2.2](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.2.1...v5.2.2) (2023-01-24)


### Bug Fixes

* **ecs/apps:** can pass now additional certificates for alb ([#113](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/113)) ([4fbd914](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/4fbd914464243c7c206a6e45739ee5d9a8ad76d0))

## [5.2.1](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.2.0...v5.2.1) (2023-01-24)


### Bug Fixes

* **ecs/apps:** can pass now additional certificates for alb ([#112](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/112)) ([1af020b](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/1af020b25fbe2ba85d941ae01a49c3c14aa6ce73))

## [5.2.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.1.5...v5.2.0) (2023-01-23)


### Features

* **rds-module:** add the rds extra params ([#108](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/108)) ([2b3e098](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/2b3e09832fe7556612b012f5d4aadb65cb7e9567))

## [5.1.5](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.1.4...v5.1.5) (2023-01-20)


### Bug Fixes

* **ecs/apps:** allow to create the internal alb ([#107](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/107)) ([f373a86](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/f373a86f04b7fbaeea5414aab4c3f78643e33110))

## [5.1.4](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.1.3...v5.1.4) (2023-01-18)


### Bug Fixes

* **ecs/apps:** the monitor service tag ([#106](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/106)) ([478448e](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/478448e693292f2b91d07db312a539fa78f4c8a7))

## [5.1.3](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.1.2...v5.1.3) (2023-01-18)


### Bug Fixes

* **aws/monitor:** the service tag value ([#105](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/105)) ([8f28d46](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/8f28d4683ced4a20ab8c636b20ad0bbf4d9fb8fa))

## [5.1.2](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.1.1...v5.1.2) (2023-01-17)


### Bug Fixes

* add fullstop to resolve validation errors ([#104](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/104)) ([43b0208](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/43b02086d35ff942ca9cb26ae1c9804e017ac712))

## [5.1.1](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.1.0...v5.1.1) (2023-01-17)


### Bug Fixes

* reduce the number of domains in the parameter ([#103](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/103)) ([630f25d](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/630f25d17c25b2670b38a2a06e7cb9caf04befe7))

## [5.1.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.0.2...v5.1.0) (2023-01-10)


### Features

* **ecs-apps:** enable customization of interval and timeout for alb health check ([#102](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/102)) ([7238ed4](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/7238ed486ff8415f4f9681fb63dfefcd31989675))

## [5.0.2](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.0.1...v5.0.2) (2022-12-28)


### Bug Fixes

* ignore service_registries in lifecycle to prevent service destruction during migration ([#98](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/98)) ([736df22](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/736df22e188ed9e10145ea96fba56309d19ad519))

## [5.0.1](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v5.0.0...v5.0.1) (2022-12-19)


### Bug Fixes

* validation error syntax error ([#96](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/96)) ([0873402](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/0873402e07f143dbba55eba827910daa2030d8c1))

## [5.0.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v4.4.0...v5.0.0) (2022-12-13)


### ⚠ BREAKING CHANGES

* **ecs-apps:** you must add the tags in your AWS provider

### Features

* **ecs-apps:** drop the tags from AWS resources ([10e9ddd](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/10e9ddd0ca4b594bc9ba97b2d542313dc54c1edb))

## [4.4.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v4.3.1...v4.4.0) (2022-12-08)


### Features

* **ecs-apps:** customize container_name ([e45620d](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/e45620d258a8eb5d273229776ca0d792d503dc9c))

## [4.3.1](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v4.3.0...v4.3.1) (2022-12-08)


### Bug Fixes

* **ecs-apps:** receive team name as variable ([bb466a1](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/bb466a11ddc085a6ec4964faa57212cf15560dcf))

## [4.3.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v4.2.1...v4.3.0) (2022-12-08)


### Features

* **ecs-apps:** customize dns_weighted_identifier ([480f695](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/480f69525473a4e81ec1f55bcf0a6dec4069a213))

## [4.2.1](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v4.2.0...v4.2.1) (2022-12-08)


### Bug Fixes

* resolve character limit on aws resources ([#89](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/89)) ([04a84b8](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/04a84b8cc9b04582ca96f759ede29c89da2657d0))

## [4.2.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v4.1.1...v4.2.0) (2022-12-07)


### Features

* **ecs-apps:** allow route53 to be weighted record if required ([750c1bc](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/750c1bc8da2280c27645c9308fc6de03176c857f))

## [4.1.1](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v4.1.0...v4.1.1) (2022-12-07)


### Bug Fixes

* resolve character limit on aws resources ([#87](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/87)) ([e503ab9](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/e503ab967b5a4007ab00b5771bc2d5169619bee2))

## [4.1.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v4.0.1...v4.1.0) (2022-11-23)


### Features

* **aws/ecs-apps:** fargate monitoring ([0d80223](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/0d80223e846004a0b49404876defebeacda2f750))

## [4.0.1](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v4.0.0...v4.0.1) (2022-11-16)


### Bug Fixes

* **aws/rds:** error message typo ([9288539](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/9288539711d218cfd665e5f73ce6c3ee1e652e7d))
* **aws/rds:** iops for the database were too high ([19329e1](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/19329e133080872aa46bd042618de9ffdd312cc7))

## [4.0.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v3.1.2...v4.0.0) (2022-11-16)


### ⚠ BREAKING CHANGES

* **aws/rds:** the team/ssm_param_name/environment are mandatory

### Features

* **aws/rds:** add Datadog monitors ([8366b2f](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/8366b2f3dc5442d4829bfb2776c73783e7b6908c))

## [3.1.2](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v3.1.1...v3.1.2) (2022-11-16)


### Bug Fixes

* **aws/ecs-apps:** use monitor version 3.1.1 and append missing latency_next_js monitor ([#78](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/78)) ([e671374](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/e671374bf68a36e3d64fa58e628612824c54f500))

## [3.1.1](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v3.1.0...v3.1.1) (2022-11-16)


### Bug Fixes

* **datadog:** monitor tags do not match APM desired configuration ([#77](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/77)) ([a037536](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/a037536777a0a465ef08aa8eb89138e572253c11))

## [3.1.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v3.0.0...v3.1.0) (2022-11-16)


### Features

* **kinesis:** create kinesis module ([#73](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/73)) ([eaf9d8e](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/eaf9d8ecfbb693691692d631c46551cce9439b39))

## [3.0.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v2.4.4...v3.0.0) (2022-11-15)


### ⚠ BREAKING CHANGES

* **datadog:** who calls this module, must remove the variables

### Bug Fixes

* **datadog:** remove DD variables ([556794b](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/556794b7c8bcd00a1d6816285b7626d984c5583a))

## [2.4.4](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v2.4.3...v2.4.4) (2022-11-10)


### Bug Fixes

* remove redundant variable ([#72](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/72)) ([200dfec](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/200dfecca881c8bac1a9cecbf520f0e19d64b7a7))

## [2.4.3](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v2.4.2...v2.4.3) (2022-11-10)


### Bug Fixes

* nits on name, tags on redis cluster resource and do not overwrite secrets ([#71](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/71)) ([b1d6ac1](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/b1d6ac18e7ce772bafd73d2c0e19e4e185b56b5c))

## [2.4.2](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v2.4.1...v2.4.2) (2022-11-08)


### Bug Fixes

* move policies to variables for better service adaptability ([#70](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/70)) ([c2e3106](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/c2e3106d9b0aee2df9412038ce2c421f1d5cd93d))

## [2.4.1](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v2.4.0...v2.4.1) (2022-11-08)


### Bug Fixes

* add env tag to datadog modules ([#69](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/69)) ([77c8d03](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/77c8d03ee21d5f1e8fd8fa38df44e92e308b99d9))

## [2.4.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v2.3.0...v2.4.0) (2022-11-07)


### Features

* **ecs-apps:** import synthetic health checks module into monitor ([#68](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/68)) ([f5c1a7f](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/f5c1a7f99a20590a3f39eb14e5db18faa2ac51a9))

## [2.3.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v2.2.0...v2.3.0) (2022-11-07)


### Features

* **datadog:** remove synthetic healthchecks from ecs-apps ([#67](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/67)) ([f7f19a0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/f7f19a04a846da7043bbaf098d440531a234924f))

## [2.2.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v2.1.0...v2.2.0) (2022-11-05)


### Features

* **redis:** deploy elasticache package ([#65](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/65)) ([acad512](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/acad512291d56ea70b6e7d5ac8a0860b94a9ad81))

## [2.1.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v2.0.0...v2.1.0) (2022-10-31)


### Features

* **rds:** add rds module ([#60](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/60)) ([bb481f6](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/bb481f6cc9a21b38f53086c15eaa1d6f49bde15e))

## [2.0.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v1.15.10...v2.0.0) (2022-10-27)


### ⚠ BREAKING CHANGES

* **ecs-apps:** modules must not give environmental map values anymore

### Code Refactoring

* **ecs-apps:** dry module ([#56](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/56)) ([890e95f](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/890e95fa7106c95ab54bac2df2887f8dde7ac3aa))

## [1.15.10](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v1.15.9...v1.15.10) (2022-10-26)


### Bug Fixes

* pr lint version was wrong ([104a345](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/104a345345eff2b42524c6862c399fd581b26471))

## [1.15.5](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v1.15.4...v1.15.5) (2022-10-18)


### Bug Fixes

* revert gcp ([#50](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/50)) ([61dc03a](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/61dc03a1781c4872931538dc7d03bca6ae66c149))

## [1.14.7](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v1.14.6...v1.14.7) (2022-10-12)


### Bug Fixes

* ST-112 Added the slo and monitors for next js applications  ([#39](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/39)) ([887def8](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/887def8f8db464d389e5f3d19c1c37cd25b5ad9d))

## [1.14.6](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v1.14.5...v1.14.6) (2022-10-11)


### Bug Fixes

* add prod-shadow environment to gcp variable ([#38](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/38)) ([d65c4f3](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/d65c4f3bfd7253a98d45980b36986d4aa935a69b))

## [1.14.3](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v1.14.2...v1.14.3) (2022-09-28)


### Bug Fixes

* release prod-shadow ([c86744e](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/c86744e209aa5a27a42bba40bf9fe139aa0fed48))

## [1.14.2](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v1.14.1...v1.14.2) (2022-09-19)


### Bug Fixes

* enable latency monitor ([#33](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/33)) ([307a8fe](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/307a8fe76abd53b34615f152c43cc691c214f2e4))

## [1.14.1](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v1.14.0...v1.14.1) (2022-09-19)


### Bug Fixes

* slo error ([8a0e252](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/8a0e252052941a73aa29b36f82a351b4f36f6d68))

## [1.14.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v1.13.3...v1.14.0) (2022-09-19)


### Features

* configurable and conditional threshold slo monitors ([e20c3e9](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/e20c3e98a24e171af361fdc4c686ad5151d6a474))


### Bug Fixes

* flawed threshold configuration logic ([cd6e581](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/cd6e5811e42a5643c442e4ce032c40d2154fda29))
* for_each and count cannot be used together error ([74193aa](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/74193aa38d4de51aa7437a9fd5a1ce2f55345ea3))

## [1.13.3](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v1.13.2...v1.13.3) (2022-09-01)


### Bug Fixes

* change monitor path after module update ([#30](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/30)) ([93efdf9](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/93efdf90b64492ce2ab5c4a2fd2aefe22171d456))

## [1.13.2](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v1.13.1...v1.13.2) (2022-09-01)


### Bug Fixes

* upgrade module version to 1.13.1 ([#29](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/29)) ([affc2fa](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/affc2fa4012d402cf5dcfa73bbcfa2daf12e920b))

## [1.13.1](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v1.13.0...v1.13.1) (2022-09-01)


### Bug Fixes

* remove provider from modules ([cb2b8bb](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/cb2b8bb6cf7db0611e524bae4292962301ce932e))

## [1.13.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v1.12.1...v1.13.0) (2022-09-01)


### Features

* improve slo testing ([#27](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/27)) ([efb4603](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/efb46037ba78b02b83679b2c484682399a94cca0))

## [1.12.1](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v1.12.0...v1.12.1) (2022-09-01)


### Bug Fixes

* **ecs-apps:** allow many datadog monitor ([d917557](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/d917557b11c40202bc219b71af4f16685d0aa828))
* force new release ([81f17cc](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/81f17cc3beb433a5e9138c3fb3661b2019c80e9b))

## [1.12.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v1.11.0...v1.12.0) (2022-09-01)


### Features

* force new release ([b2e8d4b](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/b2e8d4ba62bc396251406a6e30c5b069ca3537b8))

## [1.11.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v1.10.1...v1.11.0) (2022-09-01)


### Features

* **ecs-app:** DD monitor, SLO and synthetic ([4da907a](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/4da907a6dccc0b3fab15828fdd025a41f3f7e71c))

## [1.10.1](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v1.10.0...v1.10.1) (2022-08-30)


### Reverts

* Revert "feat: add environment override for preprod" (#22) ([3d35617](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/3d35617183c5cb52174d2cdeab561988bcc75441)), closes [#22](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/22) [#21](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/21)

## [1.10.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v1.9.0...v1.10.0) (2022-08-16)


### Features

* add environment override for preprod ([#21](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/21)) ([e32c51d](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/e32c51d2c4f6e6769ff6d6a90b50d3554ee045b3))

## [1.9.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v1.8.0...v1.9.0) (2022-07-20)


### Features

* add parent service for apionly breakouts ([#20](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/20)) ([6946201](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/6946201dbce08ad26f5cf5a80732aaaf99597e5a))

## [1.8.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v1.7.5...v1.8.0) (2022-07-18)


### Features

* add ecs service name ([#19](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/19)) ([273a875](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/273a8756ede144e47979dfeb5fcd250f4ae66a66))

## [1.7.2](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v1.7.1...v1.7.2) (2022-07-04)


### Bug Fixes

* alb name char limitation ([dfb8069](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/dfb8069ae6e0e2f953b4802cd78c2fc25d3ed257))

## [1.6.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v1.5.1...v1.6.0) (2022-06-17)


### Features

* **ecs-apps:** customize health_check_grace_period on ecs service ([1e1720b](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/1e1720b89c88bd823f9dc4ebc3ef2fc2ac654e5c))

## [1.5.1](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v1.5.0...v1.5.1) (2022-06-16)


### Bug Fixes

* stop recreating ecs service ([0af2b69](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/0af2b69bec9984c42469a6cdb5fc0d2d05345daf))

## [1.5.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v1.4.0...v1.5.0) (2022-06-16)


### Features

* limit parameter store access on ecs apps ([f7b860d](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/f7b860d251deaca806edeb36a6adb101cbd4a780))

## [1.4.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v1.3.2...v1.4.0) (2022-06-16)


### Features

* Add standard health check parameters for all applications ([258e868](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/258e868365d190d8889346aea44820a6bf5bae5d))

## [1.3.2](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v1.3.1...v1.3.2) (2022-06-15)


### Bug Fixes

* drop environment from container name ([ce1d77c](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/ce1d77c2e94bbf40e181469aac90350c8b3a35a3))

## [1.3.1](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v1.3.0...v1.3.1) (2022-06-10)


### Bug Fixes

* fix aws issues with providers ([04d470d](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/04d470db8cf3f2364a150443df43ea28eaaa2c5c))

## [1.3.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v1.2.1...v1.3.0) (2022-06-10)


### Features

* add ecs apps deployment ([2eadcc5](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/2eadcc55597f33e6d7c91a1a9c402a4846b82d1e))
* update ecs apps deployment ([3e7d3a4](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/3e7d3a4e82f9595bc0948499ae04bea0f03db765))
* update ecs apps deployment ([e593409](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/e5934096b113c315c0d679487be7d98df07aed1e))
* update ecs apps deployment ([b61a520](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/b61a52081838bdfd689f5d0a3cc4f4f1bc0d3e64))

### [1.2.1](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v1.2.0...v1.2.1) (2022-05-26)


### Bug Fixes

* terraform release ([2ba9131](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/2ba913191c96ef28d5768878187ae05cf42adfa0))

## [1.2.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v1.1.0...v1.2.0) (2022-05-25)


### Features

* added examples for datadog monitor module ([217cc38](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/217cc3811a6d68a6df857ac48bc2d578dcfa7f10))
* added examples for datadog SLO module ([a113d6d](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/a113d6de5f63bd0ac6a06c83dfa995c2f3214cc9))


### Bug Fixes

* remove an empty list of string from the array unless specified ([a22f199](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/a22f199757df4d757bb3a6af07beaaaeaf6dc479))
* remove timestamp as data gives a timestamp already ([ede33ba](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/ede33ba8856cf2746139ad4641fdae31f9035527))

## [1.1.0](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/compare/v1.0.0...v1.1.0) (2022-05-18)


### Features

* add support for datadog monitors/alerts ([#2](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/issues/2)) ([bb7c5cc](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/bb7c5cce8c68fa60ebe5b49119b94a72a7a4227a))

## 1.0.0 (2022-05-13)


### Features

* release first version ([69c98e1](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/commit/69c98e16f9ab670f15950c902b478210217d8275))
