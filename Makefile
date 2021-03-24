
# These commands are used to set up linotype development environment:

##
# Symfony developer install:
##
# symfony-init: Install a default symfony project with linotype bundle
# symfony-git: Replace linotype vendor with git version (run once)
# symfony-up: Shortcut to run symfony local environement
# symfony-watch: Shortcut to run webpack watch
##

symfony-install: symfony-init symfony-git

symfony-init:
	composer create-project symfony/website-skeleton symfony
	cd symfony && composer require linotype/symfony:v1.x-dev --no-cache
	cd symfony && composer require linotype/linotype:v1.x-dev --no-cache
	cd symfony && composer require linotype/console:v1.x-dev --no-cache
	cd symfony && composer require linotype/installers:v1.x-dev --no-cache
	cd symfony && composer require linotype/starter:v1.x-dev --no-cache
	cd symfony && yarn --cwd linotype/Base install
	cd symfony && yarn --cwd linotype/Base build
	@echo "linotype:\n  resource: '@LinotypeBundle/Resources/config/routes.yaml' " > symfony/config/routes/linotype.yaml
	@echo "twig:\n  default_path: '%kernel.project_dir%/linotype'  " > symfony/config/packages/twig.yaml

symfony-git:
	cd symfony && rm -rf vendor/linotype/linotype
	cd symfony && git clone https://github.com/linotype/linotype.git vendor/linotype/linotype
	cd symfony && rm -rf vendor/linotype/console
	cd symfony && git clone https://github.com/linotype/console.git vendor/linotype/console
	cd symfony && rm -rf vendor/linotype/installers
	cd symfony && git clone https://github.com/linotype/installers.git vendor/linotype/installers
	cd symfony && rm -rf vendor/linotype/symfony
	cd symfony && git clone https://github.com/linotype/symfony.git vendor/linotype/symfony
	cd symfony && rm -rf linotype
	cd symfony && git clone https://github.com/linotype/starter.git linotype
	echo ''

symfony-up:
	cd symfony && symfony serve

symfony-watch:
	cd symfony && yarn --cwd linotype/Base watch

##
# Drupal developer install:
##
# TODO
##

##
# Wordpress developer install:
##
# TODO
##

##
# Standalone developer install:
##
# TODO
##