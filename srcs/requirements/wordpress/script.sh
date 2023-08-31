#!/bin/bash

wp cli update
wp core download --allow-root --path=wpclidemo.dev

php-fpm7.4 -RF