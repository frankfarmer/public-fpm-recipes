#!/bin/bash

cd /app/recipes/$1

sudo fpm-cook install-deps
fpm-cook package
cd /app

mv recipes/*/pkg/*.deb .