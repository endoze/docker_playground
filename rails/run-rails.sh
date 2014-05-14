#!/bin/bash

cd docker_rails && rake db:create && rails server
